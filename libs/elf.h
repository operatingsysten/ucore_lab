#ifndef __LIBS_ELF_H__
#define __LIBS_ELF_H__

#include <defs.h>

#define ELF_MAGIC    0x464C457FU            // "\x7FELF" in little endian

/* file header */
struct elfhdr {
    uint32_t e_magic;     // must equal ELF_MAGIC
    uint8_t e_elf[12];
    uint16_t e_type;      // 1=relocatable, 2=executable, 3=shared object, 4=core image   
                          // 目标文件类型 1=可重定位文件 2=可执行文件  3=共享目标文件  4=Core文件（转储格式）
    uint16_t e_machine;   // 3=x86, 4=68K, etc.   给出文件的目标体系结构类型  
    uint32_t e_version;   // file version, always 1   目标文件版本  0=非法版本  1=当前版本
    uint32_t e_entry;     // entry point if executable    程序入口的虚拟地址 
    uint32_t e_phoff;     // file position of program header or 0   程序头部表格的偏移量（按字节计算）。如果文件没有程序头部表格，可以为0
    uint32_t e_shoff;     // file position of section header or 0   截取头部表格的偏移量（按字节计算）。可以为0
    uint32_t e_flags;     // architecture-specific flags, usually 0   保存与文件相关的，特定于处理器的标志。标志名采用 EF_machine_flag的格式
    uint16_t e_ehsize;    // size of this elf header  ELF头部的大小（按字节计算）
    uint16_t e_phentsize; // size of an entry in program header    程序头部表格的表项大小（按字节计算）
    uint16_t e_phnum;     // number of entries in program header or 0   程序头部表格的表项数目，可以为0
    uint16_t e_shentsize; // size of an entry in section header     节区头部表格的表项大小（按字节计算）
    uint16_t e_shnum;     // number of entries in section header or 0     节区头部表格的表项数目，可以为0 
    uint16_t e_shstrndx;  // section number that contains section name strings   节区头部表格中与节区名称字符串表相关的表项的索引。如果文件没有节区名称字符串表，此参数可以为SHN_UNDEF
};

/* program section header */
struct proghdr {
    uint32_t p_type;   // loadable code or data, dynamic linking info,etc. 此数组元素描述的段的类型
    uint32_t p_offset; // file offset of segment     从文件头到该段第一个字节的偏移
    uint32_t p_va;     // virtual address to map segment   段的第一个字节将被放到内存中的虚拟地址
    uint32_t p_pa;     // physical address, not used      仅用于与物理地址相关的系统中
    uint32_t p_filesz; // size of segment in file      段在文件映像中所占的字节数，可以为0
    uint32_t p_memsz;  // size of segment in memory (bigger if contains bss）    段在内存映像中占用的字节数，可以为0
    uint32_t p_flags;  // read/write/execute bits    与段相关的标志
    uint32_t p_align;  // required alignment, invariably hardware page size   段在文件中和内存中如何对其，0和1表示不需要对齐，否则p_align应该是个正整数，并且是2的幂次数。
};

#endif /* !__LIBS_ELF_H__ */

