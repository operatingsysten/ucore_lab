#include <defs.h>
#include <x86.h>
#include <elf.h>

/* *********************************************************************
 * This a dirt simple boot loader, whose sole job is to boot
 * an ELF kernel image from the first IDE hard disk.
 *
 * DISK LAYOUT
 *  * This program(bootasm.S and bootmain.c) is the bootloader.
 *    It should be stored in the first sector of the disk.
 *
 *  * The 2nd sector onward holds the kernel image.
 *
 *  * The kernel image must be in ELF format.
 *
 * BOOT UP STEPS
 *  * when the CPU boots it loads the BIOS into memory and executes it
 *
 *  * the BIOS intializes devices, sets of the interrupt routines, and
 *    reads the first sector of the boot device(e.g., hard-drive)
 *    into memory and jumps to it.
 *
 *  * Assuming this boot loader is stored in the first sector of the
 *    hard-drive, this code takes over...
 *
 *  * control starts in bootasm.S -- which sets up protected mode,
 *    and a stack so C code then run, then calls bootmain()
 *
 *  * bootmain() in this file takes over, reads in the kernel and jumps to it.
 * */
unsigned int    SECTSIZE  =      512 ;      //表示一个扇区的大小
struct elfhdr * ELFHDR    =      ((struct elfhdr *)0x10000) ;     // scratch space 表示虚拟地址的起始地址

/* waitdisk - wait for disk ready */
static void
waitdisk(void) {
    //0x1F7表示0号硬盘的状态寄存器，当状态寄存器的最高两位是01时，表示空闲状态
    //inb(0x1F7) & 0xC0 表示将0x1F7端口所代表的状态寄存器的值和0xC0做与操作 观察0x1F7的最高两位是否是01
    //如果是01，表示空闲，跳出循环，如果不是，则继续循环。
    while ((inb(0x1F7) & 0xC0) != 0x40)
        /* do nothing */;
}

/* readsect - read a single sector at @secno into @dst */
//从secno指定的扇区读取数据到dst位置
static void
readsect(void *dst, uint32_t secno) {
    // wait for disk to be ready
    waitdisk();
    //0x1f2表示要取的扇区数
    //0x1f3表示LBA参数的0-7位  0x1f4表示LAB参数的8-15位   0x1f5表示LBA参数的16-23位
    //0x1f6  第0-3位表示LBA模式的24-27位  第4位:为0主盘，为1从盘  第6位：为1=LBA模式；0=CHS模式	第7位和第5位必须为1
    //0x1f7  状态和命令寄存器。操作时先给命令，再读取，如果不是忙状态就从0x1f0端口读数据
    outb(0x1F2, 1);                         // count = 1   要读取一个扇区
    outb(0x1F3, secno & 0xFF);
    outb(0x1F4, (secno >> 8) & 0xFF);
    outb(0x1F5, (secno >> 16) & 0xFF);
    outb(0x1F6, ((secno >> 24) & 0xF) | 0xE0);      //第28位=0表示访问“Disk 0”
    outb(0x1F7, 0x20);                      // cmd 0x20 - read sectors  发出要读取磁盘扇区的命令

    // wait for disk to be ready
    waitdisk();

    // read a sector
    insl(0x1F0, dst, SECTSIZE / 4);       //将磁盘扇区的数据读到dst内存中
}

/* *
 * readseg - read @count bytes at @offset from kernel into virtual address @va,
 * might copy more than asked.
 * */
static void
/*
readseg简单包装了readsect，可以从设备读取任意长度的内容。
*下面的第一个参数表示的虚拟地址的起始地址
*第二个参数表示读取数据的总大小
*第三个表示偏移量
*/
readseg(uintptr_t va, uint32_t count, uint32_t offset) {
    uintptr_t end_va = va + count;        //end_va表示读取数据的结束地址

    // round down to sector boundary
    va -= offset % SECTSIZE;              //SECTSIZE表示的是一个扇区的长度，这里用起始地址减去偏移地址，得到的是块的首地址

    // translate from bytes to sectors; kernel starts at sector 1
    uint32_t secno = (offset / SECTSIZE) + 1;         // 加1因为0扇区被引导占用   ELF文件从1扇区开始

    // If this is too slow, we could read lots of sectors at a time.
    // We'd write more to memory than asked, but it doesn't matter --
    // we load in increasing order.
    // 通过for循环将end_va和va地址之间的数据读取到内存中
    for (; va < end_va; va += SECTSIZE, secno ++) {
        readsect((void *)va, secno);
    }
}

/* bootmain - the entry of bootloader */
void
bootmain(void) {
    // read the 1st page off disk   从ucore内核镜像 偏移为0处读入一页 至0x10000  读入ELF header和program header table
    readseg((uintptr_t)ELFHDR, SECTSIZE * 8, 0);   //将硬盘的8个扇区大小的数据读取到ELFHDR所开始的内存地址中  ELF的头占据8个扇区的大小

    // is this a valid ELF?   通过储存在头部的magic变量判断是否是合法的ELF文件  elf.h中定义ELFHDR结构中的变量e_magic=ELF_MAGIC
    if (ELFHDR->e_magic != ELF_MAGIC) {
        goto bad;           //如果ELF头部不合法 则跳转到bad标号处
    }

    struct proghdr *ph, *eph;    //proghdr表示存储程序块的结构体 在elf.h中定义 ph在这里定义的是指向elf的首地址 eph在这里表示指向elf的尾地址
    //ELF头部有描述ELF文件应加载到内存什么位置的描述表， 先将描述表的头地址存在ph
    // load each program segment (ignores ph flags)
    ph = (struct proghdr *)((uintptr_t)ELFHDR + ELFHDR->e_phoff);   //e_phoff表示elf程序头表的偏移地址 ph为基地址加上偏移地址 指的是首地址
    eph = ph + ELFHDR->e_phnum;     //ph为首地址 e_phnum表示program head表的入口数目 eph指向elf文件的尾地址

    // 按照描述表 通过for循环将ELF文件中数据载入内存
    for (; ph < eph; ph ++) {   
        readseg(ph->p_va & 0xFFFFFF, ph->p_memsz, ph->p_offset);
    }

    // call the entry point from the ELF header
    // note: does not return
     // 根据ELF头部储存的入口信息，找到内核的入口
    ((void (*)(void))(ELFHDR->e_entry & 0xFFFFFF))();

bad:
    outw(0x8A00, 0x8A00);
    outw(0x8A00, 0x8E00);

    /* do nothing */
    while (1);
}

