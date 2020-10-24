#include <asm.h>

#BIOS程序将该段程序加载到内存的0x7c00处
# Start the CPU: switch to 32-bit protected mode, jump into C.
# The BIOS loads this code from the first sector of the hard disk into
# memory at physical address 0x7c00 and starts executing in real mode
# with %cs=0 %ip=7c00.  由此处可以知道程序运行的cs段的值是0×0

.set PROT_MODE_CSEG,        0x8                     # kernel code segment selector
.set PROT_MODE_DSEG,        0x10                    # kernel data segment selector
.set CR0_PE_ON,             0x1                     # protected mode enable flag

# start address should be 0:7c00, in real mode, the beginning address of the running bootloader
.globl start
start:
.code16                                             # Assemble for 16-bit mode
    cli                                             # Disable interrupts 关中断
    cld                                             # String operations increment  清除方向标志

    # Set up the important data segment registers (DS, ES, SS).
    xorw %ax, %ax                                   # Segment number zero  寄存器清零
    movw %ax, %ds                                   # -> Data Segment
    movw %ax, %es                                   # -> Extra Segment
    movw %ax, %ss                                   # -> Stack Segment

    # Enable A20:
    #  For backwards compatibility with the earliest PCs, physical
    #  address line 20 is tied low, so that addresses higher than
    #  1MB wrap around to zero by default. This code undoes this.
    #打开A20，准备进入保护模式
seta20.1:                                           #等待8042键盘控制器不忙  Wait for not busy(8042 input buffer empty).
    inb $0x64, %al                                  #读取0x64端口，相当于读8042的status register
    testb $0x2, %al                                 #判断status register的低两位是否为0，bit0为0表示output register（60h）中没有数据
                                                    #bit1为0表示input register（60h/64h）没有数据  若bit0和bit1都为0，则zf=1
    jnz seta20.1                                    #若zf=0，则跳转  即当8042的input和output寄存器都有数据时，跳转
    
    #写output port：向64h发送0d1h命令，然后向60h写入output port的数据
    movb $0xd1, %al                                 # 0xd1 -> port 0x64   发送写命令到8042芯片输出端口P2
    outb %al, $0x64                                 # 0xd1 means: write data to 8042's P2 port

seta20.2:
    inb $0x64, %al                                  # Wait for not busy(8042 input buffer empty). 等待8042键盘控制器不忙
    testb $0x2, %al
    jnz seta20.2
                                                    #将8042输出端口P2的第二位置为1，开启A20
    movb $0xdf, %al                                 # 0xdf -> port 0x60
    outb %al, $0x60                                 # 0xdf = 11011111, means set P2's A20 bit(the 1 bit) to 1  

    # Switch from real to protected mode, using a bootstrap GDT
    # and segment translation that makes virtual addresses
    # identical to physical addresses, so that the
    # effective memory map does not change during the switch.
    #进入保护模式以后不能按照cs：ip去算取指令的地址或者说是跳转的地址计算方法变了
    lgdt gdtdesc                                    #将GDT入口地址存到gdtdesc寄存器里
    movl %cr0, %eax                                 #通过将cr0寄存器PE位置1便开启了保护模式
    orl $CR0_PE_ON, %eax
    movl %eax, %cr0

    # Jump to next instruction, but in 32-bit code segment.
    # Switches processor into 32-bit mode.
    #PROT_MODE_CSEG代表段选择子，$protcseg代表接下来指令的链接地址，也就是可执行程序在内存中的虚拟地址。
    ljmp $PROT_MODE_CSEG, $protcseg                 #通过长跳转更新cs的基地址


#进入保护模式后，程序重新对段寄存器进行初始化并且赋值了堆栈指针后便跳转到bootmain.c

.code32                                             # Assemble for 32-bit mode
protcseg:
    # Set up the protected-mode data segment registers   #设置段寄存器，并建立堆栈
    movw $PROT_MODE_DSEG, %ax                       # Our data segment selector （movw把 16 位立即数放到寄存器的底16位，高16位清0）
    movw %ax, %ds                                   # -> DS: Data Segment    
    movw %ax, %es                                   # -> ES: Extra Segment
    movw %ax, %fs                                   # -> FS
    movw %ax, %gs                                   # -> GS
    movw %ax, %ss                                   # -> SS: Stack Segment

    # Set up the stack pointer and call into C. The stack region is from 0--start(0x7c00)
    movl $0x0, %ebp
    movl $start, %esp
    call bootmain                                   #转到保护模式完成，进入boot主方法

    # If bootmain returns (it shouldn't), loop.
spin:
    jmp spin

# Bootstrap GDT
.p2align 2                                          # force 4 byte alignment   向后移动位置计数器置为4字节的倍数 为了内存对齐
gdt:
    SEG_NULLASM                                     # null seg      空段
    SEG_ASM(STA_X|STA_R, 0x0, 0xffffffff)           # code seg for bootloader and kernel    代码段（可读可执行）
    SEG_ASM(STA_W, 0x0, 0xffffffff)                 # data seg for bootloader and kernel    数据段（可读可写）

gdtdesc:
    .word 0x17                                      # sizeof(gdt) - 1       gdt表的大小
    .long gdt                                       # address gdt           gdt表的位置
