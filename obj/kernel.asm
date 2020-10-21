
bin/kernel：     文件格式 elf32-i386


Disassembly of section .text:

00100000 <kern_init>:
int kern_init(void) __attribute__((noreturn));
void grade_backtrace(void);
static void lab1_switch_test(void);

int
kern_init(void) {
  100000:	f3 0f 1e fb          	endbr32 
  100004:	55                   	push   %ebp
  100005:	89 e5                	mov    %esp,%ebp
  100007:	83 ec 28             	sub    $0x28,%esp
    extern char edata[], end[];
    memset(edata, 0, end - edata);
  10000a:	b8 20 0d 11 00       	mov    $0x110d20,%eax
  10000f:	2d 16 fa 10 00       	sub    $0x10fa16,%eax
  100014:	89 44 24 08          	mov    %eax,0x8(%esp)
  100018:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  10001f:	00 
  100020:	c7 04 24 16 fa 10 00 	movl   $0x10fa16,(%esp)
  100027:	e8 75 2d 00 00       	call   102da1 <memset>

    cons_init();                // init the console
  10002c:	e8 0d 16 00 00       	call   10163e <cons_init>

    const char *message = "(THU.CST) os is loading ...";
  100031:	c7 45 f4 e0 35 10 00 	movl   $0x1035e0,-0xc(%ebp)
    cprintf("%s\n\n", message);
  100038:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10003b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10003f:	c7 04 24 fc 35 10 00 	movl   $0x1035fc,(%esp)
  100046:	e8 39 02 00 00       	call   100284 <cprintf>

    print_kerninfo();
  10004b:	e8 f7 08 00 00       	call   100947 <print_kerninfo>

    grade_backtrace();
  100050:	e8 95 00 00 00       	call   1000ea <grade_backtrace>

    pmm_init();                 // init physical memory management
  100055:	e8 f6 29 00 00       	call   102a50 <pmm_init>

    pic_init();                 // init interrupt controller
  10005a:	e8 34 17 00 00       	call   101793 <pic_init>
    idt_init();                 // init interrupt descriptor table
  10005f:	e8 b4 18 00 00       	call   101918 <idt_init>

    clock_init();               // init clock interrupt
  100064:	e8 5a 0d 00 00       	call   100dc3 <clock_init>
    intr_enable();              // enable irq interrupt
  100069:	e8 71 18 00 00       	call   1018df <intr_enable>
    //LAB1: CAHLLENGE 1 If you try to do it, uncomment lab1_switch_test()
    // user/kernel mode switch test
    //lab1_switch_test();

    /* do nothing */
    while (1);
  10006e:	eb fe                	jmp    10006e <kern_init+0x6e>

00100070 <grade_backtrace2>:
}

void __attribute__((noinline))
grade_backtrace2(int arg0, int arg1, int arg2, int arg3) {
  100070:	f3 0f 1e fb          	endbr32 
  100074:	55                   	push   %ebp
  100075:	89 e5                	mov    %esp,%ebp
  100077:	83 ec 18             	sub    $0x18,%esp
    mon_backtrace(0, NULL, NULL);
  10007a:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  100081:	00 
  100082:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  100089:	00 
  10008a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100091:	e8 17 0d 00 00       	call   100dad <mon_backtrace>
}
  100096:	90                   	nop
  100097:	c9                   	leave  
  100098:	c3                   	ret    

00100099 <grade_backtrace1>:

void __attribute__((noinline))
grade_backtrace1(int arg0, int arg1) {
  100099:	f3 0f 1e fb          	endbr32 
  10009d:	55                   	push   %ebp
  10009e:	89 e5                	mov    %esp,%ebp
  1000a0:	53                   	push   %ebx
  1000a1:	83 ec 14             	sub    $0x14,%esp
    grade_backtrace2(arg0, (int)&arg0, arg1, (int)&arg1);
  1000a4:	8d 4d 0c             	lea    0xc(%ebp),%ecx
  1000a7:	8b 55 0c             	mov    0xc(%ebp),%edx
  1000aa:	8d 5d 08             	lea    0x8(%ebp),%ebx
  1000ad:	8b 45 08             	mov    0x8(%ebp),%eax
  1000b0:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  1000b4:	89 54 24 08          	mov    %edx,0x8(%esp)
  1000b8:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  1000bc:	89 04 24             	mov    %eax,(%esp)
  1000bf:	e8 ac ff ff ff       	call   100070 <grade_backtrace2>
}
  1000c4:	90                   	nop
  1000c5:	83 c4 14             	add    $0x14,%esp
  1000c8:	5b                   	pop    %ebx
  1000c9:	5d                   	pop    %ebp
  1000ca:	c3                   	ret    

001000cb <grade_backtrace0>:

void __attribute__((noinline))
grade_backtrace0(int arg0, int arg1, int arg2) {
  1000cb:	f3 0f 1e fb          	endbr32 
  1000cf:	55                   	push   %ebp
  1000d0:	89 e5                	mov    %esp,%ebp
  1000d2:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace1(arg0, arg2);
  1000d5:	8b 45 10             	mov    0x10(%ebp),%eax
  1000d8:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000dc:	8b 45 08             	mov    0x8(%ebp),%eax
  1000df:	89 04 24             	mov    %eax,(%esp)
  1000e2:	e8 b2 ff ff ff       	call   100099 <grade_backtrace1>
}
  1000e7:	90                   	nop
  1000e8:	c9                   	leave  
  1000e9:	c3                   	ret    

001000ea <grade_backtrace>:

void
grade_backtrace(void) {
  1000ea:	f3 0f 1e fb          	endbr32 
  1000ee:	55                   	push   %ebp
  1000ef:	89 e5                	mov    %esp,%ebp
  1000f1:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace0(0, (int)kern_init, 0xffff0000);
  1000f4:	b8 00 00 10 00       	mov    $0x100000,%eax
  1000f9:	c7 44 24 08 00 00 ff 	movl   $0xffff0000,0x8(%esp)
  100100:	ff 
  100101:	89 44 24 04          	mov    %eax,0x4(%esp)
  100105:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  10010c:	e8 ba ff ff ff       	call   1000cb <grade_backtrace0>
}
  100111:	90                   	nop
  100112:	c9                   	leave  
  100113:	c3                   	ret    

00100114 <lab1_print_cur_status>:

static void
lab1_print_cur_status(void) {
  100114:	f3 0f 1e fb          	endbr32 
  100118:	55                   	push   %ebp
  100119:	89 e5                	mov    %esp,%ebp
  10011b:	83 ec 28             	sub    $0x28,%esp
    static int round = 0;
    uint16_t reg1, reg2, reg3, reg4;
    asm volatile (
  10011e:	8c 4d f6             	mov    %cs,-0xa(%ebp)
  100121:	8c 5d f4             	mov    %ds,-0xc(%ebp)
  100124:	8c 45 f2             	mov    %es,-0xe(%ebp)
  100127:	8c 55 f0             	mov    %ss,-0x10(%ebp)
            "mov %%cs, %0;"
            "mov %%ds, %1;"
            "mov %%es, %2;"
            "mov %%ss, %3;"
            : "=m"(reg1), "=m"(reg2), "=m"(reg3), "=m"(reg4));
    cprintf("%d: @ring %d\n", round, reg1 & 3);
  10012a:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10012e:	83 e0 03             	and    $0x3,%eax
  100131:	89 c2                	mov    %eax,%edx
  100133:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  100138:	89 54 24 08          	mov    %edx,0x8(%esp)
  10013c:	89 44 24 04          	mov    %eax,0x4(%esp)
  100140:	c7 04 24 01 36 10 00 	movl   $0x103601,(%esp)
  100147:	e8 38 01 00 00       	call   100284 <cprintf>
    cprintf("%d:  cs = %x\n", round, reg1);
  10014c:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100150:	89 c2                	mov    %eax,%edx
  100152:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  100157:	89 54 24 08          	mov    %edx,0x8(%esp)
  10015b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10015f:	c7 04 24 0f 36 10 00 	movl   $0x10360f,(%esp)
  100166:	e8 19 01 00 00       	call   100284 <cprintf>
    cprintf("%d:  ds = %x\n", round, reg2);
  10016b:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  10016f:	89 c2                	mov    %eax,%edx
  100171:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  100176:	89 54 24 08          	mov    %edx,0x8(%esp)
  10017a:	89 44 24 04          	mov    %eax,0x4(%esp)
  10017e:	c7 04 24 1d 36 10 00 	movl   $0x10361d,(%esp)
  100185:	e8 fa 00 00 00       	call   100284 <cprintf>
    cprintf("%d:  es = %x\n", round, reg3);
  10018a:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  10018e:	89 c2                	mov    %eax,%edx
  100190:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  100195:	89 54 24 08          	mov    %edx,0x8(%esp)
  100199:	89 44 24 04          	mov    %eax,0x4(%esp)
  10019d:	c7 04 24 2b 36 10 00 	movl   $0x10362b,(%esp)
  1001a4:	e8 db 00 00 00       	call   100284 <cprintf>
    cprintf("%d:  ss = %x\n", round, reg4);
  1001a9:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  1001ad:	89 c2                	mov    %eax,%edx
  1001af:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  1001b4:	89 54 24 08          	mov    %edx,0x8(%esp)
  1001b8:	89 44 24 04          	mov    %eax,0x4(%esp)
  1001bc:	c7 04 24 39 36 10 00 	movl   $0x103639,(%esp)
  1001c3:	e8 bc 00 00 00       	call   100284 <cprintf>
    round ++;
  1001c8:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  1001cd:	40                   	inc    %eax
  1001ce:	a3 20 fa 10 00       	mov    %eax,0x10fa20
}
  1001d3:	90                   	nop
  1001d4:	c9                   	leave  
  1001d5:	c3                   	ret    

001001d6 <lab1_switch_to_user>:

static void
lab1_switch_to_user(void) {
  1001d6:	f3 0f 1e fb          	endbr32 
  1001da:	55                   	push   %ebp
  1001db:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 : TODO
}
  1001dd:	90                   	nop
  1001de:	5d                   	pop    %ebp
  1001df:	c3                   	ret    

001001e0 <lab1_switch_to_kernel>:

static void
lab1_switch_to_kernel(void) {
  1001e0:	f3 0f 1e fb          	endbr32 
  1001e4:	55                   	push   %ebp
  1001e5:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 :  TODO
}
  1001e7:	90                   	nop
  1001e8:	5d                   	pop    %ebp
  1001e9:	c3                   	ret    

001001ea <lab1_switch_test>:

static void
lab1_switch_test(void) {
  1001ea:	f3 0f 1e fb          	endbr32 
  1001ee:	55                   	push   %ebp
  1001ef:	89 e5                	mov    %esp,%ebp
  1001f1:	83 ec 18             	sub    $0x18,%esp
    lab1_print_cur_status();
  1001f4:	e8 1b ff ff ff       	call   100114 <lab1_print_cur_status>
    cprintf("+++ switch to  user  mode +++\n");
  1001f9:	c7 04 24 48 36 10 00 	movl   $0x103648,(%esp)
  100200:	e8 7f 00 00 00       	call   100284 <cprintf>
    lab1_switch_to_user();
  100205:	e8 cc ff ff ff       	call   1001d6 <lab1_switch_to_user>
    lab1_print_cur_status();
  10020a:	e8 05 ff ff ff       	call   100114 <lab1_print_cur_status>
    cprintf("+++ switch to kernel mode +++\n");
  10020f:	c7 04 24 68 36 10 00 	movl   $0x103668,(%esp)
  100216:	e8 69 00 00 00       	call   100284 <cprintf>
    lab1_switch_to_kernel();
  10021b:	e8 c0 ff ff ff       	call   1001e0 <lab1_switch_to_kernel>
    lab1_print_cur_status();
  100220:	e8 ef fe ff ff       	call   100114 <lab1_print_cur_status>
}
  100225:	90                   	nop
  100226:	c9                   	leave  
  100227:	c3                   	ret    

00100228 <cputch>:
/* *
 * cputch - writes a single character @c to stdout, and it will
 * increace the value of counter pointed by @cnt.
 * */
static void
cputch(int c, int *cnt) {
  100228:	f3 0f 1e fb          	endbr32 
  10022c:	55                   	push   %ebp
  10022d:	89 e5                	mov    %esp,%ebp
  10022f:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  100232:	8b 45 08             	mov    0x8(%ebp),%eax
  100235:	89 04 24             	mov    %eax,(%esp)
  100238:	e8 32 14 00 00       	call   10166f <cons_putc>
    (*cnt) ++;
  10023d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100240:	8b 00                	mov    (%eax),%eax
  100242:	8d 50 01             	lea    0x1(%eax),%edx
  100245:	8b 45 0c             	mov    0xc(%ebp),%eax
  100248:	89 10                	mov    %edx,(%eax)
}
  10024a:	90                   	nop
  10024b:	c9                   	leave  
  10024c:	c3                   	ret    

0010024d <vcprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want cprintf() instead.
 * */
int
vcprintf(const char *fmt, va_list ap) {
  10024d:	f3 0f 1e fb          	endbr32 
  100251:	55                   	push   %ebp
  100252:	89 e5                	mov    %esp,%ebp
  100254:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  100257:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    vprintfmt((void*)cputch, &cnt, fmt, ap);
  10025e:	8b 45 0c             	mov    0xc(%ebp),%eax
  100261:	89 44 24 0c          	mov    %eax,0xc(%esp)
  100265:	8b 45 08             	mov    0x8(%ebp),%eax
  100268:	89 44 24 08          	mov    %eax,0x8(%esp)
  10026c:	8d 45 f4             	lea    -0xc(%ebp),%eax
  10026f:	89 44 24 04          	mov    %eax,0x4(%esp)
  100273:	c7 04 24 28 02 10 00 	movl   $0x100228,(%esp)
  10027a:	e8 8e 2e 00 00       	call   10310d <vprintfmt>
    return cnt;
  10027f:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100282:	c9                   	leave  
  100283:	c3                   	ret    

00100284 <cprintf>:
 *
 * The return value is the number of characters which would be
 * written to stdout.
 * */
int
cprintf(const char *fmt, ...) {
  100284:	f3 0f 1e fb          	endbr32 
  100288:	55                   	push   %ebp
  100289:	89 e5                	mov    %esp,%ebp
  10028b:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  10028e:	8d 45 0c             	lea    0xc(%ebp),%eax
  100291:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vcprintf(fmt, ap);
  100294:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100297:	89 44 24 04          	mov    %eax,0x4(%esp)
  10029b:	8b 45 08             	mov    0x8(%ebp),%eax
  10029e:	89 04 24             	mov    %eax,(%esp)
  1002a1:	e8 a7 ff ff ff       	call   10024d <vcprintf>
  1002a6:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  1002a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1002ac:	c9                   	leave  
  1002ad:	c3                   	ret    

001002ae <cputchar>:

/* cputchar - writes a single character to stdout */
void
cputchar(int c) {
  1002ae:	f3 0f 1e fb          	endbr32 
  1002b2:	55                   	push   %ebp
  1002b3:	89 e5                	mov    %esp,%ebp
  1002b5:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  1002b8:	8b 45 08             	mov    0x8(%ebp),%eax
  1002bb:	89 04 24             	mov    %eax,(%esp)
  1002be:	e8 ac 13 00 00       	call   10166f <cons_putc>
}
  1002c3:	90                   	nop
  1002c4:	c9                   	leave  
  1002c5:	c3                   	ret    

001002c6 <cputs>:
/* *
 * cputs- writes the string pointed by @str to stdout and
 * appends a newline character.
 * */
int
cputs(const char *str) {
  1002c6:	f3 0f 1e fb          	endbr32 
  1002ca:	55                   	push   %ebp
  1002cb:	89 e5                	mov    %esp,%ebp
  1002cd:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  1002d0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    char c;
    while ((c = *str ++) != '\0') {
  1002d7:	eb 13                	jmp    1002ec <cputs+0x26>
        cputch(c, &cnt);
  1002d9:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  1002dd:	8d 55 f0             	lea    -0x10(%ebp),%edx
  1002e0:	89 54 24 04          	mov    %edx,0x4(%esp)
  1002e4:	89 04 24             	mov    %eax,(%esp)
  1002e7:	e8 3c ff ff ff       	call   100228 <cputch>
    while ((c = *str ++) != '\0') {
  1002ec:	8b 45 08             	mov    0x8(%ebp),%eax
  1002ef:	8d 50 01             	lea    0x1(%eax),%edx
  1002f2:	89 55 08             	mov    %edx,0x8(%ebp)
  1002f5:	0f b6 00             	movzbl (%eax),%eax
  1002f8:	88 45 f7             	mov    %al,-0x9(%ebp)
  1002fb:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
  1002ff:	75 d8                	jne    1002d9 <cputs+0x13>
    }
    cputch('\n', &cnt);
  100301:	8d 45 f0             	lea    -0x10(%ebp),%eax
  100304:	89 44 24 04          	mov    %eax,0x4(%esp)
  100308:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
  10030f:	e8 14 ff ff ff       	call   100228 <cputch>
    return cnt;
  100314:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  100317:	c9                   	leave  
  100318:	c3                   	ret    

00100319 <getchar>:

/* getchar - reads a single non-zero character from stdin */
int
getchar(void) {
  100319:	f3 0f 1e fb          	endbr32 
  10031d:	55                   	push   %ebp
  10031e:	89 e5                	mov    %esp,%ebp
  100320:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = cons_getc()) == 0)
  100323:	90                   	nop
  100324:	e8 74 13 00 00       	call   10169d <cons_getc>
  100329:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10032c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100330:	74 f2                	je     100324 <getchar+0xb>
        /* do nothing */;
    return c;
  100332:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100335:	c9                   	leave  
  100336:	c3                   	ret    

00100337 <readline>:
 * The readline() function returns the text of the line read. If some errors
 * are happened, NULL is returned. The return value is a global variable,
 * thus it should be copied before it is used.
 * */
char *
readline(const char *prompt) {
  100337:	f3 0f 1e fb          	endbr32 
  10033b:	55                   	push   %ebp
  10033c:	89 e5                	mov    %esp,%ebp
  10033e:	83 ec 28             	sub    $0x28,%esp
    if (prompt != NULL) {
  100341:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100345:	74 13                	je     10035a <readline+0x23>
        cprintf("%s", prompt);
  100347:	8b 45 08             	mov    0x8(%ebp),%eax
  10034a:	89 44 24 04          	mov    %eax,0x4(%esp)
  10034e:	c7 04 24 87 36 10 00 	movl   $0x103687,(%esp)
  100355:	e8 2a ff ff ff       	call   100284 <cprintf>
    }
    int i = 0, c;
  10035a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        c = getchar();
  100361:	e8 b3 ff ff ff       	call   100319 <getchar>
  100366:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if (c < 0) {
  100369:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  10036d:	79 07                	jns    100376 <readline+0x3f>
            return NULL;
  10036f:	b8 00 00 00 00       	mov    $0x0,%eax
  100374:	eb 78                	jmp    1003ee <readline+0xb7>
        }
        else if (c >= ' ' && i < BUFSIZE - 1) {
  100376:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
  10037a:	7e 28                	jle    1003a4 <readline+0x6d>
  10037c:	81 7d f4 fe 03 00 00 	cmpl   $0x3fe,-0xc(%ebp)
  100383:	7f 1f                	jg     1003a4 <readline+0x6d>
            cputchar(c);
  100385:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100388:	89 04 24             	mov    %eax,(%esp)
  10038b:	e8 1e ff ff ff       	call   1002ae <cputchar>
            buf[i ++] = c;
  100390:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100393:	8d 50 01             	lea    0x1(%eax),%edx
  100396:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100399:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10039c:	88 90 40 fa 10 00    	mov    %dl,0x10fa40(%eax)
  1003a2:	eb 45                	jmp    1003e9 <readline+0xb2>
        }
        else if (c == '\b' && i > 0) {
  1003a4:	83 7d f0 08          	cmpl   $0x8,-0x10(%ebp)
  1003a8:	75 16                	jne    1003c0 <readline+0x89>
  1003aa:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1003ae:	7e 10                	jle    1003c0 <readline+0x89>
            cputchar(c);
  1003b0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1003b3:	89 04 24             	mov    %eax,(%esp)
  1003b6:	e8 f3 fe ff ff       	call   1002ae <cputchar>
            i --;
  1003bb:	ff 4d f4             	decl   -0xc(%ebp)
  1003be:	eb 29                	jmp    1003e9 <readline+0xb2>
        }
        else if (c == '\n' || c == '\r') {
  1003c0:	83 7d f0 0a          	cmpl   $0xa,-0x10(%ebp)
  1003c4:	74 06                	je     1003cc <readline+0x95>
  1003c6:	83 7d f0 0d          	cmpl   $0xd,-0x10(%ebp)
  1003ca:	75 95                	jne    100361 <readline+0x2a>
            cputchar(c);
  1003cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1003cf:	89 04 24             	mov    %eax,(%esp)
  1003d2:	e8 d7 fe ff ff       	call   1002ae <cputchar>
            buf[i] = '\0';
  1003d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1003da:	05 40 fa 10 00       	add    $0x10fa40,%eax
  1003df:	c6 00 00             	movb   $0x0,(%eax)
            return buf;
  1003e2:	b8 40 fa 10 00       	mov    $0x10fa40,%eax
  1003e7:	eb 05                	jmp    1003ee <readline+0xb7>
        c = getchar();
  1003e9:	e9 73 ff ff ff       	jmp    100361 <readline+0x2a>
        }
    }
}
  1003ee:	c9                   	leave  
  1003ef:	c3                   	ret    

001003f0 <__panic>:
/* *
 * __panic - __panic is called on unresolvable fatal errors. it prints
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
  1003f0:	f3 0f 1e fb          	endbr32 
  1003f4:	55                   	push   %ebp
  1003f5:	89 e5                	mov    %esp,%ebp
  1003f7:	83 ec 28             	sub    $0x28,%esp
    if (is_panic) {
  1003fa:	a1 40 fe 10 00       	mov    0x10fe40,%eax
  1003ff:	85 c0                	test   %eax,%eax
  100401:	75 5b                	jne    10045e <__panic+0x6e>
        goto panic_dead;
    }
    is_panic = 1;
  100403:	c7 05 40 fe 10 00 01 	movl   $0x1,0x10fe40
  10040a:	00 00 00 

    // print the 'message'
    va_list ap;
    va_start(ap, fmt);
  10040d:	8d 45 14             	lea    0x14(%ebp),%eax
  100410:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel panic at %s:%d:\n    ", file, line);
  100413:	8b 45 0c             	mov    0xc(%ebp),%eax
  100416:	89 44 24 08          	mov    %eax,0x8(%esp)
  10041a:	8b 45 08             	mov    0x8(%ebp),%eax
  10041d:	89 44 24 04          	mov    %eax,0x4(%esp)
  100421:	c7 04 24 8a 36 10 00 	movl   $0x10368a,(%esp)
  100428:	e8 57 fe ff ff       	call   100284 <cprintf>
    vcprintf(fmt, ap);
  10042d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100430:	89 44 24 04          	mov    %eax,0x4(%esp)
  100434:	8b 45 10             	mov    0x10(%ebp),%eax
  100437:	89 04 24             	mov    %eax,(%esp)
  10043a:	e8 0e fe ff ff       	call   10024d <vcprintf>
    cprintf("\n");
  10043f:	c7 04 24 a6 36 10 00 	movl   $0x1036a6,(%esp)
  100446:	e8 39 fe ff ff       	call   100284 <cprintf>
    
    cprintf("stack trackback:\n");
  10044b:	c7 04 24 a8 36 10 00 	movl   $0x1036a8,(%esp)
  100452:	e8 2d fe ff ff       	call   100284 <cprintf>
    print_stackframe();
  100457:	e8 3d 06 00 00       	call   100a99 <print_stackframe>
  10045c:	eb 01                	jmp    10045f <__panic+0x6f>
        goto panic_dead;
  10045e:	90                   	nop
    
    va_end(ap);

panic_dead:
    intr_disable();
  10045f:	e8 87 14 00 00       	call   1018eb <intr_disable>
    while (1) {
        kmonitor(NULL);
  100464:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  10046b:	e8 64 08 00 00       	call   100cd4 <kmonitor>
  100470:	eb f2                	jmp    100464 <__panic+0x74>

00100472 <__warn>:
    }
}

/* __warn - like panic, but don't */
void
__warn(const char *file, int line, const char *fmt, ...) {
  100472:	f3 0f 1e fb          	endbr32 
  100476:	55                   	push   %ebp
  100477:	89 e5                	mov    %esp,%ebp
  100479:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    va_start(ap, fmt);
  10047c:	8d 45 14             	lea    0x14(%ebp),%eax
  10047f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel warning at %s:%d:\n    ", file, line);
  100482:	8b 45 0c             	mov    0xc(%ebp),%eax
  100485:	89 44 24 08          	mov    %eax,0x8(%esp)
  100489:	8b 45 08             	mov    0x8(%ebp),%eax
  10048c:	89 44 24 04          	mov    %eax,0x4(%esp)
  100490:	c7 04 24 ba 36 10 00 	movl   $0x1036ba,(%esp)
  100497:	e8 e8 fd ff ff       	call   100284 <cprintf>
    vcprintf(fmt, ap);
  10049c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10049f:	89 44 24 04          	mov    %eax,0x4(%esp)
  1004a3:	8b 45 10             	mov    0x10(%ebp),%eax
  1004a6:	89 04 24             	mov    %eax,(%esp)
  1004a9:	e8 9f fd ff ff       	call   10024d <vcprintf>
    cprintf("\n");
  1004ae:	c7 04 24 a6 36 10 00 	movl   $0x1036a6,(%esp)
  1004b5:	e8 ca fd ff ff       	call   100284 <cprintf>
    va_end(ap);
}
  1004ba:	90                   	nop
  1004bb:	c9                   	leave  
  1004bc:	c3                   	ret    

001004bd <is_kernel_panic>:

bool
is_kernel_panic(void) {
  1004bd:	f3 0f 1e fb          	endbr32 
  1004c1:	55                   	push   %ebp
  1004c2:	89 e5                	mov    %esp,%ebp
    return is_panic;
  1004c4:	a1 40 fe 10 00       	mov    0x10fe40,%eax
}
  1004c9:	5d                   	pop    %ebp
  1004ca:	c3                   	ret    

001004cb <stab_binsearch>:
 *      stab_binsearch(stabs, &left, &right, N_SO, 0xf0100184);
 * will exit setting left = 118, right = 554.
 * */
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
  1004cb:	f3 0f 1e fb          	endbr32 
  1004cf:	55                   	push   %ebp
  1004d0:	89 e5                	mov    %esp,%ebp
  1004d2:	83 ec 20             	sub    $0x20,%esp
    int l = *region_left, r = *region_right, any_matches = 0;
  1004d5:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004d8:	8b 00                	mov    (%eax),%eax
  1004da:	89 45 fc             	mov    %eax,-0x4(%ebp)
  1004dd:	8b 45 10             	mov    0x10(%ebp),%eax
  1004e0:	8b 00                	mov    (%eax),%eax
  1004e2:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1004e5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

    while (l <= r) {
  1004ec:	e9 ca 00 00 00       	jmp    1005bb <stab_binsearch+0xf0>
        int true_m = (l + r) / 2, m = true_m;
  1004f1:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1004f4:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1004f7:	01 d0                	add    %edx,%eax
  1004f9:	89 c2                	mov    %eax,%edx
  1004fb:	c1 ea 1f             	shr    $0x1f,%edx
  1004fe:	01 d0                	add    %edx,%eax
  100500:	d1 f8                	sar    %eax
  100502:	89 45 ec             	mov    %eax,-0x14(%ebp)
  100505:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100508:	89 45 f0             	mov    %eax,-0x10(%ebp)

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  10050b:	eb 03                	jmp    100510 <stab_binsearch+0x45>
            m --;
  10050d:	ff 4d f0             	decl   -0x10(%ebp)
        while (m >= l && stabs[m].n_type != type) {
  100510:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100513:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  100516:	7c 1f                	jl     100537 <stab_binsearch+0x6c>
  100518:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10051b:	89 d0                	mov    %edx,%eax
  10051d:	01 c0                	add    %eax,%eax
  10051f:	01 d0                	add    %edx,%eax
  100521:	c1 e0 02             	shl    $0x2,%eax
  100524:	89 c2                	mov    %eax,%edx
  100526:	8b 45 08             	mov    0x8(%ebp),%eax
  100529:	01 d0                	add    %edx,%eax
  10052b:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10052f:	0f b6 c0             	movzbl %al,%eax
  100532:	39 45 14             	cmp    %eax,0x14(%ebp)
  100535:	75 d6                	jne    10050d <stab_binsearch+0x42>
        }
        if (m < l) {    // no match in [l, m]
  100537:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10053a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  10053d:	7d 09                	jge    100548 <stab_binsearch+0x7d>
            l = true_m + 1;
  10053f:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100542:	40                   	inc    %eax
  100543:	89 45 fc             	mov    %eax,-0x4(%ebp)
            continue;
  100546:	eb 73                	jmp    1005bb <stab_binsearch+0xf0>
        }

        // actual binary search
        any_matches = 1;
  100548:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
        if (stabs[m].n_value < addr) {
  10054f:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100552:	89 d0                	mov    %edx,%eax
  100554:	01 c0                	add    %eax,%eax
  100556:	01 d0                	add    %edx,%eax
  100558:	c1 e0 02             	shl    $0x2,%eax
  10055b:	89 c2                	mov    %eax,%edx
  10055d:	8b 45 08             	mov    0x8(%ebp),%eax
  100560:	01 d0                	add    %edx,%eax
  100562:	8b 40 08             	mov    0x8(%eax),%eax
  100565:	39 45 18             	cmp    %eax,0x18(%ebp)
  100568:	76 11                	jbe    10057b <stab_binsearch+0xb0>
            *region_left = m;
  10056a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10056d:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100570:	89 10                	mov    %edx,(%eax)
            l = true_m + 1;
  100572:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100575:	40                   	inc    %eax
  100576:	89 45 fc             	mov    %eax,-0x4(%ebp)
  100579:	eb 40                	jmp    1005bb <stab_binsearch+0xf0>
        } else if (stabs[m].n_value > addr) {
  10057b:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10057e:	89 d0                	mov    %edx,%eax
  100580:	01 c0                	add    %eax,%eax
  100582:	01 d0                	add    %edx,%eax
  100584:	c1 e0 02             	shl    $0x2,%eax
  100587:	89 c2                	mov    %eax,%edx
  100589:	8b 45 08             	mov    0x8(%ebp),%eax
  10058c:	01 d0                	add    %edx,%eax
  10058e:	8b 40 08             	mov    0x8(%eax),%eax
  100591:	39 45 18             	cmp    %eax,0x18(%ebp)
  100594:	73 14                	jae    1005aa <stab_binsearch+0xdf>
            *region_right = m - 1;
  100596:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100599:	8d 50 ff             	lea    -0x1(%eax),%edx
  10059c:	8b 45 10             	mov    0x10(%ebp),%eax
  10059f:	89 10                	mov    %edx,(%eax)
            r = m - 1;
  1005a1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1005a4:	48                   	dec    %eax
  1005a5:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1005a8:	eb 11                	jmp    1005bb <stab_binsearch+0xf0>
        } else {
            // exact match for 'addr', but continue loop to find
            // *region_right
            *region_left = m;
  1005aa:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005ad:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1005b0:	89 10                	mov    %edx,(%eax)
            l = m;
  1005b2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1005b5:	89 45 fc             	mov    %eax,-0x4(%ebp)
            addr ++;
  1005b8:	ff 45 18             	incl   0x18(%ebp)
    while (l <= r) {
  1005bb:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1005be:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  1005c1:	0f 8e 2a ff ff ff    	jle    1004f1 <stab_binsearch+0x26>
        }
    }

    if (!any_matches) {
  1005c7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1005cb:	75 0f                	jne    1005dc <stab_binsearch+0x111>
        *region_right = *region_left - 1;
  1005cd:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005d0:	8b 00                	mov    (%eax),%eax
  1005d2:	8d 50 ff             	lea    -0x1(%eax),%edx
  1005d5:	8b 45 10             	mov    0x10(%ebp),%eax
  1005d8:	89 10                	mov    %edx,(%eax)
        l = *region_right;
        for (; l > *region_left && stabs[l].n_type != type; l --)
            /* do nothing */;
        *region_left = l;
    }
}
  1005da:	eb 3e                	jmp    10061a <stab_binsearch+0x14f>
        l = *region_right;
  1005dc:	8b 45 10             	mov    0x10(%ebp),%eax
  1005df:	8b 00                	mov    (%eax),%eax
  1005e1:	89 45 fc             	mov    %eax,-0x4(%ebp)
        for (; l > *region_left && stabs[l].n_type != type; l --)
  1005e4:	eb 03                	jmp    1005e9 <stab_binsearch+0x11e>
  1005e6:	ff 4d fc             	decl   -0x4(%ebp)
  1005e9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005ec:	8b 00                	mov    (%eax),%eax
  1005ee:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  1005f1:	7e 1f                	jle    100612 <stab_binsearch+0x147>
  1005f3:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1005f6:	89 d0                	mov    %edx,%eax
  1005f8:	01 c0                	add    %eax,%eax
  1005fa:	01 d0                	add    %edx,%eax
  1005fc:	c1 e0 02             	shl    $0x2,%eax
  1005ff:	89 c2                	mov    %eax,%edx
  100601:	8b 45 08             	mov    0x8(%ebp),%eax
  100604:	01 d0                	add    %edx,%eax
  100606:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10060a:	0f b6 c0             	movzbl %al,%eax
  10060d:	39 45 14             	cmp    %eax,0x14(%ebp)
  100610:	75 d4                	jne    1005e6 <stab_binsearch+0x11b>
        *region_left = l;
  100612:	8b 45 0c             	mov    0xc(%ebp),%eax
  100615:	8b 55 fc             	mov    -0x4(%ebp),%edx
  100618:	89 10                	mov    %edx,(%eax)
}
  10061a:	90                   	nop
  10061b:	c9                   	leave  
  10061c:	c3                   	ret    

0010061d <debuginfo_eip>:
 * the specified instruction address, @addr.  Returns 0 if information
 * was found, and negative if not.  But even if it returns negative it
 * has stored some information into '*info'.
 * */
int
debuginfo_eip(uintptr_t addr, struct eipdebuginfo *info) {
  10061d:	f3 0f 1e fb          	endbr32 
  100621:	55                   	push   %ebp
  100622:	89 e5                	mov    %esp,%ebp
  100624:	83 ec 58             	sub    $0x58,%esp
    const struct stab *stabs, *stab_end;
    const char *stabstr, *stabstr_end;

    info->eip_file = "<unknown>";
  100627:	8b 45 0c             	mov    0xc(%ebp),%eax
  10062a:	c7 00 d8 36 10 00    	movl   $0x1036d8,(%eax)
    info->eip_line = 0;
  100630:	8b 45 0c             	mov    0xc(%ebp),%eax
  100633:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    info->eip_fn_name = "<unknown>";
  10063a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10063d:	c7 40 08 d8 36 10 00 	movl   $0x1036d8,0x8(%eax)
    info->eip_fn_namelen = 9;
  100644:	8b 45 0c             	mov    0xc(%ebp),%eax
  100647:	c7 40 0c 09 00 00 00 	movl   $0x9,0xc(%eax)
    info->eip_fn_addr = addr;
  10064e:	8b 45 0c             	mov    0xc(%ebp),%eax
  100651:	8b 55 08             	mov    0x8(%ebp),%edx
  100654:	89 50 10             	mov    %edx,0x10(%eax)
    info->eip_fn_narg = 0;
  100657:	8b 45 0c             	mov    0xc(%ebp),%eax
  10065a:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)

    stabs = __STAB_BEGIN__;
  100661:	c7 45 f4 ec 3e 10 00 	movl   $0x103eec,-0xc(%ebp)
    stab_end = __STAB_END__;
  100668:	c7 45 f0 c8 cb 10 00 	movl   $0x10cbc8,-0x10(%ebp)
    stabstr = __STABSTR_BEGIN__;
  10066f:	c7 45 ec c9 cb 10 00 	movl   $0x10cbc9,-0x14(%ebp)
    stabstr_end = __STABSTR_END__;
  100676:	c7 45 e8 b9 ec 10 00 	movl   $0x10ecb9,-0x18(%ebp)

    // String table validity checks
    if (stabstr_end <= stabstr || stabstr_end[-1] != 0) {
  10067d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100680:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  100683:	76 0b                	jbe    100690 <debuginfo_eip+0x73>
  100685:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100688:	48                   	dec    %eax
  100689:	0f b6 00             	movzbl (%eax),%eax
  10068c:	84 c0                	test   %al,%al
  10068e:	74 0a                	je     10069a <debuginfo_eip+0x7d>
        return -1;
  100690:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100695:	e9 ab 02 00 00       	jmp    100945 <debuginfo_eip+0x328>
    // 'eip'.  First, we find the basic source file containing 'eip'.
    // Then, we look in that source file for the function.  Then we look
    // for the line number.

    // Search the entire set of stabs for the source file (type N_SO).
    int lfile = 0, rfile = (stab_end - stabs) - 1;
  10069a:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  1006a1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1006a4:	2b 45 f4             	sub    -0xc(%ebp),%eax
  1006a7:	c1 f8 02             	sar    $0x2,%eax
  1006aa:	69 c0 ab aa aa aa    	imul   $0xaaaaaaab,%eax,%eax
  1006b0:	48                   	dec    %eax
  1006b1:	89 45 e0             	mov    %eax,-0x20(%ebp)
    stab_binsearch(stabs, &lfile, &rfile, N_SO, addr);
  1006b4:	8b 45 08             	mov    0x8(%ebp),%eax
  1006b7:	89 44 24 10          	mov    %eax,0x10(%esp)
  1006bb:	c7 44 24 0c 64 00 00 	movl   $0x64,0xc(%esp)
  1006c2:	00 
  1006c3:	8d 45 e0             	lea    -0x20(%ebp),%eax
  1006c6:	89 44 24 08          	mov    %eax,0x8(%esp)
  1006ca:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  1006cd:	89 44 24 04          	mov    %eax,0x4(%esp)
  1006d1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006d4:	89 04 24             	mov    %eax,(%esp)
  1006d7:	e8 ef fd ff ff       	call   1004cb <stab_binsearch>
    if (lfile == 0)
  1006dc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1006df:	85 c0                	test   %eax,%eax
  1006e1:	75 0a                	jne    1006ed <debuginfo_eip+0xd0>
        return -1;
  1006e3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1006e8:	e9 58 02 00 00       	jmp    100945 <debuginfo_eip+0x328>

    // Search within that file's stabs for the function definition
    // (N_FUN).
    int lfun = lfile, rfun = rfile;
  1006ed:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1006f0:	89 45 dc             	mov    %eax,-0x24(%ebp)
  1006f3:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1006f6:	89 45 d8             	mov    %eax,-0x28(%ebp)
    int lline, rline;
    stab_binsearch(stabs, &lfun, &rfun, N_FUN, addr);
  1006f9:	8b 45 08             	mov    0x8(%ebp),%eax
  1006fc:	89 44 24 10          	mov    %eax,0x10(%esp)
  100700:	c7 44 24 0c 24 00 00 	movl   $0x24,0xc(%esp)
  100707:	00 
  100708:	8d 45 d8             	lea    -0x28(%ebp),%eax
  10070b:	89 44 24 08          	mov    %eax,0x8(%esp)
  10070f:	8d 45 dc             	lea    -0x24(%ebp),%eax
  100712:	89 44 24 04          	mov    %eax,0x4(%esp)
  100716:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100719:	89 04 24             	mov    %eax,(%esp)
  10071c:	e8 aa fd ff ff       	call   1004cb <stab_binsearch>

    if (lfun <= rfun) {
  100721:	8b 55 dc             	mov    -0x24(%ebp),%edx
  100724:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100727:	39 c2                	cmp    %eax,%edx
  100729:	7f 78                	jg     1007a3 <debuginfo_eip+0x186>
        // stabs[lfun] points to the function name
        // in the string table, but check bounds just in case.
        if (stabs[lfun].n_strx < stabstr_end - stabstr) {
  10072b:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10072e:	89 c2                	mov    %eax,%edx
  100730:	89 d0                	mov    %edx,%eax
  100732:	01 c0                	add    %eax,%eax
  100734:	01 d0                	add    %edx,%eax
  100736:	c1 e0 02             	shl    $0x2,%eax
  100739:	89 c2                	mov    %eax,%edx
  10073b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10073e:	01 d0                	add    %edx,%eax
  100740:	8b 10                	mov    (%eax),%edx
  100742:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100745:	2b 45 ec             	sub    -0x14(%ebp),%eax
  100748:	39 c2                	cmp    %eax,%edx
  10074a:	73 22                	jae    10076e <debuginfo_eip+0x151>
            info->eip_fn_name = stabstr + stabs[lfun].n_strx;
  10074c:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10074f:	89 c2                	mov    %eax,%edx
  100751:	89 d0                	mov    %edx,%eax
  100753:	01 c0                	add    %eax,%eax
  100755:	01 d0                	add    %edx,%eax
  100757:	c1 e0 02             	shl    $0x2,%eax
  10075a:	89 c2                	mov    %eax,%edx
  10075c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10075f:	01 d0                	add    %edx,%eax
  100761:	8b 10                	mov    (%eax),%edx
  100763:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100766:	01 c2                	add    %eax,%edx
  100768:	8b 45 0c             	mov    0xc(%ebp),%eax
  10076b:	89 50 08             	mov    %edx,0x8(%eax)
        }
        info->eip_fn_addr = stabs[lfun].n_value;
  10076e:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100771:	89 c2                	mov    %eax,%edx
  100773:	89 d0                	mov    %edx,%eax
  100775:	01 c0                	add    %eax,%eax
  100777:	01 d0                	add    %edx,%eax
  100779:	c1 e0 02             	shl    $0x2,%eax
  10077c:	89 c2                	mov    %eax,%edx
  10077e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100781:	01 d0                	add    %edx,%eax
  100783:	8b 50 08             	mov    0x8(%eax),%edx
  100786:	8b 45 0c             	mov    0xc(%ebp),%eax
  100789:	89 50 10             	mov    %edx,0x10(%eax)
        addr -= info->eip_fn_addr;
  10078c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10078f:	8b 40 10             	mov    0x10(%eax),%eax
  100792:	29 45 08             	sub    %eax,0x8(%ebp)
        // Search within the function definition for the line number.
        lline = lfun;
  100795:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100798:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfun;
  10079b:	8b 45 d8             	mov    -0x28(%ebp),%eax
  10079e:	89 45 d0             	mov    %eax,-0x30(%ebp)
  1007a1:	eb 15                	jmp    1007b8 <debuginfo_eip+0x19b>
    } else {
        // Couldn't find function stab!  Maybe we're in an assembly
        // file.  Search the whole file for the line number.
        info->eip_fn_addr = addr;
  1007a3:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007a6:	8b 55 08             	mov    0x8(%ebp),%edx
  1007a9:	89 50 10             	mov    %edx,0x10(%eax)
        lline = lfile;
  1007ac:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1007af:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfile;
  1007b2:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1007b5:	89 45 d0             	mov    %eax,-0x30(%ebp)
    }
    info->eip_fn_namelen = strfind(info->eip_fn_name, ':') - info->eip_fn_name;
  1007b8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007bb:	8b 40 08             	mov    0x8(%eax),%eax
  1007be:	c7 44 24 04 3a 00 00 	movl   $0x3a,0x4(%esp)
  1007c5:	00 
  1007c6:	89 04 24             	mov    %eax,(%esp)
  1007c9:	e8 47 24 00 00       	call   102c15 <strfind>
  1007ce:	8b 55 0c             	mov    0xc(%ebp),%edx
  1007d1:	8b 52 08             	mov    0x8(%edx),%edx
  1007d4:	29 d0                	sub    %edx,%eax
  1007d6:	89 c2                	mov    %eax,%edx
  1007d8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007db:	89 50 0c             	mov    %edx,0xc(%eax)

    // Search within [lline, rline] for the line number stab.
    // If found, set info->eip_line to the right line number.
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
  1007de:	8b 45 08             	mov    0x8(%ebp),%eax
  1007e1:	89 44 24 10          	mov    %eax,0x10(%esp)
  1007e5:	c7 44 24 0c 44 00 00 	movl   $0x44,0xc(%esp)
  1007ec:	00 
  1007ed:	8d 45 d0             	lea    -0x30(%ebp),%eax
  1007f0:	89 44 24 08          	mov    %eax,0x8(%esp)
  1007f4:	8d 45 d4             	lea    -0x2c(%ebp),%eax
  1007f7:	89 44 24 04          	mov    %eax,0x4(%esp)
  1007fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007fe:	89 04 24             	mov    %eax,(%esp)
  100801:	e8 c5 fc ff ff       	call   1004cb <stab_binsearch>
    if (lline <= rline) {
  100806:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100809:	8b 45 d0             	mov    -0x30(%ebp),%eax
  10080c:	39 c2                	cmp    %eax,%edx
  10080e:	7f 23                	jg     100833 <debuginfo_eip+0x216>
        info->eip_line = stabs[rline].n_desc;
  100810:	8b 45 d0             	mov    -0x30(%ebp),%eax
  100813:	89 c2                	mov    %eax,%edx
  100815:	89 d0                	mov    %edx,%eax
  100817:	01 c0                	add    %eax,%eax
  100819:	01 d0                	add    %edx,%eax
  10081b:	c1 e0 02             	shl    $0x2,%eax
  10081e:	89 c2                	mov    %eax,%edx
  100820:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100823:	01 d0                	add    %edx,%eax
  100825:	0f b7 40 06          	movzwl 0x6(%eax),%eax
  100829:	89 c2                	mov    %eax,%edx
  10082b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10082e:	89 50 04             	mov    %edx,0x4(%eax)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  100831:	eb 11                	jmp    100844 <debuginfo_eip+0x227>
        return -1;
  100833:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100838:	e9 08 01 00 00       	jmp    100945 <debuginfo_eip+0x328>
           && stabs[lline].n_type != N_SOL
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
        lline --;
  10083d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100840:	48                   	dec    %eax
  100841:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    while (lline >= lfile
  100844:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100847:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10084a:	39 c2                	cmp    %eax,%edx
  10084c:	7c 56                	jl     1008a4 <debuginfo_eip+0x287>
           && stabs[lline].n_type != N_SOL
  10084e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100851:	89 c2                	mov    %eax,%edx
  100853:	89 d0                	mov    %edx,%eax
  100855:	01 c0                	add    %eax,%eax
  100857:	01 d0                	add    %edx,%eax
  100859:	c1 e0 02             	shl    $0x2,%eax
  10085c:	89 c2                	mov    %eax,%edx
  10085e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100861:	01 d0                	add    %edx,%eax
  100863:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100867:	3c 84                	cmp    $0x84,%al
  100869:	74 39                	je     1008a4 <debuginfo_eip+0x287>
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
  10086b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10086e:	89 c2                	mov    %eax,%edx
  100870:	89 d0                	mov    %edx,%eax
  100872:	01 c0                	add    %eax,%eax
  100874:	01 d0                	add    %edx,%eax
  100876:	c1 e0 02             	shl    $0x2,%eax
  100879:	89 c2                	mov    %eax,%edx
  10087b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10087e:	01 d0                	add    %edx,%eax
  100880:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100884:	3c 64                	cmp    $0x64,%al
  100886:	75 b5                	jne    10083d <debuginfo_eip+0x220>
  100888:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10088b:	89 c2                	mov    %eax,%edx
  10088d:	89 d0                	mov    %edx,%eax
  10088f:	01 c0                	add    %eax,%eax
  100891:	01 d0                	add    %edx,%eax
  100893:	c1 e0 02             	shl    $0x2,%eax
  100896:	89 c2                	mov    %eax,%edx
  100898:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10089b:	01 d0                	add    %edx,%eax
  10089d:	8b 40 08             	mov    0x8(%eax),%eax
  1008a0:	85 c0                	test   %eax,%eax
  1008a2:	74 99                	je     10083d <debuginfo_eip+0x220>
    }
    if (lline >= lfile && stabs[lline].n_strx < stabstr_end - stabstr) {
  1008a4:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1008a7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1008aa:	39 c2                	cmp    %eax,%edx
  1008ac:	7c 42                	jl     1008f0 <debuginfo_eip+0x2d3>
  1008ae:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1008b1:	89 c2                	mov    %eax,%edx
  1008b3:	89 d0                	mov    %edx,%eax
  1008b5:	01 c0                	add    %eax,%eax
  1008b7:	01 d0                	add    %edx,%eax
  1008b9:	c1 e0 02             	shl    $0x2,%eax
  1008bc:	89 c2                	mov    %eax,%edx
  1008be:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1008c1:	01 d0                	add    %edx,%eax
  1008c3:	8b 10                	mov    (%eax),%edx
  1008c5:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1008c8:	2b 45 ec             	sub    -0x14(%ebp),%eax
  1008cb:	39 c2                	cmp    %eax,%edx
  1008cd:	73 21                	jae    1008f0 <debuginfo_eip+0x2d3>
        info->eip_file = stabstr + stabs[lline].n_strx;
  1008cf:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1008d2:	89 c2                	mov    %eax,%edx
  1008d4:	89 d0                	mov    %edx,%eax
  1008d6:	01 c0                	add    %eax,%eax
  1008d8:	01 d0                	add    %edx,%eax
  1008da:	c1 e0 02             	shl    $0x2,%eax
  1008dd:	89 c2                	mov    %eax,%edx
  1008df:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1008e2:	01 d0                	add    %edx,%eax
  1008e4:	8b 10                	mov    (%eax),%edx
  1008e6:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1008e9:	01 c2                	add    %eax,%edx
  1008eb:	8b 45 0c             	mov    0xc(%ebp),%eax
  1008ee:	89 10                	mov    %edx,(%eax)
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
  1008f0:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1008f3:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1008f6:	39 c2                	cmp    %eax,%edx
  1008f8:	7d 46                	jge    100940 <debuginfo_eip+0x323>
        for (lline = lfun + 1;
  1008fa:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1008fd:	40                   	inc    %eax
  1008fe:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  100901:	eb 16                	jmp    100919 <debuginfo_eip+0x2fc>
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
            info->eip_fn_narg ++;
  100903:	8b 45 0c             	mov    0xc(%ebp),%eax
  100906:	8b 40 14             	mov    0x14(%eax),%eax
  100909:	8d 50 01             	lea    0x1(%eax),%edx
  10090c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10090f:	89 50 14             	mov    %edx,0x14(%eax)
             lline ++) {
  100912:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100915:	40                   	inc    %eax
  100916:	89 45 d4             	mov    %eax,-0x2c(%ebp)
             lline < rfun && stabs[lline].n_type == N_PSYM;
  100919:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10091c:	8b 45 d8             	mov    -0x28(%ebp),%eax
        for (lline = lfun + 1;
  10091f:	39 c2                	cmp    %eax,%edx
  100921:	7d 1d                	jge    100940 <debuginfo_eip+0x323>
             lline < rfun && stabs[lline].n_type == N_PSYM;
  100923:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100926:	89 c2                	mov    %eax,%edx
  100928:	89 d0                	mov    %edx,%eax
  10092a:	01 c0                	add    %eax,%eax
  10092c:	01 d0                	add    %edx,%eax
  10092e:	c1 e0 02             	shl    $0x2,%eax
  100931:	89 c2                	mov    %eax,%edx
  100933:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100936:	01 d0                	add    %edx,%eax
  100938:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10093c:	3c a0                	cmp    $0xa0,%al
  10093e:	74 c3                	je     100903 <debuginfo_eip+0x2e6>
        }
    }
    return 0;
  100940:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100945:	c9                   	leave  
  100946:	c3                   	ret    

00100947 <print_kerninfo>:
 * print_kerninfo - print the information about kernel, including the location
 * of kernel entry, the start addresses of data and text segements, the start
 * address of free memory and how many memory that kernel has used.
 * */
void
print_kerninfo(void) {
  100947:	f3 0f 1e fb          	endbr32 
  10094b:	55                   	push   %ebp
  10094c:	89 e5                	mov    %esp,%ebp
  10094e:	83 ec 18             	sub    $0x18,%esp
    extern char etext[], edata[], end[], kern_init[];
    cprintf("Special kernel symbols:\n");
  100951:	c7 04 24 e2 36 10 00 	movl   $0x1036e2,(%esp)
  100958:	e8 27 f9 ff ff       	call   100284 <cprintf>
    cprintf("  entry  0x%08x (phys)\n", kern_init);
  10095d:	c7 44 24 04 00 00 10 	movl   $0x100000,0x4(%esp)
  100964:	00 
  100965:	c7 04 24 fb 36 10 00 	movl   $0x1036fb,(%esp)
  10096c:	e8 13 f9 ff ff       	call   100284 <cprintf>
    cprintf("  etext  0x%08x (phys)\n", etext);
  100971:	c7 44 24 04 c5 35 10 	movl   $0x1035c5,0x4(%esp)
  100978:	00 
  100979:	c7 04 24 13 37 10 00 	movl   $0x103713,(%esp)
  100980:	e8 ff f8 ff ff       	call   100284 <cprintf>
    cprintf("  edata  0x%08x (phys)\n", edata);
  100985:	c7 44 24 04 16 fa 10 	movl   $0x10fa16,0x4(%esp)
  10098c:	00 
  10098d:	c7 04 24 2b 37 10 00 	movl   $0x10372b,(%esp)
  100994:	e8 eb f8 ff ff       	call   100284 <cprintf>
    cprintf("  end    0x%08x (phys)\n", end);
  100999:	c7 44 24 04 20 0d 11 	movl   $0x110d20,0x4(%esp)
  1009a0:	00 
  1009a1:	c7 04 24 43 37 10 00 	movl   $0x103743,(%esp)
  1009a8:	e8 d7 f8 ff ff       	call   100284 <cprintf>
    cprintf("Kernel executable memory footprint: %dKB\n", (end - kern_init + 1023)/1024);
  1009ad:	b8 20 0d 11 00       	mov    $0x110d20,%eax
  1009b2:	2d 00 00 10 00       	sub    $0x100000,%eax
  1009b7:	05 ff 03 00 00       	add    $0x3ff,%eax
  1009bc:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  1009c2:	85 c0                	test   %eax,%eax
  1009c4:	0f 48 c2             	cmovs  %edx,%eax
  1009c7:	c1 f8 0a             	sar    $0xa,%eax
  1009ca:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009ce:	c7 04 24 5c 37 10 00 	movl   $0x10375c,(%esp)
  1009d5:	e8 aa f8 ff ff       	call   100284 <cprintf>
}
  1009da:	90                   	nop
  1009db:	c9                   	leave  
  1009dc:	c3                   	ret    

001009dd <print_debuginfo>:
/* *
 * print_debuginfo - read and print the stat information for the address @eip,
 * and info.eip_fn_addr should be the first address of the related function.
 * */
void
print_debuginfo(uintptr_t eip) {
  1009dd:	f3 0f 1e fb          	endbr32 
  1009e1:	55                   	push   %ebp
  1009e2:	89 e5                	mov    %esp,%ebp
  1009e4:	81 ec 48 01 00 00    	sub    $0x148,%esp
    struct eipdebuginfo info;
    if (debuginfo_eip(eip, &info) != 0) {
  1009ea:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1009ed:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009f1:	8b 45 08             	mov    0x8(%ebp),%eax
  1009f4:	89 04 24             	mov    %eax,(%esp)
  1009f7:	e8 21 fc ff ff       	call   10061d <debuginfo_eip>
  1009fc:	85 c0                	test   %eax,%eax
  1009fe:	74 15                	je     100a15 <print_debuginfo+0x38>
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
  100a00:	8b 45 08             	mov    0x8(%ebp),%eax
  100a03:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a07:	c7 04 24 86 37 10 00 	movl   $0x103786,(%esp)
  100a0e:	e8 71 f8 ff ff       	call   100284 <cprintf>
        }
        fnname[j] = '\0';
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
                fnname, eip - info.eip_fn_addr);
    }
}
  100a13:	eb 6c                	jmp    100a81 <print_debuginfo+0xa4>
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  100a15:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100a1c:	eb 1b                	jmp    100a39 <print_debuginfo+0x5c>
            fnname[j] = info.eip_fn_name[j];
  100a1e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  100a21:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a24:	01 d0                	add    %edx,%eax
  100a26:	0f b6 10             	movzbl (%eax),%edx
  100a29:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  100a2f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a32:	01 c8                	add    %ecx,%eax
  100a34:	88 10                	mov    %dl,(%eax)
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  100a36:	ff 45 f4             	incl   -0xc(%ebp)
  100a39:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100a3c:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  100a3f:	7c dd                	jl     100a1e <print_debuginfo+0x41>
        fnname[j] = '\0';
  100a41:	8d 95 dc fe ff ff    	lea    -0x124(%ebp),%edx
  100a47:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a4a:	01 d0                	add    %edx,%eax
  100a4c:	c6 00 00             	movb   $0x0,(%eax)
                fnname, eip - info.eip_fn_addr);
  100a4f:	8b 45 ec             	mov    -0x14(%ebp),%eax
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
  100a52:	8b 55 08             	mov    0x8(%ebp),%edx
  100a55:	89 d1                	mov    %edx,%ecx
  100a57:	29 c1                	sub    %eax,%ecx
  100a59:	8b 55 e0             	mov    -0x20(%ebp),%edx
  100a5c:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100a5f:	89 4c 24 10          	mov    %ecx,0x10(%esp)
  100a63:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  100a69:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  100a6d:	89 54 24 08          	mov    %edx,0x8(%esp)
  100a71:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a75:	c7 04 24 a2 37 10 00 	movl   $0x1037a2,(%esp)
  100a7c:	e8 03 f8 ff ff       	call   100284 <cprintf>
}
  100a81:	90                   	nop
  100a82:	c9                   	leave  
  100a83:	c3                   	ret    

00100a84 <read_eip>:

static __noinline uint32_t
read_eip(void) {
  100a84:	f3 0f 1e fb          	endbr32 
  100a88:	55                   	push   %ebp
  100a89:	89 e5                	mov    %esp,%ebp
  100a8b:	83 ec 10             	sub    $0x10,%esp
    uint32_t eip;
    asm volatile("movl 4(%%ebp), %0" : "=r" (eip));
  100a8e:	8b 45 04             	mov    0x4(%ebp),%eax
  100a91:	89 45 fc             	mov    %eax,-0x4(%ebp)
    return eip;
  100a94:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  100a97:	c9                   	leave  
  100a98:	c3                   	ret    

00100a99 <print_stackframe>:
 *
 * Note that, the length of ebp-chain is limited. In boot/bootasm.S, before jumping
 * to the kernel entry, the value of ebp has been set to zero, that's the boundary.
 * */
void
print_stackframe(void) {
  100a99:	f3 0f 1e fb          	endbr32 
  100a9d:	55                   	push   %ebp
  100a9e:	89 e5                	mov    %esp,%ebp
  100aa0:	83 ec 38             	sub    $0x38,%esp
}

static inline uint32_t
read_ebp(void) {
    uint32_t ebp;
    asm volatile ("movl %%ebp, %0" : "=r" (ebp));
  100aa3:	89 e8                	mov    %ebp,%eax
  100aa5:	89 45 e0             	mov    %eax,-0x20(%ebp)
    return ebp;
  100aa8:	8b 45 e0             	mov    -0x20(%ebp),%eax
      *    (3.4) call print_debuginfo(eip-1) to print the C calling function name and line number, etc.
      *    (3.5) popup a calling stackframe
      *           NOTICE: the calling funciton's return addr eip  = ss:[ebp+4]
      *                   the calling funciton's ebp = ss:[ebp]
      */
    uint32_t ebp=read_ebp(),eip=read_eip();
  100aab:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100aae:	e8 d1 ff ff ff       	call   100a84 <read_eip>
  100ab3:	89 45 f0             	mov    %eax,-0x10(%ebp)
    for(int i=0;i<STACKFRAME_DEPTH;i++)
  100ab6:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  100abd:	e9 90 00 00 00       	jmp    100b52 <print_stackframe+0xb9>
    {
        cprintf("ebp:0x%08x eip:0x%08x ",ebp,eip);
  100ac2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100ac5:	89 44 24 08          	mov    %eax,0x8(%esp)
  100ac9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100acc:	89 44 24 04          	mov    %eax,0x4(%esp)
  100ad0:	c7 04 24 b4 37 10 00 	movl   $0x1037b4,(%esp)
  100ad7:	e8 a8 f7 ff ff       	call   100284 <cprintf>
        uint32_t *args_lists=(uint32_t *)ebp+2;
  100adc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100adf:	83 c0 08             	add    $0x8,%eax
  100ae2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        cprintf("args:");
  100ae5:	c7 04 24 cb 37 10 00 	movl   $0x1037cb,(%esp)
  100aec:	e8 93 f7 ff ff       	call   100284 <cprintf>
        for(int j=0;j<4;j++)
  100af1:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  100af8:	eb 24                	jmp    100b1e <print_stackframe+0x85>
        {
            cprintf("0x%08x ",args_lists[j]);
  100afa:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100afd:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100b04:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100b07:	01 d0                	add    %edx,%eax
  100b09:	8b 00                	mov    (%eax),%eax
  100b0b:	89 44 24 04          	mov    %eax,0x4(%esp)
  100b0f:	c7 04 24 d1 37 10 00 	movl   $0x1037d1,(%esp)
  100b16:	e8 69 f7 ff ff       	call   100284 <cprintf>
        for(int j=0;j<4;j++)
  100b1b:	ff 45 e8             	incl   -0x18(%ebp)
  100b1e:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
  100b22:	7e d6                	jle    100afa <print_stackframe+0x61>
        }
        cprintf("\n");
  100b24:	c7 04 24 d9 37 10 00 	movl   $0x1037d9,(%esp)
  100b2b:	e8 54 f7 ff ff       	call   100284 <cprintf>
        print_debuginfo(eip-1);
  100b30:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100b33:	48                   	dec    %eax
  100b34:	89 04 24             	mov    %eax,(%esp)
  100b37:	e8 a1 fe ff ff       	call   1009dd <print_debuginfo>
        eip=((uint32_t *)ebp)[1];
  100b3c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b3f:	83 c0 04             	add    $0x4,%eax
  100b42:	8b 00                	mov    (%eax),%eax
  100b44:	89 45 f0             	mov    %eax,-0x10(%ebp)
        ebp=((uint32_t *)ebp)[0];
  100b47:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b4a:	8b 00                	mov    (%eax),%eax
  100b4c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    for(int i=0;i<STACKFRAME_DEPTH;i++)
  100b4f:	ff 45 ec             	incl   -0x14(%ebp)
  100b52:	83 7d ec 13          	cmpl   $0x13,-0x14(%ebp)
  100b56:	0f 8e 66 ff ff ff    	jle    100ac2 <print_stackframe+0x29>
    }
}
  100b5c:	90                   	nop
  100b5d:	90                   	nop
  100b5e:	c9                   	leave  
  100b5f:	c3                   	ret    

00100b60 <parse>:
#define MAXARGS         16
#define WHITESPACE      " \t\n\r"

/* parse - parse the command buffer into whitespace-separated arguments */
static int
parse(char *buf, char **argv) {
  100b60:	f3 0f 1e fb          	endbr32 
  100b64:	55                   	push   %ebp
  100b65:	89 e5                	mov    %esp,%ebp
  100b67:	83 ec 28             	sub    $0x28,%esp
    int argc = 0;
  100b6a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100b71:	eb 0c                	jmp    100b7f <parse+0x1f>
            *buf ++ = '\0';
  100b73:	8b 45 08             	mov    0x8(%ebp),%eax
  100b76:	8d 50 01             	lea    0x1(%eax),%edx
  100b79:	89 55 08             	mov    %edx,0x8(%ebp)
  100b7c:	c6 00 00             	movb   $0x0,(%eax)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100b7f:	8b 45 08             	mov    0x8(%ebp),%eax
  100b82:	0f b6 00             	movzbl (%eax),%eax
  100b85:	84 c0                	test   %al,%al
  100b87:	74 1d                	je     100ba6 <parse+0x46>
  100b89:	8b 45 08             	mov    0x8(%ebp),%eax
  100b8c:	0f b6 00             	movzbl (%eax),%eax
  100b8f:	0f be c0             	movsbl %al,%eax
  100b92:	89 44 24 04          	mov    %eax,0x4(%esp)
  100b96:	c7 04 24 5c 38 10 00 	movl   $0x10385c,(%esp)
  100b9d:	e8 3d 20 00 00       	call   102bdf <strchr>
  100ba2:	85 c0                	test   %eax,%eax
  100ba4:	75 cd                	jne    100b73 <parse+0x13>
        }
        if (*buf == '\0') {
  100ba6:	8b 45 08             	mov    0x8(%ebp),%eax
  100ba9:	0f b6 00             	movzbl (%eax),%eax
  100bac:	84 c0                	test   %al,%al
  100bae:	74 65                	je     100c15 <parse+0xb5>
            break;
        }

        // save and scan past next arg
        if (argc == MAXARGS - 1) {
  100bb0:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
  100bb4:	75 14                	jne    100bca <parse+0x6a>
            cprintf("Too many arguments (max %d).\n", MAXARGS);
  100bb6:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
  100bbd:	00 
  100bbe:	c7 04 24 61 38 10 00 	movl   $0x103861,(%esp)
  100bc5:	e8 ba f6 ff ff       	call   100284 <cprintf>
        }
        argv[argc ++] = buf;
  100bca:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100bcd:	8d 50 01             	lea    0x1(%eax),%edx
  100bd0:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100bd3:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100bda:	8b 45 0c             	mov    0xc(%ebp),%eax
  100bdd:	01 c2                	add    %eax,%edx
  100bdf:	8b 45 08             	mov    0x8(%ebp),%eax
  100be2:	89 02                	mov    %eax,(%edx)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100be4:	eb 03                	jmp    100be9 <parse+0x89>
            buf ++;
  100be6:	ff 45 08             	incl   0x8(%ebp)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100be9:	8b 45 08             	mov    0x8(%ebp),%eax
  100bec:	0f b6 00             	movzbl (%eax),%eax
  100bef:	84 c0                	test   %al,%al
  100bf1:	74 8c                	je     100b7f <parse+0x1f>
  100bf3:	8b 45 08             	mov    0x8(%ebp),%eax
  100bf6:	0f b6 00             	movzbl (%eax),%eax
  100bf9:	0f be c0             	movsbl %al,%eax
  100bfc:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c00:	c7 04 24 5c 38 10 00 	movl   $0x10385c,(%esp)
  100c07:	e8 d3 1f 00 00       	call   102bdf <strchr>
  100c0c:	85 c0                	test   %eax,%eax
  100c0e:	74 d6                	je     100be6 <parse+0x86>
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100c10:	e9 6a ff ff ff       	jmp    100b7f <parse+0x1f>
            break;
  100c15:	90                   	nop
        }
    }
    return argc;
  100c16:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100c19:	c9                   	leave  
  100c1a:	c3                   	ret    

00100c1b <runcmd>:
/* *
 * runcmd - parse the input string, split it into separated arguments
 * and then lookup and invoke some related commands/
 * */
static int
runcmd(char *buf, struct trapframe *tf) {
  100c1b:	f3 0f 1e fb          	endbr32 
  100c1f:	55                   	push   %ebp
  100c20:	89 e5                	mov    %esp,%ebp
  100c22:	53                   	push   %ebx
  100c23:	83 ec 64             	sub    $0x64,%esp
    char *argv[MAXARGS];
    int argc = parse(buf, argv);
  100c26:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100c29:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c2d:	8b 45 08             	mov    0x8(%ebp),%eax
  100c30:	89 04 24             	mov    %eax,(%esp)
  100c33:	e8 28 ff ff ff       	call   100b60 <parse>
  100c38:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if (argc == 0) {
  100c3b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100c3f:	75 0a                	jne    100c4b <runcmd+0x30>
        return 0;
  100c41:	b8 00 00 00 00       	mov    $0x0,%eax
  100c46:	e9 83 00 00 00       	jmp    100cce <runcmd+0xb3>
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100c4b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100c52:	eb 5a                	jmp    100cae <runcmd+0x93>
        if (strcmp(commands[i].name, argv[0]) == 0) {
  100c54:	8b 4d b0             	mov    -0x50(%ebp),%ecx
  100c57:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c5a:	89 d0                	mov    %edx,%eax
  100c5c:	01 c0                	add    %eax,%eax
  100c5e:	01 d0                	add    %edx,%eax
  100c60:	c1 e0 02             	shl    $0x2,%eax
  100c63:	05 00 f0 10 00       	add    $0x10f000,%eax
  100c68:	8b 00                	mov    (%eax),%eax
  100c6a:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  100c6e:	89 04 24             	mov    %eax,(%esp)
  100c71:	e8 c5 1e 00 00       	call   102b3b <strcmp>
  100c76:	85 c0                	test   %eax,%eax
  100c78:	75 31                	jne    100cab <runcmd+0x90>
            return commands[i].func(argc - 1, argv + 1, tf);
  100c7a:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c7d:	89 d0                	mov    %edx,%eax
  100c7f:	01 c0                	add    %eax,%eax
  100c81:	01 d0                	add    %edx,%eax
  100c83:	c1 e0 02             	shl    $0x2,%eax
  100c86:	05 08 f0 10 00       	add    $0x10f008,%eax
  100c8b:	8b 10                	mov    (%eax),%edx
  100c8d:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100c90:	83 c0 04             	add    $0x4,%eax
  100c93:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  100c96:	8d 59 ff             	lea    -0x1(%ecx),%ebx
  100c99:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  100c9c:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  100ca0:	89 44 24 04          	mov    %eax,0x4(%esp)
  100ca4:	89 1c 24             	mov    %ebx,(%esp)
  100ca7:	ff d2                	call   *%edx
  100ca9:	eb 23                	jmp    100cce <runcmd+0xb3>
    for (i = 0; i < NCOMMANDS; i ++) {
  100cab:	ff 45 f4             	incl   -0xc(%ebp)
  100cae:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100cb1:	83 f8 02             	cmp    $0x2,%eax
  100cb4:	76 9e                	jbe    100c54 <runcmd+0x39>
        }
    }
    cprintf("Unknown command '%s'\n", argv[0]);
  100cb6:	8b 45 b0             	mov    -0x50(%ebp),%eax
  100cb9:	89 44 24 04          	mov    %eax,0x4(%esp)
  100cbd:	c7 04 24 7f 38 10 00 	movl   $0x10387f,(%esp)
  100cc4:	e8 bb f5 ff ff       	call   100284 <cprintf>
    return 0;
  100cc9:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100cce:	83 c4 64             	add    $0x64,%esp
  100cd1:	5b                   	pop    %ebx
  100cd2:	5d                   	pop    %ebp
  100cd3:	c3                   	ret    

00100cd4 <kmonitor>:

/***** Implementations of basic kernel monitor commands *****/

void
kmonitor(struct trapframe *tf) {
  100cd4:	f3 0f 1e fb          	endbr32 
  100cd8:	55                   	push   %ebp
  100cd9:	89 e5                	mov    %esp,%ebp
  100cdb:	83 ec 28             	sub    $0x28,%esp
    cprintf("Welcome to the kernel debug monitor!!\n");
  100cde:	c7 04 24 98 38 10 00 	movl   $0x103898,(%esp)
  100ce5:	e8 9a f5 ff ff       	call   100284 <cprintf>
    cprintf("Type 'help' for a list of commands.\n");
  100cea:	c7 04 24 c0 38 10 00 	movl   $0x1038c0,(%esp)
  100cf1:	e8 8e f5 ff ff       	call   100284 <cprintf>

    if (tf != NULL) {
  100cf6:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100cfa:	74 0b                	je     100d07 <kmonitor+0x33>
        print_trapframe(tf);
  100cfc:	8b 45 08             	mov    0x8(%ebp),%eax
  100cff:	89 04 24             	mov    %eax,(%esp)
  100d02:	e8 d6 0d 00 00       	call   101add <print_trapframe>
    }

    char *buf;
    while (1) {
        if ((buf = readline("K> ")) != NULL) {
  100d07:	c7 04 24 e5 38 10 00 	movl   $0x1038e5,(%esp)
  100d0e:	e8 24 f6 ff ff       	call   100337 <readline>
  100d13:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100d16:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100d1a:	74 eb                	je     100d07 <kmonitor+0x33>
            if (runcmd(buf, tf) < 0) {
  100d1c:	8b 45 08             	mov    0x8(%ebp),%eax
  100d1f:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d23:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d26:	89 04 24             	mov    %eax,(%esp)
  100d29:	e8 ed fe ff ff       	call   100c1b <runcmd>
  100d2e:	85 c0                	test   %eax,%eax
  100d30:	78 02                	js     100d34 <kmonitor+0x60>
        if ((buf = readline("K> ")) != NULL) {
  100d32:	eb d3                	jmp    100d07 <kmonitor+0x33>
                break;
  100d34:	90                   	nop
            }
        }
    }
}
  100d35:	90                   	nop
  100d36:	c9                   	leave  
  100d37:	c3                   	ret    

00100d38 <mon_help>:

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
  100d38:	f3 0f 1e fb          	endbr32 
  100d3c:	55                   	push   %ebp
  100d3d:	89 e5                	mov    %esp,%ebp
  100d3f:	83 ec 28             	sub    $0x28,%esp
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100d42:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100d49:	eb 3d                	jmp    100d88 <mon_help+0x50>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
  100d4b:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100d4e:	89 d0                	mov    %edx,%eax
  100d50:	01 c0                	add    %eax,%eax
  100d52:	01 d0                	add    %edx,%eax
  100d54:	c1 e0 02             	shl    $0x2,%eax
  100d57:	05 04 f0 10 00       	add    $0x10f004,%eax
  100d5c:	8b 08                	mov    (%eax),%ecx
  100d5e:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100d61:	89 d0                	mov    %edx,%eax
  100d63:	01 c0                	add    %eax,%eax
  100d65:	01 d0                	add    %edx,%eax
  100d67:	c1 e0 02             	shl    $0x2,%eax
  100d6a:	05 00 f0 10 00       	add    $0x10f000,%eax
  100d6f:	8b 00                	mov    (%eax),%eax
  100d71:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  100d75:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d79:	c7 04 24 e9 38 10 00 	movl   $0x1038e9,(%esp)
  100d80:	e8 ff f4 ff ff       	call   100284 <cprintf>
    for (i = 0; i < NCOMMANDS; i ++) {
  100d85:	ff 45 f4             	incl   -0xc(%ebp)
  100d88:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d8b:	83 f8 02             	cmp    $0x2,%eax
  100d8e:	76 bb                	jbe    100d4b <mon_help+0x13>
    }
    return 0;
  100d90:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100d95:	c9                   	leave  
  100d96:	c3                   	ret    

00100d97 <mon_kerninfo>:
/* *
 * mon_kerninfo - call print_kerninfo in kern/debug/kdebug.c to
 * print the memory occupancy in kernel.
 * */
int
mon_kerninfo(int argc, char **argv, struct trapframe *tf) {
  100d97:	f3 0f 1e fb          	endbr32 
  100d9b:	55                   	push   %ebp
  100d9c:	89 e5                	mov    %esp,%ebp
  100d9e:	83 ec 08             	sub    $0x8,%esp
    print_kerninfo();
  100da1:	e8 a1 fb ff ff       	call   100947 <print_kerninfo>
    return 0;
  100da6:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100dab:	c9                   	leave  
  100dac:	c3                   	ret    

00100dad <mon_backtrace>:
/* *
 * mon_backtrace - call print_stackframe in kern/debug/kdebug.c to
 * print a backtrace of the stack.
 * */
int
mon_backtrace(int argc, char **argv, struct trapframe *tf) {
  100dad:	f3 0f 1e fb          	endbr32 
  100db1:	55                   	push   %ebp
  100db2:	89 e5                	mov    %esp,%ebp
  100db4:	83 ec 08             	sub    $0x8,%esp
    print_stackframe();
  100db7:	e8 dd fc ff ff       	call   100a99 <print_stackframe>
    return 0;
  100dbc:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100dc1:	c9                   	leave  
  100dc2:	c3                   	ret    

00100dc3 <clock_init>:
/* *
 * clock_init - initialize 8253 clock to interrupt 100 times per second,
 * and then enable IRQ_TIMER.
 * */
void
clock_init(void) {
  100dc3:	f3 0f 1e fb          	endbr32 
  100dc7:	55                   	push   %ebp
  100dc8:	89 e5                	mov    %esp,%ebp
  100dca:	83 ec 28             	sub    $0x28,%esp
  100dcd:	66 c7 45 ee 43 00    	movw   $0x43,-0x12(%ebp)
  100dd3:	c6 45 ed 34          	movb   $0x34,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100dd7:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100ddb:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100ddf:	ee                   	out    %al,(%dx)
}
  100de0:	90                   	nop
  100de1:	66 c7 45 f2 40 00    	movw   $0x40,-0xe(%ebp)
  100de7:	c6 45 f1 9c          	movb   $0x9c,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100deb:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100def:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100df3:	ee                   	out    %al,(%dx)
}
  100df4:	90                   	nop
  100df5:	66 c7 45 f6 40 00    	movw   $0x40,-0xa(%ebp)
  100dfb:	c6 45 f5 2e          	movb   $0x2e,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100dff:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100e03:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100e07:	ee                   	out    %al,(%dx)
}
  100e08:	90                   	nop
    outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
    outb(IO_TIMER1, TIMER_DIV(100) % 256);
    outb(IO_TIMER1, TIMER_DIV(100) / 256);

    // initialize time counter 'ticks' to zero
    ticks = 0;
  100e09:	c7 05 08 09 11 00 00 	movl   $0x0,0x110908
  100e10:	00 00 00 

    cprintf("++ setup timer interrupts\n");
  100e13:	c7 04 24 f2 38 10 00 	movl   $0x1038f2,(%esp)
  100e1a:	e8 65 f4 ff ff       	call   100284 <cprintf>
    pic_enable(IRQ_TIMER);
  100e1f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100e26:	e8 31 09 00 00       	call   10175c <pic_enable>
}
  100e2b:	90                   	nop
  100e2c:	c9                   	leave  
  100e2d:	c3                   	ret    

00100e2e <delay>:
#include <picirq.h>
#include <trap.h>

/* stupid I/O delay routine necessitated by historical PC design flaws */
static void
delay(void) {
  100e2e:	f3 0f 1e fb          	endbr32 
  100e32:	55                   	push   %ebp
  100e33:	89 e5                	mov    %esp,%ebp
  100e35:	83 ec 10             	sub    $0x10,%esp
  100e38:	66 c7 45 f2 84 00    	movw   $0x84,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100e3e:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100e42:	89 c2                	mov    %eax,%edx
  100e44:	ec                   	in     (%dx),%al
  100e45:	88 45 f1             	mov    %al,-0xf(%ebp)
  100e48:	66 c7 45 f6 84 00    	movw   $0x84,-0xa(%ebp)
  100e4e:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100e52:	89 c2                	mov    %eax,%edx
  100e54:	ec                   	in     (%dx),%al
  100e55:	88 45 f5             	mov    %al,-0xb(%ebp)
  100e58:	66 c7 45 fa 84 00    	movw   $0x84,-0x6(%ebp)
  100e5e:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100e62:	89 c2                	mov    %eax,%edx
  100e64:	ec                   	in     (%dx),%al
  100e65:	88 45 f9             	mov    %al,-0x7(%ebp)
  100e68:	66 c7 45 fe 84 00    	movw   $0x84,-0x2(%ebp)
  100e6e:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  100e72:	89 c2                	mov    %eax,%edx
  100e74:	ec                   	in     (%dx),%al
  100e75:	88 45 fd             	mov    %al,-0x3(%ebp)
    inb(0x84);
    inb(0x84);
    inb(0x84);
    inb(0x84);
}
  100e78:	90                   	nop
  100e79:	c9                   	leave  
  100e7a:	c3                   	ret    

00100e7b <cga_init>:
//    -- 数据寄存器 映射 到 端口 0x3D5或0x3B5 
//    -- 索引寄存器 0x3D4或0x3B4,决定在数据寄存器中的数据表示什么。

/* TEXT-mode CGA/VGA display output */
static void
cga_init(void) {
  100e7b:	f3 0f 1e fb          	endbr32 
  100e7f:	55                   	push   %ebp
  100e80:	89 e5                	mov    %esp,%ebp
  100e82:	83 ec 20             	sub    $0x20,%esp
    volatile uint16_t *cp = (uint16_t *)CGA_BUF;   //CGA_BUF: 0xB8000 (彩色显示的显存物理基址)
  100e85:	c7 45 fc 00 80 0b 00 	movl   $0xb8000,-0x4(%ebp)
    uint16_t was = *cp;                                            //保存当前显存0xB8000处的值
  100e8c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e8f:	0f b7 00             	movzwl (%eax),%eax
  100e92:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
    *cp = (uint16_t) 0xA55A;                                   // 给这个地址随便写个值，看看能否再读出同样的值
  100e96:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e99:	66 c7 00 5a a5       	movw   $0xa55a,(%eax)
    if (*cp != 0xA55A) {                                            // 如果读不出来，说明没有这块显存，即是单显配置
  100e9e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100ea1:	0f b7 00             	movzwl (%eax),%eax
  100ea4:	0f b7 c0             	movzwl %ax,%eax
  100ea7:	3d 5a a5 00 00       	cmp    $0xa55a,%eax
  100eac:	74 12                	je     100ec0 <cga_init+0x45>
        cp = (uint16_t*)MONO_BUF;                         //设置为单显的显存基址 MONO_BUF： 0xB0000
  100eae:	c7 45 fc 00 00 0b 00 	movl   $0xb0000,-0x4(%ebp)
        addr_6845 = MONO_BASE;                           //设置为单显控制的IO地址，MONO_BASE: 0x3B4
  100eb5:	66 c7 05 66 fe 10 00 	movw   $0x3b4,0x10fe66
  100ebc:	b4 03 
  100ebe:	eb 13                	jmp    100ed3 <cga_init+0x58>
    } else {                                                                // 如果读出来了，有这块显存，即是彩显配置
        *cp = was;                                                      //还原原来显存位置的值
  100ec0:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100ec3:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  100ec7:	66 89 10             	mov    %dx,(%eax)
        addr_6845 = CGA_BASE;                               // 设置为彩显控制的IO地址，CGA_BASE: 0x3D4 
  100eca:	66 c7 05 66 fe 10 00 	movw   $0x3d4,0x10fe66
  100ed1:	d4 03 
    // Extract cursor location
    // 6845索引寄存器的index 0x0E（及十进制的14）== 光标位置(高位)
    // 6845索引寄存器的index 0x0F（及十进制的15）== 光标位置(低位)
    // 6845 reg 15 : Cursor Address (Low Byte)
    uint32_t pos;
    outb(addr_6845, 14);                                        
  100ed3:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  100eda:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
  100ede:	c6 45 e5 0e          	movb   $0xe,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100ee2:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100ee6:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100eea:	ee                   	out    %al,(%dx)
}
  100eeb:	90                   	nop
    pos = inb(addr_6845 + 1) << 8;                       //读出了光标位置(高位)
  100eec:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  100ef3:	40                   	inc    %eax
  100ef4:	0f b7 c0             	movzwl %ax,%eax
  100ef7:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100efb:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
  100eff:	89 c2                	mov    %eax,%edx
  100f01:	ec                   	in     (%dx),%al
  100f02:	88 45 e9             	mov    %al,-0x17(%ebp)
    return data;
  100f05:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100f09:	0f b6 c0             	movzbl %al,%eax
  100f0c:	c1 e0 08             	shl    $0x8,%eax
  100f0f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    outb(addr_6845, 15);
  100f12:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  100f19:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  100f1d:	c6 45 ed 0f          	movb   $0xf,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f21:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100f25:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100f29:	ee                   	out    %al,(%dx)
}
  100f2a:	90                   	nop
    pos |= inb(addr_6845 + 1);                             //读出了光标位置(低位)
  100f2b:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  100f32:	40                   	inc    %eax
  100f33:	0f b7 c0             	movzwl %ax,%eax
  100f36:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100f3a:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100f3e:	89 c2                	mov    %eax,%edx
  100f40:	ec                   	in     (%dx),%al
  100f41:	88 45 f1             	mov    %al,-0xf(%ebp)
    return data;
  100f44:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100f48:	0f b6 c0             	movzbl %al,%eax
  100f4b:	09 45 f4             	or     %eax,-0xc(%ebp)

    crt_buf = (uint16_t*) cp;                                  //crt_buf是CGA显存起始地址
  100f4e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100f51:	a3 60 fe 10 00       	mov    %eax,0x10fe60
    crt_pos = pos;                                                  //crt_pos是CGA当前光标位置
  100f56:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100f59:	0f b7 c0             	movzwl %ax,%eax
  100f5c:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
}
  100f62:	90                   	nop
  100f63:	c9                   	leave  
  100f64:	c3                   	ret    

00100f65 <serial_init>:

static bool serial_exists = 0;

static void
serial_init(void) {
  100f65:	f3 0f 1e fb          	endbr32 
  100f69:	55                   	push   %ebp
  100f6a:	89 e5                	mov    %esp,%ebp
  100f6c:	83 ec 48             	sub    $0x48,%esp
  100f6f:	66 c7 45 d2 fa 03    	movw   $0x3fa,-0x2e(%ebp)
  100f75:	c6 45 d1 00          	movb   $0x0,-0x2f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f79:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  100f7d:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  100f81:	ee                   	out    %al,(%dx)
}
  100f82:	90                   	nop
  100f83:	66 c7 45 d6 fb 03    	movw   $0x3fb,-0x2a(%ebp)
  100f89:	c6 45 d5 80          	movb   $0x80,-0x2b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f8d:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  100f91:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  100f95:	ee                   	out    %al,(%dx)
}
  100f96:	90                   	nop
  100f97:	66 c7 45 da f8 03    	movw   $0x3f8,-0x26(%ebp)
  100f9d:	c6 45 d9 0c          	movb   $0xc,-0x27(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100fa1:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  100fa5:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  100fa9:	ee                   	out    %al,(%dx)
}
  100faa:	90                   	nop
  100fab:	66 c7 45 de f9 03    	movw   $0x3f9,-0x22(%ebp)
  100fb1:	c6 45 dd 00          	movb   $0x0,-0x23(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100fb5:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  100fb9:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  100fbd:	ee                   	out    %al,(%dx)
}
  100fbe:	90                   	nop
  100fbf:	66 c7 45 e2 fb 03    	movw   $0x3fb,-0x1e(%ebp)
  100fc5:	c6 45 e1 03          	movb   $0x3,-0x1f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100fc9:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  100fcd:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  100fd1:	ee                   	out    %al,(%dx)
}
  100fd2:	90                   	nop
  100fd3:	66 c7 45 e6 fc 03    	movw   $0x3fc,-0x1a(%ebp)
  100fd9:	c6 45 e5 00          	movb   $0x0,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100fdd:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100fe1:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100fe5:	ee                   	out    %al,(%dx)
}
  100fe6:	90                   	nop
  100fe7:	66 c7 45 ea f9 03    	movw   $0x3f9,-0x16(%ebp)
  100fed:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100ff1:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100ff5:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100ff9:	ee                   	out    %al,(%dx)
}
  100ffa:	90                   	nop
  100ffb:	66 c7 45 ee fd 03    	movw   $0x3fd,-0x12(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101001:	0f b7 45 ee          	movzwl -0x12(%ebp),%eax
  101005:	89 c2                	mov    %eax,%edx
  101007:	ec                   	in     (%dx),%al
  101008:	88 45 ed             	mov    %al,-0x13(%ebp)
    return data;
  10100b:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
    // Enable rcv interrupts
    outb(COM1 + COM_IER, COM_IER_RDI);

    // Clear any preexisting overrun indications and interrupts
    // Serial port doesn't exist if COM_LSR returns 0xFF
    serial_exists = (inb(COM1 + COM_LSR) != 0xFF);
  10100f:	3c ff                	cmp    $0xff,%al
  101011:	0f 95 c0             	setne  %al
  101014:	0f b6 c0             	movzbl %al,%eax
  101017:	a3 68 fe 10 00       	mov    %eax,0x10fe68
  10101c:	66 c7 45 f2 fa 03    	movw   $0x3fa,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101022:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  101026:	89 c2                	mov    %eax,%edx
  101028:	ec                   	in     (%dx),%al
  101029:	88 45 f1             	mov    %al,-0xf(%ebp)
  10102c:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  101032:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  101036:	89 c2                	mov    %eax,%edx
  101038:	ec                   	in     (%dx),%al
  101039:	88 45 f5             	mov    %al,-0xb(%ebp)
    (void) inb(COM1+COM_IIR);
    (void) inb(COM1+COM_RX);

    if (serial_exists) {
  10103c:	a1 68 fe 10 00       	mov    0x10fe68,%eax
  101041:	85 c0                	test   %eax,%eax
  101043:	74 0c                	je     101051 <serial_init+0xec>
        pic_enable(IRQ_COM1);
  101045:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  10104c:	e8 0b 07 00 00       	call   10175c <pic_enable>
    }
}
  101051:	90                   	nop
  101052:	c9                   	leave  
  101053:	c3                   	ret    

00101054 <lpt_putc_sub>:

static void
lpt_putc_sub(int c) {
  101054:	f3 0f 1e fb          	endbr32 
  101058:	55                   	push   %ebp
  101059:	89 e5                	mov    %esp,%ebp
  10105b:	83 ec 20             	sub    $0x20,%esp
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  10105e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101065:	eb 08                	jmp    10106f <lpt_putc_sub+0x1b>
        delay();
  101067:	e8 c2 fd ff ff       	call   100e2e <delay>
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  10106c:	ff 45 fc             	incl   -0x4(%ebp)
  10106f:	66 c7 45 fa 79 03    	movw   $0x379,-0x6(%ebp)
  101075:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  101079:	89 c2                	mov    %eax,%edx
  10107b:	ec                   	in     (%dx),%al
  10107c:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  10107f:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  101083:	84 c0                	test   %al,%al
  101085:	78 09                	js     101090 <lpt_putc_sub+0x3c>
  101087:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  10108e:	7e d7                	jle    101067 <lpt_putc_sub+0x13>
    }
    outb(LPTPORT + 0, c);
  101090:	8b 45 08             	mov    0x8(%ebp),%eax
  101093:	0f b6 c0             	movzbl %al,%eax
  101096:	66 c7 45 ee 78 03    	movw   $0x378,-0x12(%ebp)
  10109c:	88 45 ed             	mov    %al,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10109f:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  1010a3:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  1010a7:	ee                   	out    %al,(%dx)
}
  1010a8:	90                   	nop
  1010a9:	66 c7 45 f2 7a 03    	movw   $0x37a,-0xe(%ebp)
  1010af:	c6 45 f1 0d          	movb   $0xd,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1010b3:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  1010b7:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  1010bb:	ee                   	out    %al,(%dx)
}
  1010bc:	90                   	nop
  1010bd:	66 c7 45 f6 7a 03    	movw   $0x37a,-0xa(%ebp)
  1010c3:	c6 45 f5 08          	movb   $0x8,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1010c7:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  1010cb:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  1010cf:	ee                   	out    %al,(%dx)
}
  1010d0:	90                   	nop
    outb(LPTPORT + 2, 0x08 | 0x04 | 0x01);
    outb(LPTPORT + 2, 0x08);
}
  1010d1:	90                   	nop
  1010d2:	c9                   	leave  
  1010d3:	c3                   	ret    

001010d4 <lpt_putc>:

/* lpt_putc - copy console output to parallel port */
static void
lpt_putc(int c) {
  1010d4:	f3 0f 1e fb          	endbr32 
  1010d8:	55                   	push   %ebp
  1010d9:	89 e5                	mov    %esp,%ebp
  1010db:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  1010de:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  1010e2:	74 0d                	je     1010f1 <lpt_putc+0x1d>
        lpt_putc_sub(c);
  1010e4:	8b 45 08             	mov    0x8(%ebp),%eax
  1010e7:	89 04 24             	mov    %eax,(%esp)
  1010ea:	e8 65 ff ff ff       	call   101054 <lpt_putc_sub>
    else {
        lpt_putc_sub('\b');
        lpt_putc_sub(' ');
        lpt_putc_sub('\b');
    }
}
  1010ef:	eb 24                	jmp    101115 <lpt_putc+0x41>
        lpt_putc_sub('\b');
  1010f1:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  1010f8:	e8 57 ff ff ff       	call   101054 <lpt_putc_sub>
        lpt_putc_sub(' ');
  1010fd:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  101104:	e8 4b ff ff ff       	call   101054 <lpt_putc_sub>
        lpt_putc_sub('\b');
  101109:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101110:	e8 3f ff ff ff       	call   101054 <lpt_putc_sub>
}
  101115:	90                   	nop
  101116:	c9                   	leave  
  101117:	c3                   	ret    

00101118 <cga_putc>:

/* cga_putc - print character to console */
static void
cga_putc(int c) {
  101118:	f3 0f 1e fb          	endbr32 
  10111c:	55                   	push   %ebp
  10111d:	89 e5                	mov    %esp,%ebp
  10111f:	53                   	push   %ebx
  101120:	83 ec 34             	sub    $0x34,%esp
    // set black on white
    if (!(c & ~0xFF)) {
  101123:	8b 45 08             	mov    0x8(%ebp),%eax
  101126:	25 00 ff ff ff       	and    $0xffffff00,%eax
  10112b:	85 c0                	test   %eax,%eax
  10112d:	75 07                	jne    101136 <cga_putc+0x1e>
        c |= 0x0700;
  10112f:	81 4d 08 00 07 00 00 	orl    $0x700,0x8(%ebp)
    }

    switch (c & 0xff) {
  101136:	8b 45 08             	mov    0x8(%ebp),%eax
  101139:	0f b6 c0             	movzbl %al,%eax
  10113c:	83 f8 0d             	cmp    $0xd,%eax
  10113f:	74 72                	je     1011b3 <cga_putc+0x9b>
  101141:	83 f8 0d             	cmp    $0xd,%eax
  101144:	0f 8f a3 00 00 00    	jg     1011ed <cga_putc+0xd5>
  10114a:	83 f8 08             	cmp    $0x8,%eax
  10114d:	74 0a                	je     101159 <cga_putc+0x41>
  10114f:	83 f8 0a             	cmp    $0xa,%eax
  101152:	74 4c                	je     1011a0 <cga_putc+0x88>
  101154:	e9 94 00 00 00       	jmp    1011ed <cga_putc+0xd5>
    case '\b':
        if (crt_pos > 0) {
  101159:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  101160:	85 c0                	test   %eax,%eax
  101162:	0f 84 af 00 00 00    	je     101217 <cga_putc+0xff>
            crt_pos --;
  101168:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  10116f:	48                   	dec    %eax
  101170:	0f b7 c0             	movzwl %ax,%eax
  101173:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
  101179:	8b 45 08             	mov    0x8(%ebp),%eax
  10117c:	98                   	cwtl   
  10117d:	25 00 ff ff ff       	and    $0xffffff00,%eax
  101182:	98                   	cwtl   
  101183:	83 c8 20             	or     $0x20,%eax
  101186:	98                   	cwtl   
  101187:	8b 15 60 fe 10 00    	mov    0x10fe60,%edx
  10118d:	0f b7 0d 64 fe 10 00 	movzwl 0x10fe64,%ecx
  101194:	01 c9                	add    %ecx,%ecx
  101196:	01 ca                	add    %ecx,%edx
  101198:	0f b7 c0             	movzwl %ax,%eax
  10119b:	66 89 02             	mov    %ax,(%edx)
        }
        break;
  10119e:	eb 77                	jmp    101217 <cga_putc+0xff>
    case '\n':
        crt_pos += CRT_COLS;
  1011a0:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  1011a7:	83 c0 50             	add    $0x50,%eax
  1011aa:	0f b7 c0             	movzwl %ax,%eax
  1011ad:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
    case '\r':
        crt_pos -= (crt_pos % CRT_COLS);
  1011b3:	0f b7 1d 64 fe 10 00 	movzwl 0x10fe64,%ebx
  1011ba:	0f b7 0d 64 fe 10 00 	movzwl 0x10fe64,%ecx
  1011c1:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
  1011c6:	89 c8                	mov    %ecx,%eax
  1011c8:	f7 e2                	mul    %edx
  1011ca:	c1 ea 06             	shr    $0x6,%edx
  1011cd:	89 d0                	mov    %edx,%eax
  1011cf:	c1 e0 02             	shl    $0x2,%eax
  1011d2:	01 d0                	add    %edx,%eax
  1011d4:	c1 e0 04             	shl    $0x4,%eax
  1011d7:	29 c1                	sub    %eax,%ecx
  1011d9:	89 c8                	mov    %ecx,%eax
  1011db:	0f b7 c0             	movzwl %ax,%eax
  1011de:	29 c3                	sub    %eax,%ebx
  1011e0:	89 d8                	mov    %ebx,%eax
  1011e2:	0f b7 c0             	movzwl %ax,%eax
  1011e5:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
        break;
  1011eb:	eb 2b                	jmp    101218 <cga_putc+0x100>
    default:
        crt_buf[crt_pos ++] = c;     // write the character
  1011ed:	8b 0d 60 fe 10 00    	mov    0x10fe60,%ecx
  1011f3:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  1011fa:	8d 50 01             	lea    0x1(%eax),%edx
  1011fd:	0f b7 d2             	movzwl %dx,%edx
  101200:	66 89 15 64 fe 10 00 	mov    %dx,0x10fe64
  101207:	01 c0                	add    %eax,%eax
  101209:	8d 14 01             	lea    (%ecx,%eax,1),%edx
  10120c:	8b 45 08             	mov    0x8(%ebp),%eax
  10120f:	0f b7 c0             	movzwl %ax,%eax
  101212:	66 89 02             	mov    %ax,(%edx)
        break;
  101215:	eb 01                	jmp    101218 <cga_putc+0x100>
        break;
  101217:	90                   	nop
    }

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
  101218:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  10121f:	3d cf 07 00 00       	cmp    $0x7cf,%eax
  101224:	76 5d                	jbe    101283 <cga_putc+0x16b>
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
  101226:	a1 60 fe 10 00       	mov    0x10fe60,%eax
  10122b:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  101231:	a1 60 fe 10 00       	mov    0x10fe60,%eax
  101236:	c7 44 24 08 00 0f 00 	movl   $0xf00,0x8(%esp)
  10123d:	00 
  10123e:	89 54 24 04          	mov    %edx,0x4(%esp)
  101242:	89 04 24             	mov    %eax,(%esp)
  101245:	e8 9a 1b 00 00       	call   102de4 <memmove>
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  10124a:	c7 45 f4 80 07 00 00 	movl   $0x780,-0xc(%ebp)
  101251:	eb 14                	jmp    101267 <cga_putc+0x14f>
            crt_buf[i] = 0x0700 | ' ';
  101253:	a1 60 fe 10 00       	mov    0x10fe60,%eax
  101258:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10125b:	01 d2                	add    %edx,%edx
  10125d:	01 d0                	add    %edx,%eax
  10125f:	66 c7 00 20 07       	movw   $0x720,(%eax)
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  101264:	ff 45 f4             	incl   -0xc(%ebp)
  101267:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
  10126e:	7e e3                	jle    101253 <cga_putc+0x13b>
        }
        crt_pos -= CRT_COLS;
  101270:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  101277:	83 e8 50             	sub    $0x50,%eax
  10127a:	0f b7 c0             	movzwl %ax,%eax
  10127d:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
    }

    // move that little blinky thing
    outb(addr_6845, 14);
  101283:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  10128a:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
  10128e:	c6 45 e5 0e          	movb   $0xe,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101292:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  101296:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  10129a:	ee                   	out    %al,(%dx)
}
  10129b:	90                   	nop
    outb(addr_6845 + 1, crt_pos >> 8);
  10129c:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  1012a3:	c1 e8 08             	shr    $0x8,%eax
  1012a6:	0f b7 c0             	movzwl %ax,%eax
  1012a9:	0f b6 c0             	movzbl %al,%eax
  1012ac:	0f b7 15 66 fe 10 00 	movzwl 0x10fe66,%edx
  1012b3:	42                   	inc    %edx
  1012b4:	0f b7 d2             	movzwl %dx,%edx
  1012b7:	66 89 55 ea          	mov    %dx,-0x16(%ebp)
  1012bb:	88 45 e9             	mov    %al,-0x17(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1012be:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  1012c2:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  1012c6:	ee                   	out    %al,(%dx)
}
  1012c7:	90                   	nop
    outb(addr_6845, 15);
  1012c8:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  1012cf:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  1012d3:	c6 45 ed 0f          	movb   $0xf,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1012d7:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  1012db:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  1012df:	ee                   	out    %al,(%dx)
}
  1012e0:	90                   	nop
    outb(addr_6845 + 1, crt_pos);
  1012e1:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  1012e8:	0f b6 c0             	movzbl %al,%eax
  1012eb:	0f b7 15 66 fe 10 00 	movzwl 0x10fe66,%edx
  1012f2:	42                   	inc    %edx
  1012f3:	0f b7 d2             	movzwl %dx,%edx
  1012f6:	66 89 55 f2          	mov    %dx,-0xe(%ebp)
  1012fa:	88 45 f1             	mov    %al,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1012fd:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  101301:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  101305:	ee                   	out    %al,(%dx)
}
  101306:	90                   	nop
}
  101307:	90                   	nop
  101308:	83 c4 34             	add    $0x34,%esp
  10130b:	5b                   	pop    %ebx
  10130c:	5d                   	pop    %ebp
  10130d:	c3                   	ret    

0010130e <serial_putc_sub>:

static void
serial_putc_sub(int c) {
  10130e:	f3 0f 1e fb          	endbr32 
  101312:	55                   	push   %ebp
  101313:	89 e5                	mov    %esp,%ebp
  101315:	83 ec 10             	sub    $0x10,%esp
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  101318:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  10131f:	eb 08                	jmp    101329 <serial_putc_sub+0x1b>
        delay();
  101321:	e8 08 fb ff ff       	call   100e2e <delay>
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  101326:	ff 45 fc             	incl   -0x4(%ebp)
  101329:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10132f:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  101333:	89 c2                	mov    %eax,%edx
  101335:	ec                   	in     (%dx),%al
  101336:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  101339:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  10133d:	0f b6 c0             	movzbl %al,%eax
  101340:	83 e0 20             	and    $0x20,%eax
  101343:	85 c0                	test   %eax,%eax
  101345:	75 09                	jne    101350 <serial_putc_sub+0x42>
  101347:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  10134e:	7e d1                	jle    101321 <serial_putc_sub+0x13>
    }
    outb(COM1 + COM_TX, c);
  101350:	8b 45 08             	mov    0x8(%ebp),%eax
  101353:	0f b6 c0             	movzbl %al,%eax
  101356:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  10135c:	88 45 f5             	mov    %al,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10135f:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  101363:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  101367:	ee                   	out    %al,(%dx)
}
  101368:	90                   	nop
}
  101369:	90                   	nop
  10136a:	c9                   	leave  
  10136b:	c3                   	ret    

0010136c <serial_putc>:

/* serial_putc - print character to serial port */
static void
serial_putc(int c) {
  10136c:	f3 0f 1e fb          	endbr32 
  101370:	55                   	push   %ebp
  101371:	89 e5                	mov    %esp,%ebp
  101373:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  101376:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  10137a:	74 0d                	je     101389 <serial_putc+0x1d>
        serial_putc_sub(c);
  10137c:	8b 45 08             	mov    0x8(%ebp),%eax
  10137f:	89 04 24             	mov    %eax,(%esp)
  101382:	e8 87 ff ff ff       	call   10130e <serial_putc_sub>
    else {
        serial_putc_sub('\b');
        serial_putc_sub(' ');
        serial_putc_sub('\b');
    }
}
  101387:	eb 24                	jmp    1013ad <serial_putc+0x41>
        serial_putc_sub('\b');
  101389:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101390:	e8 79 ff ff ff       	call   10130e <serial_putc_sub>
        serial_putc_sub(' ');
  101395:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  10139c:	e8 6d ff ff ff       	call   10130e <serial_putc_sub>
        serial_putc_sub('\b');
  1013a1:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  1013a8:	e8 61 ff ff ff       	call   10130e <serial_putc_sub>
}
  1013ad:	90                   	nop
  1013ae:	c9                   	leave  
  1013af:	c3                   	ret    

001013b0 <cons_intr>:
/* *
 * cons_intr - called by device interrupt routines to feed input
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
  1013b0:	f3 0f 1e fb          	endbr32 
  1013b4:	55                   	push   %ebp
  1013b5:	89 e5                	mov    %esp,%ebp
  1013b7:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = (*proc)()) != -1) {
  1013ba:	eb 33                	jmp    1013ef <cons_intr+0x3f>
        if (c != 0) {
  1013bc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1013c0:	74 2d                	je     1013ef <cons_intr+0x3f>
            cons.buf[cons.wpos ++] = c;
  1013c2:	a1 84 00 11 00       	mov    0x110084,%eax
  1013c7:	8d 50 01             	lea    0x1(%eax),%edx
  1013ca:	89 15 84 00 11 00    	mov    %edx,0x110084
  1013d0:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1013d3:	88 90 80 fe 10 00    	mov    %dl,0x10fe80(%eax)
            if (cons.wpos == CONSBUFSIZE) {
  1013d9:	a1 84 00 11 00       	mov    0x110084,%eax
  1013de:	3d 00 02 00 00       	cmp    $0x200,%eax
  1013e3:	75 0a                	jne    1013ef <cons_intr+0x3f>
                cons.wpos = 0;
  1013e5:	c7 05 84 00 11 00 00 	movl   $0x0,0x110084
  1013ec:	00 00 00 
    while ((c = (*proc)()) != -1) {
  1013ef:	8b 45 08             	mov    0x8(%ebp),%eax
  1013f2:	ff d0                	call   *%eax
  1013f4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1013f7:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
  1013fb:	75 bf                	jne    1013bc <cons_intr+0xc>
            }
        }
    }
}
  1013fd:	90                   	nop
  1013fe:	90                   	nop
  1013ff:	c9                   	leave  
  101400:	c3                   	ret    

00101401 <serial_proc_data>:

/* serial_proc_data - get data from serial port */
static int
serial_proc_data(void) {
  101401:	f3 0f 1e fb          	endbr32 
  101405:	55                   	push   %ebp
  101406:	89 e5                	mov    %esp,%ebp
  101408:	83 ec 10             	sub    $0x10,%esp
  10140b:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101411:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  101415:	89 c2                	mov    %eax,%edx
  101417:	ec                   	in     (%dx),%al
  101418:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  10141b:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
    if (!(inb(COM1 + COM_LSR) & COM_LSR_DATA)) {
  10141f:	0f b6 c0             	movzbl %al,%eax
  101422:	83 e0 01             	and    $0x1,%eax
  101425:	85 c0                	test   %eax,%eax
  101427:	75 07                	jne    101430 <serial_proc_data+0x2f>
        return -1;
  101429:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10142e:	eb 2a                	jmp    10145a <serial_proc_data+0x59>
  101430:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101436:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10143a:	89 c2                	mov    %eax,%edx
  10143c:	ec                   	in     (%dx),%al
  10143d:	88 45 f5             	mov    %al,-0xb(%ebp)
    return data;
  101440:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
    }
    int c = inb(COM1 + COM_RX);
  101444:	0f b6 c0             	movzbl %al,%eax
  101447:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if (c == 127) {
  10144a:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%ebp)
  10144e:	75 07                	jne    101457 <serial_proc_data+0x56>
        c = '\b';
  101450:	c7 45 fc 08 00 00 00 	movl   $0x8,-0x4(%ebp)
    }
    return c;
  101457:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  10145a:	c9                   	leave  
  10145b:	c3                   	ret    

0010145c <serial_intr>:

/* serial_intr - try to feed input characters from serial port */
void
serial_intr(void) {
  10145c:	f3 0f 1e fb          	endbr32 
  101460:	55                   	push   %ebp
  101461:	89 e5                	mov    %esp,%ebp
  101463:	83 ec 18             	sub    $0x18,%esp
    if (serial_exists) {
  101466:	a1 68 fe 10 00       	mov    0x10fe68,%eax
  10146b:	85 c0                	test   %eax,%eax
  10146d:	74 0c                	je     10147b <serial_intr+0x1f>
        cons_intr(serial_proc_data);
  10146f:	c7 04 24 01 14 10 00 	movl   $0x101401,(%esp)
  101476:	e8 35 ff ff ff       	call   1013b0 <cons_intr>
    }
}
  10147b:	90                   	nop
  10147c:	c9                   	leave  
  10147d:	c3                   	ret    

0010147e <kbd_proc_data>:
 *
 * The kbd_proc_data() function gets data from the keyboard.
 * If we finish a character, return it, else 0. And return -1 if no data.
 * */
static int
kbd_proc_data(void) {
  10147e:	f3 0f 1e fb          	endbr32 
  101482:	55                   	push   %ebp
  101483:	89 e5                	mov    %esp,%ebp
  101485:	83 ec 38             	sub    $0x38,%esp
  101488:	66 c7 45 f0 64 00    	movw   $0x64,-0x10(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10148e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101491:	89 c2                	mov    %eax,%edx
  101493:	ec                   	in     (%dx),%al
  101494:	88 45 ef             	mov    %al,-0x11(%ebp)
    return data;
  101497:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    int c;
    uint8_t data;
    static uint32_t shift;

    if ((inb(KBSTATP) & KBS_DIB) == 0) {
  10149b:	0f b6 c0             	movzbl %al,%eax
  10149e:	83 e0 01             	and    $0x1,%eax
  1014a1:	85 c0                	test   %eax,%eax
  1014a3:	75 0a                	jne    1014af <kbd_proc_data+0x31>
        return -1;
  1014a5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1014aa:	e9 56 01 00 00       	jmp    101605 <kbd_proc_data+0x187>
  1014af:	66 c7 45 ec 60 00    	movw   $0x60,-0x14(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1014b5:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1014b8:	89 c2                	mov    %eax,%edx
  1014ba:	ec                   	in     (%dx),%al
  1014bb:	88 45 eb             	mov    %al,-0x15(%ebp)
    return data;
  1014be:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
    }

    data = inb(KBDATAP);
  1014c2:	88 45 f3             	mov    %al,-0xd(%ebp)

    if (data == 0xE0) {
  1014c5:	80 7d f3 e0          	cmpb   $0xe0,-0xd(%ebp)
  1014c9:	75 17                	jne    1014e2 <kbd_proc_data+0x64>
        // E0 escape character
        shift |= E0ESC;
  1014cb:	a1 88 00 11 00       	mov    0x110088,%eax
  1014d0:	83 c8 40             	or     $0x40,%eax
  1014d3:	a3 88 00 11 00       	mov    %eax,0x110088
        return 0;
  1014d8:	b8 00 00 00 00       	mov    $0x0,%eax
  1014dd:	e9 23 01 00 00       	jmp    101605 <kbd_proc_data+0x187>
    } else if (data & 0x80) {
  1014e2:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014e6:	84 c0                	test   %al,%al
  1014e8:	79 45                	jns    10152f <kbd_proc_data+0xb1>
        // Key released
        data = (shift & E0ESC ? data : data & 0x7F);
  1014ea:	a1 88 00 11 00       	mov    0x110088,%eax
  1014ef:	83 e0 40             	and    $0x40,%eax
  1014f2:	85 c0                	test   %eax,%eax
  1014f4:	75 08                	jne    1014fe <kbd_proc_data+0x80>
  1014f6:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014fa:	24 7f                	and    $0x7f,%al
  1014fc:	eb 04                	jmp    101502 <kbd_proc_data+0x84>
  1014fe:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101502:	88 45 f3             	mov    %al,-0xd(%ebp)
        shift &= ~(shiftcode[data] | E0ESC);
  101505:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101509:	0f b6 80 40 f0 10 00 	movzbl 0x10f040(%eax),%eax
  101510:	0c 40                	or     $0x40,%al
  101512:	0f b6 c0             	movzbl %al,%eax
  101515:	f7 d0                	not    %eax
  101517:	89 c2                	mov    %eax,%edx
  101519:	a1 88 00 11 00       	mov    0x110088,%eax
  10151e:	21 d0                	and    %edx,%eax
  101520:	a3 88 00 11 00       	mov    %eax,0x110088
        return 0;
  101525:	b8 00 00 00 00       	mov    $0x0,%eax
  10152a:	e9 d6 00 00 00       	jmp    101605 <kbd_proc_data+0x187>
    } else if (shift & E0ESC) {
  10152f:	a1 88 00 11 00       	mov    0x110088,%eax
  101534:	83 e0 40             	and    $0x40,%eax
  101537:	85 c0                	test   %eax,%eax
  101539:	74 11                	je     10154c <kbd_proc_data+0xce>
        // Last character was an E0 escape; or with 0x80
        data |= 0x80;
  10153b:	80 4d f3 80          	orb    $0x80,-0xd(%ebp)
        shift &= ~E0ESC;
  10153f:	a1 88 00 11 00       	mov    0x110088,%eax
  101544:	83 e0 bf             	and    $0xffffffbf,%eax
  101547:	a3 88 00 11 00       	mov    %eax,0x110088
    }

    shift |= shiftcode[data];
  10154c:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101550:	0f b6 80 40 f0 10 00 	movzbl 0x10f040(%eax),%eax
  101557:	0f b6 d0             	movzbl %al,%edx
  10155a:	a1 88 00 11 00       	mov    0x110088,%eax
  10155f:	09 d0                	or     %edx,%eax
  101561:	a3 88 00 11 00       	mov    %eax,0x110088
    shift ^= togglecode[data];
  101566:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10156a:	0f b6 80 40 f1 10 00 	movzbl 0x10f140(%eax),%eax
  101571:	0f b6 d0             	movzbl %al,%edx
  101574:	a1 88 00 11 00       	mov    0x110088,%eax
  101579:	31 d0                	xor    %edx,%eax
  10157b:	a3 88 00 11 00       	mov    %eax,0x110088

    c = charcode[shift & (CTL | SHIFT)][data];
  101580:	a1 88 00 11 00       	mov    0x110088,%eax
  101585:	83 e0 03             	and    $0x3,%eax
  101588:	8b 14 85 40 f5 10 00 	mov    0x10f540(,%eax,4),%edx
  10158f:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101593:	01 d0                	add    %edx,%eax
  101595:	0f b6 00             	movzbl (%eax),%eax
  101598:	0f b6 c0             	movzbl %al,%eax
  10159b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if (shift & CAPSLOCK) {
  10159e:	a1 88 00 11 00       	mov    0x110088,%eax
  1015a3:	83 e0 08             	and    $0x8,%eax
  1015a6:	85 c0                	test   %eax,%eax
  1015a8:	74 22                	je     1015cc <kbd_proc_data+0x14e>
        if ('a' <= c && c <= 'z')
  1015aa:	83 7d f4 60          	cmpl   $0x60,-0xc(%ebp)
  1015ae:	7e 0c                	jle    1015bc <kbd_proc_data+0x13e>
  1015b0:	83 7d f4 7a          	cmpl   $0x7a,-0xc(%ebp)
  1015b4:	7f 06                	jg     1015bc <kbd_proc_data+0x13e>
            c += 'A' - 'a';
  1015b6:	83 6d f4 20          	subl   $0x20,-0xc(%ebp)
  1015ba:	eb 10                	jmp    1015cc <kbd_proc_data+0x14e>
        else if ('A' <= c && c <= 'Z')
  1015bc:	83 7d f4 40          	cmpl   $0x40,-0xc(%ebp)
  1015c0:	7e 0a                	jle    1015cc <kbd_proc_data+0x14e>
  1015c2:	83 7d f4 5a          	cmpl   $0x5a,-0xc(%ebp)
  1015c6:	7f 04                	jg     1015cc <kbd_proc_data+0x14e>
            c += 'a' - 'A';
  1015c8:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
    }

    // Process special keys
    // Ctrl-Alt-Del: reboot
    if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
  1015cc:	a1 88 00 11 00       	mov    0x110088,%eax
  1015d1:	f7 d0                	not    %eax
  1015d3:	83 e0 06             	and    $0x6,%eax
  1015d6:	85 c0                	test   %eax,%eax
  1015d8:	75 28                	jne    101602 <kbd_proc_data+0x184>
  1015da:	81 7d f4 e9 00 00 00 	cmpl   $0xe9,-0xc(%ebp)
  1015e1:	75 1f                	jne    101602 <kbd_proc_data+0x184>
        cprintf("Rebooting!\n");
  1015e3:	c7 04 24 0d 39 10 00 	movl   $0x10390d,(%esp)
  1015ea:	e8 95 ec ff ff       	call   100284 <cprintf>
  1015ef:	66 c7 45 e8 92 00    	movw   $0x92,-0x18(%ebp)
  1015f5:	c6 45 e7 03          	movb   $0x3,-0x19(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1015f9:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  1015fd:	8b 55 e8             	mov    -0x18(%ebp),%edx
  101600:	ee                   	out    %al,(%dx)
}
  101601:	90                   	nop
        outb(0x92, 0x3); // courtesy of Chris Frost
    }
    return c;
  101602:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  101605:	c9                   	leave  
  101606:	c3                   	ret    

00101607 <kbd_intr>:

/* kbd_intr - try to feed input characters from keyboard */
static void
kbd_intr(void) {
  101607:	f3 0f 1e fb          	endbr32 
  10160b:	55                   	push   %ebp
  10160c:	89 e5                	mov    %esp,%ebp
  10160e:	83 ec 18             	sub    $0x18,%esp
    cons_intr(kbd_proc_data);
  101611:	c7 04 24 7e 14 10 00 	movl   $0x10147e,(%esp)
  101618:	e8 93 fd ff ff       	call   1013b0 <cons_intr>
}
  10161d:	90                   	nop
  10161e:	c9                   	leave  
  10161f:	c3                   	ret    

00101620 <kbd_init>:

static void
kbd_init(void) {
  101620:	f3 0f 1e fb          	endbr32 
  101624:	55                   	push   %ebp
  101625:	89 e5                	mov    %esp,%ebp
  101627:	83 ec 18             	sub    $0x18,%esp
    // drain the kbd buffer
    kbd_intr();
  10162a:	e8 d8 ff ff ff       	call   101607 <kbd_intr>
    pic_enable(IRQ_KBD);
  10162f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  101636:	e8 21 01 00 00       	call   10175c <pic_enable>
}
  10163b:	90                   	nop
  10163c:	c9                   	leave  
  10163d:	c3                   	ret    

0010163e <cons_init>:

/* cons_init - initializes the console devices */
void
cons_init(void) {
  10163e:	f3 0f 1e fb          	endbr32 
  101642:	55                   	push   %ebp
  101643:	89 e5                	mov    %esp,%ebp
  101645:	83 ec 18             	sub    $0x18,%esp
    cga_init();
  101648:	e8 2e f8 ff ff       	call   100e7b <cga_init>
    serial_init();
  10164d:	e8 13 f9 ff ff       	call   100f65 <serial_init>
    kbd_init();
  101652:	e8 c9 ff ff ff       	call   101620 <kbd_init>
    if (!serial_exists) {
  101657:	a1 68 fe 10 00       	mov    0x10fe68,%eax
  10165c:	85 c0                	test   %eax,%eax
  10165e:	75 0c                	jne    10166c <cons_init+0x2e>
        cprintf("serial port does not exist!!\n");
  101660:	c7 04 24 19 39 10 00 	movl   $0x103919,(%esp)
  101667:	e8 18 ec ff ff       	call   100284 <cprintf>
    }
}
  10166c:	90                   	nop
  10166d:	c9                   	leave  
  10166e:	c3                   	ret    

0010166f <cons_putc>:

/* cons_putc - print a single character @c to console devices */
void
cons_putc(int c) {
  10166f:	f3 0f 1e fb          	endbr32 
  101673:	55                   	push   %ebp
  101674:	89 e5                	mov    %esp,%ebp
  101676:	83 ec 18             	sub    $0x18,%esp
    lpt_putc(c);
  101679:	8b 45 08             	mov    0x8(%ebp),%eax
  10167c:	89 04 24             	mov    %eax,(%esp)
  10167f:	e8 50 fa ff ff       	call   1010d4 <lpt_putc>
    cga_putc(c);
  101684:	8b 45 08             	mov    0x8(%ebp),%eax
  101687:	89 04 24             	mov    %eax,(%esp)
  10168a:	e8 89 fa ff ff       	call   101118 <cga_putc>
    serial_putc(c);
  10168f:	8b 45 08             	mov    0x8(%ebp),%eax
  101692:	89 04 24             	mov    %eax,(%esp)
  101695:	e8 d2 fc ff ff       	call   10136c <serial_putc>
}
  10169a:	90                   	nop
  10169b:	c9                   	leave  
  10169c:	c3                   	ret    

0010169d <cons_getc>:
/* *
 * cons_getc - return the next input character from console,
 * or 0 if none waiting.
 * */
int
cons_getc(void) {
  10169d:	f3 0f 1e fb          	endbr32 
  1016a1:	55                   	push   %ebp
  1016a2:	89 e5                	mov    %esp,%ebp
  1016a4:	83 ec 18             	sub    $0x18,%esp
    int c;

    // poll for any pending input characters,
    // so that this function works even when interrupts are disabled
    // (e.g., when called from the kernel monitor).
    serial_intr();
  1016a7:	e8 b0 fd ff ff       	call   10145c <serial_intr>
    kbd_intr();
  1016ac:	e8 56 ff ff ff       	call   101607 <kbd_intr>

    // grab the next character from the input buffer.
    if (cons.rpos != cons.wpos) {
  1016b1:	8b 15 80 00 11 00    	mov    0x110080,%edx
  1016b7:	a1 84 00 11 00       	mov    0x110084,%eax
  1016bc:	39 c2                	cmp    %eax,%edx
  1016be:	74 36                	je     1016f6 <cons_getc+0x59>
        c = cons.buf[cons.rpos ++];
  1016c0:	a1 80 00 11 00       	mov    0x110080,%eax
  1016c5:	8d 50 01             	lea    0x1(%eax),%edx
  1016c8:	89 15 80 00 11 00    	mov    %edx,0x110080
  1016ce:	0f b6 80 80 fe 10 00 	movzbl 0x10fe80(%eax),%eax
  1016d5:	0f b6 c0             	movzbl %al,%eax
  1016d8:	89 45 f4             	mov    %eax,-0xc(%ebp)
        if (cons.rpos == CONSBUFSIZE) {
  1016db:	a1 80 00 11 00       	mov    0x110080,%eax
  1016e0:	3d 00 02 00 00       	cmp    $0x200,%eax
  1016e5:	75 0a                	jne    1016f1 <cons_getc+0x54>
            cons.rpos = 0;
  1016e7:	c7 05 80 00 11 00 00 	movl   $0x0,0x110080
  1016ee:	00 00 00 
        }
        return c;
  1016f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1016f4:	eb 05                	jmp    1016fb <cons_getc+0x5e>
    }
    return 0;
  1016f6:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1016fb:	c9                   	leave  
  1016fc:	c3                   	ret    

001016fd <pic_setmask>:
// Initial IRQ mask has interrupt 2 enabled (for slave 8259A).
static uint16_t irq_mask = 0xFFFF & ~(1 << IRQ_SLAVE);
static bool did_init = 0;

static void
pic_setmask(uint16_t mask) {
  1016fd:	f3 0f 1e fb          	endbr32 
  101701:	55                   	push   %ebp
  101702:	89 e5                	mov    %esp,%ebp
  101704:	83 ec 14             	sub    $0x14,%esp
  101707:	8b 45 08             	mov    0x8(%ebp),%eax
  10170a:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    irq_mask = mask;
  10170e:	8b 45 ec             	mov    -0x14(%ebp),%eax
  101711:	66 a3 50 f5 10 00    	mov    %ax,0x10f550
    if (did_init) {
  101717:	a1 8c 00 11 00       	mov    0x11008c,%eax
  10171c:	85 c0                	test   %eax,%eax
  10171e:	74 39                	je     101759 <pic_setmask+0x5c>
        outb(IO_PIC1 + 1, mask);
  101720:	8b 45 ec             	mov    -0x14(%ebp),%eax
  101723:	0f b6 c0             	movzbl %al,%eax
  101726:	66 c7 45 fa 21 00    	movw   $0x21,-0x6(%ebp)
  10172c:	88 45 f9             	mov    %al,-0x7(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10172f:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  101733:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  101737:	ee                   	out    %al,(%dx)
}
  101738:	90                   	nop
        outb(IO_PIC2 + 1, mask >> 8);
  101739:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  10173d:	c1 e8 08             	shr    $0x8,%eax
  101740:	0f b7 c0             	movzwl %ax,%eax
  101743:	0f b6 c0             	movzbl %al,%eax
  101746:	66 c7 45 fe a1 00    	movw   $0xa1,-0x2(%ebp)
  10174c:	88 45 fd             	mov    %al,-0x3(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10174f:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  101753:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  101757:	ee                   	out    %al,(%dx)
}
  101758:	90                   	nop
    }
}
  101759:	90                   	nop
  10175a:	c9                   	leave  
  10175b:	c3                   	ret    

0010175c <pic_enable>:

void
pic_enable(unsigned int irq) {
  10175c:	f3 0f 1e fb          	endbr32 
  101760:	55                   	push   %ebp
  101761:	89 e5                	mov    %esp,%ebp
  101763:	83 ec 04             	sub    $0x4,%esp
    pic_setmask(irq_mask & ~(1 << irq));
  101766:	8b 45 08             	mov    0x8(%ebp),%eax
  101769:	ba 01 00 00 00       	mov    $0x1,%edx
  10176e:	88 c1                	mov    %al,%cl
  101770:	d3 e2                	shl    %cl,%edx
  101772:	89 d0                	mov    %edx,%eax
  101774:	98                   	cwtl   
  101775:	f7 d0                	not    %eax
  101777:	0f bf d0             	movswl %ax,%edx
  10177a:	0f b7 05 50 f5 10 00 	movzwl 0x10f550,%eax
  101781:	98                   	cwtl   
  101782:	21 d0                	and    %edx,%eax
  101784:	98                   	cwtl   
  101785:	0f b7 c0             	movzwl %ax,%eax
  101788:	89 04 24             	mov    %eax,(%esp)
  10178b:	e8 6d ff ff ff       	call   1016fd <pic_setmask>
}
  101790:	90                   	nop
  101791:	c9                   	leave  
  101792:	c3                   	ret    

00101793 <pic_init>:

/* pic_init - initialize the 8259A interrupt controllers */
void
pic_init(void) {
  101793:	f3 0f 1e fb          	endbr32 
  101797:	55                   	push   %ebp
  101798:	89 e5                	mov    %esp,%ebp
  10179a:	83 ec 44             	sub    $0x44,%esp
    did_init = 1;
  10179d:	c7 05 8c 00 11 00 01 	movl   $0x1,0x11008c
  1017a4:	00 00 00 
  1017a7:	66 c7 45 ca 21 00    	movw   $0x21,-0x36(%ebp)
  1017ad:	c6 45 c9 ff          	movb   $0xff,-0x37(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017b1:	0f b6 45 c9          	movzbl -0x37(%ebp),%eax
  1017b5:	0f b7 55 ca          	movzwl -0x36(%ebp),%edx
  1017b9:	ee                   	out    %al,(%dx)
}
  1017ba:	90                   	nop
  1017bb:	66 c7 45 ce a1 00    	movw   $0xa1,-0x32(%ebp)
  1017c1:	c6 45 cd ff          	movb   $0xff,-0x33(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017c5:	0f b6 45 cd          	movzbl -0x33(%ebp),%eax
  1017c9:	0f b7 55 ce          	movzwl -0x32(%ebp),%edx
  1017cd:	ee                   	out    %al,(%dx)
}
  1017ce:	90                   	nop
  1017cf:	66 c7 45 d2 20 00    	movw   $0x20,-0x2e(%ebp)
  1017d5:	c6 45 d1 11          	movb   $0x11,-0x2f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017d9:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  1017dd:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  1017e1:	ee                   	out    %al,(%dx)
}
  1017e2:	90                   	nop
  1017e3:	66 c7 45 d6 21 00    	movw   $0x21,-0x2a(%ebp)
  1017e9:	c6 45 d5 20          	movb   $0x20,-0x2b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017ed:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  1017f1:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  1017f5:	ee                   	out    %al,(%dx)
}
  1017f6:	90                   	nop
  1017f7:	66 c7 45 da 21 00    	movw   $0x21,-0x26(%ebp)
  1017fd:	c6 45 d9 04          	movb   $0x4,-0x27(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101801:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  101805:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  101809:	ee                   	out    %al,(%dx)
}
  10180a:	90                   	nop
  10180b:	66 c7 45 de 21 00    	movw   $0x21,-0x22(%ebp)
  101811:	c6 45 dd 03          	movb   $0x3,-0x23(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101815:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  101819:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  10181d:	ee                   	out    %al,(%dx)
}
  10181e:	90                   	nop
  10181f:	66 c7 45 e2 a0 00    	movw   $0xa0,-0x1e(%ebp)
  101825:	c6 45 e1 11          	movb   $0x11,-0x1f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101829:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  10182d:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  101831:	ee                   	out    %al,(%dx)
}
  101832:	90                   	nop
  101833:	66 c7 45 e6 a1 00    	movw   $0xa1,-0x1a(%ebp)
  101839:	c6 45 e5 28          	movb   $0x28,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10183d:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  101841:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  101845:	ee                   	out    %al,(%dx)
}
  101846:	90                   	nop
  101847:	66 c7 45 ea a1 00    	movw   $0xa1,-0x16(%ebp)
  10184d:	c6 45 e9 02          	movb   $0x2,-0x17(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101851:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  101855:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  101859:	ee                   	out    %al,(%dx)
}
  10185a:	90                   	nop
  10185b:	66 c7 45 ee a1 00    	movw   $0xa1,-0x12(%ebp)
  101861:	c6 45 ed 03          	movb   $0x3,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101865:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  101869:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  10186d:	ee                   	out    %al,(%dx)
}
  10186e:	90                   	nop
  10186f:	66 c7 45 f2 20 00    	movw   $0x20,-0xe(%ebp)
  101875:	c6 45 f1 68          	movb   $0x68,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101879:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  10187d:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  101881:	ee                   	out    %al,(%dx)
}
  101882:	90                   	nop
  101883:	66 c7 45 f6 20 00    	movw   $0x20,-0xa(%ebp)
  101889:	c6 45 f5 0a          	movb   $0xa,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10188d:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  101891:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  101895:	ee                   	out    %al,(%dx)
}
  101896:	90                   	nop
  101897:	66 c7 45 fa a0 00    	movw   $0xa0,-0x6(%ebp)
  10189d:	c6 45 f9 68          	movb   $0x68,-0x7(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1018a1:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  1018a5:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  1018a9:	ee                   	out    %al,(%dx)
}
  1018aa:	90                   	nop
  1018ab:	66 c7 45 fe a0 00    	movw   $0xa0,-0x2(%ebp)
  1018b1:	c6 45 fd 0a          	movb   $0xa,-0x3(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1018b5:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  1018b9:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  1018bd:	ee                   	out    %al,(%dx)
}
  1018be:	90                   	nop
    outb(IO_PIC1, 0x0a);    // read IRR by default

    outb(IO_PIC2, 0x68);    // OCW3
    outb(IO_PIC2, 0x0a);    // OCW3

    if (irq_mask != 0xFFFF) {
  1018bf:	0f b7 05 50 f5 10 00 	movzwl 0x10f550,%eax
  1018c6:	3d ff ff 00 00       	cmp    $0xffff,%eax
  1018cb:	74 0f                	je     1018dc <pic_init+0x149>
        pic_setmask(irq_mask);
  1018cd:	0f b7 05 50 f5 10 00 	movzwl 0x10f550,%eax
  1018d4:	89 04 24             	mov    %eax,(%esp)
  1018d7:	e8 21 fe ff ff       	call   1016fd <pic_setmask>
    }
}
  1018dc:	90                   	nop
  1018dd:	c9                   	leave  
  1018de:	c3                   	ret    

001018df <intr_enable>:
#include <x86.h>
#include <intr.h>

/* intr_enable - enable irq interrupt */
void
intr_enable(void) {
  1018df:	f3 0f 1e fb          	endbr32 
  1018e3:	55                   	push   %ebp
  1018e4:	89 e5                	mov    %esp,%ebp
    asm volatile ("lidt (%0)" :: "r" (pd));
}

static inline void
sti(void) {
    asm volatile ("sti");
  1018e6:	fb                   	sti    
}
  1018e7:	90                   	nop
    sti();
}
  1018e8:	90                   	nop
  1018e9:	5d                   	pop    %ebp
  1018ea:	c3                   	ret    

001018eb <intr_disable>:

/* intr_disable - disable irq interrupt */
void
intr_disable(void) {
  1018eb:	f3 0f 1e fb          	endbr32 
  1018ef:	55                   	push   %ebp
  1018f0:	89 e5                	mov    %esp,%ebp

static inline void
cli(void) {
    asm volatile ("cli");
  1018f2:	fa                   	cli    
}
  1018f3:	90                   	nop
    cli();
}
  1018f4:	90                   	nop
  1018f5:	5d                   	pop    %ebp
  1018f6:	c3                   	ret    

001018f7 <print_ticks>:
#include <console.h>
#include <kdebug.h>

#define TICK_NUM 100

static void print_ticks() {
  1018f7:	f3 0f 1e fb          	endbr32 
  1018fb:	55                   	push   %ebp
  1018fc:	89 e5                	mov    %esp,%ebp
  1018fe:	83 ec 18             	sub    $0x18,%esp
    cprintf("%d ticks\n",TICK_NUM);
  101901:	c7 44 24 04 64 00 00 	movl   $0x64,0x4(%esp)
  101908:	00 
  101909:	c7 04 24 40 39 10 00 	movl   $0x103940,(%esp)
  101910:	e8 6f e9 ff ff       	call   100284 <cprintf>
#ifdef DEBUG_GRADE
    cprintf("End of Test.\n");
    panic("EOT: kernel seems ok.");
#endif
}
  101915:	90                   	nop
  101916:	c9                   	leave  
  101917:	c3                   	ret    

00101918 <idt_init>:
    sizeof(idt) - 1, (uintptr_t)idt
};

/* idt_init - initialize IDT to each of the entry points in kern/trap/vectors.S */
void
idt_init(void) {
  101918:	f3 0f 1e fb          	endbr32 
  10191c:	55                   	push   %ebp
  10191d:	89 e5                	mov    %esp,%ebp
  10191f:	83 ec 10             	sub    $0x10,%esp
      * (3) After setup the contents of IDT, you will let CPU know where is the IDT by using 'lidt' instruction.
      *     You don't know the meaning of this instruction? just google it! and check the libs/x86.h to know more.
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
    extern uintptr_t __vectors[];
    for(int i=0;i<sizeof(idt)/sizeof(struct gatedesc);i++)
  101922:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101929:	e9 c4 00 00 00       	jmp    1019f2 <idt_init+0xda>
    {
        SETGATE(idt[i],0,KERNEL_CS,__vectors[i],DPL_KERNEL);
  10192e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101931:	8b 04 85 e0 f5 10 00 	mov    0x10f5e0(,%eax,4),%eax
  101938:	0f b7 d0             	movzwl %ax,%edx
  10193b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10193e:	66 89 14 c5 a0 00 11 	mov    %dx,0x1100a0(,%eax,8)
  101945:	00 
  101946:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101949:	66 c7 04 c5 a2 00 11 	movw   $0x8,0x1100a2(,%eax,8)
  101950:	00 08 00 
  101953:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101956:	0f b6 14 c5 a4 00 11 	movzbl 0x1100a4(,%eax,8),%edx
  10195d:	00 
  10195e:	80 e2 e0             	and    $0xe0,%dl
  101961:	88 14 c5 a4 00 11 00 	mov    %dl,0x1100a4(,%eax,8)
  101968:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10196b:	0f b6 14 c5 a4 00 11 	movzbl 0x1100a4(,%eax,8),%edx
  101972:	00 
  101973:	80 e2 1f             	and    $0x1f,%dl
  101976:	88 14 c5 a4 00 11 00 	mov    %dl,0x1100a4(,%eax,8)
  10197d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101980:	0f b6 14 c5 a5 00 11 	movzbl 0x1100a5(,%eax,8),%edx
  101987:	00 
  101988:	80 e2 f0             	and    $0xf0,%dl
  10198b:	80 ca 0e             	or     $0xe,%dl
  10198e:	88 14 c5 a5 00 11 00 	mov    %dl,0x1100a5(,%eax,8)
  101995:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101998:	0f b6 14 c5 a5 00 11 	movzbl 0x1100a5(,%eax,8),%edx
  10199f:	00 
  1019a0:	80 e2 ef             	and    $0xef,%dl
  1019a3:	88 14 c5 a5 00 11 00 	mov    %dl,0x1100a5(,%eax,8)
  1019aa:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1019ad:	0f b6 14 c5 a5 00 11 	movzbl 0x1100a5(,%eax,8),%edx
  1019b4:	00 
  1019b5:	80 e2 9f             	and    $0x9f,%dl
  1019b8:	88 14 c5 a5 00 11 00 	mov    %dl,0x1100a5(,%eax,8)
  1019bf:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1019c2:	0f b6 14 c5 a5 00 11 	movzbl 0x1100a5(,%eax,8),%edx
  1019c9:	00 
  1019ca:	80 ca 80             	or     $0x80,%dl
  1019cd:	88 14 c5 a5 00 11 00 	mov    %dl,0x1100a5(,%eax,8)
  1019d4:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1019d7:	8b 04 85 e0 f5 10 00 	mov    0x10f5e0(,%eax,4),%eax
  1019de:	c1 e8 10             	shr    $0x10,%eax
  1019e1:	0f b7 d0             	movzwl %ax,%edx
  1019e4:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1019e7:	66 89 14 c5 a6 00 11 	mov    %dx,0x1100a6(,%eax,8)
  1019ee:	00 
    for(int i=0;i<sizeof(idt)/sizeof(struct gatedesc);i++)
  1019ef:	ff 45 fc             	incl   -0x4(%ebp)
  1019f2:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1019f5:	3d ff 00 00 00       	cmp    $0xff,%eax
  1019fa:	0f 86 2e ff ff ff    	jbe    10192e <idt_init+0x16>
    }
    SETGATE(idt[T_SWITCH_TOK], 0, USER_CS, __vectors[T_SWITCH_TOK], DPL_USER);
  101a00:	a1 c4 f7 10 00       	mov    0x10f7c4,%eax
  101a05:	0f b7 c0             	movzwl %ax,%eax
  101a08:	66 a3 68 04 11 00    	mov    %ax,0x110468
  101a0e:	66 c7 05 6a 04 11 00 	movw   $0x1b,0x11046a
  101a15:	1b 00 
  101a17:	0f b6 05 6c 04 11 00 	movzbl 0x11046c,%eax
  101a1e:	24 e0                	and    $0xe0,%al
  101a20:	a2 6c 04 11 00       	mov    %al,0x11046c
  101a25:	0f b6 05 6c 04 11 00 	movzbl 0x11046c,%eax
  101a2c:	24 1f                	and    $0x1f,%al
  101a2e:	a2 6c 04 11 00       	mov    %al,0x11046c
  101a33:	0f b6 05 6d 04 11 00 	movzbl 0x11046d,%eax
  101a3a:	24 f0                	and    $0xf0,%al
  101a3c:	0c 0e                	or     $0xe,%al
  101a3e:	a2 6d 04 11 00       	mov    %al,0x11046d
  101a43:	0f b6 05 6d 04 11 00 	movzbl 0x11046d,%eax
  101a4a:	24 ef                	and    $0xef,%al
  101a4c:	a2 6d 04 11 00       	mov    %al,0x11046d
  101a51:	0f b6 05 6d 04 11 00 	movzbl 0x11046d,%eax
  101a58:	0c 60                	or     $0x60,%al
  101a5a:	a2 6d 04 11 00       	mov    %al,0x11046d
  101a5f:	0f b6 05 6d 04 11 00 	movzbl 0x11046d,%eax
  101a66:	0c 80                	or     $0x80,%al
  101a68:	a2 6d 04 11 00       	mov    %al,0x11046d
  101a6d:	a1 c4 f7 10 00       	mov    0x10f7c4,%eax
  101a72:	c1 e8 10             	shr    $0x10,%eax
  101a75:	0f b7 c0             	movzwl %ax,%eax
  101a78:	66 a3 6e 04 11 00    	mov    %ax,0x11046e
  101a7e:	c7 45 f8 60 f5 10 00 	movl   $0x10f560,-0x8(%ebp)
    asm volatile ("lidt (%0)" :: "r" (pd));
  101a85:	8b 45 f8             	mov    -0x8(%ebp),%eax
  101a88:	0f 01 18             	lidtl  (%eax)
}
  101a8b:	90                   	nop
    lidt(&idt_pd);
}
  101a8c:	90                   	nop
  101a8d:	c9                   	leave  
  101a8e:	c3                   	ret    

00101a8f <trapname>:

static const char *
trapname(int trapno) {
  101a8f:	f3 0f 1e fb          	endbr32 
  101a93:	55                   	push   %ebp
  101a94:	89 e5                	mov    %esp,%ebp
        "Alignment Check",
        "Machine-Check",
        "SIMD Floating-Point Exception"
    };

    if (trapno < sizeof(excnames)/sizeof(const char * const)) {
  101a96:	8b 45 08             	mov    0x8(%ebp),%eax
  101a99:	83 f8 13             	cmp    $0x13,%eax
  101a9c:	77 0c                	ja     101aaa <trapname+0x1b>
        return excnames[trapno];
  101a9e:	8b 45 08             	mov    0x8(%ebp),%eax
  101aa1:	8b 04 85 a0 3c 10 00 	mov    0x103ca0(,%eax,4),%eax
  101aa8:	eb 18                	jmp    101ac2 <trapname+0x33>
    }
    if (trapno >= IRQ_OFFSET && trapno < IRQ_OFFSET + 16) {
  101aaa:	83 7d 08 1f          	cmpl   $0x1f,0x8(%ebp)
  101aae:	7e 0d                	jle    101abd <trapname+0x2e>
  101ab0:	83 7d 08 2f          	cmpl   $0x2f,0x8(%ebp)
  101ab4:	7f 07                	jg     101abd <trapname+0x2e>
        return "Hardware Interrupt";
  101ab6:	b8 4a 39 10 00       	mov    $0x10394a,%eax
  101abb:	eb 05                	jmp    101ac2 <trapname+0x33>
    }
    return "(unknown trap)";
  101abd:	b8 5d 39 10 00       	mov    $0x10395d,%eax
}
  101ac2:	5d                   	pop    %ebp
  101ac3:	c3                   	ret    

00101ac4 <trap_in_kernel>:

/* trap_in_kernel - test if trap happened in kernel */
bool
trap_in_kernel(struct trapframe *tf) {
  101ac4:	f3 0f 1e fb          	endbr32 
  101ac8:	55                   	push   %ebp
  101ac9:	89 e5                	mov    %esp,%ebp
    return (tf->tf_cs == (uint16_t)KERNEL_CS);
  101acb:	8b 45 08             	mov    0x8(%ebp),%eax
  101ace:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101ad2:	83 f8 08             	cmp    $0x8,%eax
  101ad5:	0f 94 c0             	sete   %al
  101ad8:	0f b6 c0             	movzbl %al,%eax
}
  101adb:	5d                   	pop    %ebp
  101adc:	c3                   	ret    

00101add <print_trapframe>:
    "TF", "IF", "DF", "OF", NULL, NULL, "NT", NULL,
    "RF", "VM", "AC", "VIF", "VIP", "ID", NULL, NULL,
};

void
print_trapframe(struct trapframe *tf) {
  101add:	f3 0f 1e fb          	endbr32 
  101ae1:	55                   	push   %ebp
  101ae2:	89 e5                	mov    %esp,%ebp
  101ae4:	83 ec 28             	sub    $0x28,%esp
    cprintf("trapframe at %p\n", tf);
  101ae7:	8b 45 08             	mov    0x8(%ebp),%eax
  101aea:	89 44 24 04          	mov    %eax,0x4(%esp)
  101aee:	c7 04 24 9e 39 10 00 	movl   $0x10399e,(%esp)
  101af5:	e8 8a e7 ff ff       	call   100284 <cprintf>
    print_regs(&tf->tf_regs);
  101afa:	8b 45 08             	mov    0x8(%ebp),%eax
  101afd:	89 04 24             	mov    %eax,(%esp)
  101b00:	e8 8d 01 00 00       	call   101c92 <print_regs>
    cprintf("  ds   0x----%04x\n", tf->tf_ds);
  101b05:	8b 45 08             	mov    0x8(%ebp),%eax
  101b08:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
  101b0c:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b10:	c7 04 24 af 39 10 00 	movl   $0x1039af,(%esp)
  101b17:	e8 68 e7 ff ff       	call   100284 <cprintf>
    cprintf("  es   0x----%04x\n", tf->tf_es);
  101b1c:	8b 45 08             	mov    0x8(%ebp),%eax
  101b1f:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  101b23:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b27:	c7 04 24 c2 39 10 00 	movl   $0x1039c2,(%esp)
  101b2e:	e8 51 e7 ff ff       	call   100284 <cprintf>
    cprintf("  fs   0x----%04x\n", tf->tf_fs);
  101b33:	8b 45 08             	mov    0x8(%ebp),%eax
  101b36:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  101b3a:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b3e:	c7 04 24 d5 39 10 00 	movl   $0x1039d5,(%esp)
  101b45:	e8 3a e7 ff ff       	call   100284 <cprintf>
    cprintf("  gs   0x----%04x\n", tf->tf_gs);
  101b4a:	8b 45 08             	mov    0x8(%ebp),%eax
  101b4d:	0f b7 40 20          	movzwl 0x20(%eax),%eax
  101b51:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b55:	c7 04 24 e8 39 10 00 	movl   $0x1039e8,(%esp)
  101b5c:	e8 23 e7 ff ff       	call   100284 <cprintf>
    cprintf("  trap 0x%08x %s\n", tf->tf_trapno, trapname(tf->tf_trapno));
  101b61:	8b 45 08             	mov    0x8(%ebp),%eax
  101b64:	8b 40 30             	mov    0x30(%eax),%eax
  101b67:	89 04 24             	mov    %eax,(%esp)
  101b6a:	e8 20 ff ff ff       	call   101a8f <trapname>
  101b6f:	8b 55 08             	mov    0x8(%ebp),%edx
  101b72:	8b 52 30             	mov    0x30(%edx),%edx
  101b75:	89 44 24 08          	mov    %eax,0x8(%esp)
  101b79:	89 54 24 04          	mov    %edx,0x4(%esp)
  101b7d:	c7 04 24 fb 39 10 00 	movl   $0x1039fb,(%esp)
  101b84:	e8 fb e6 ff ff       	call   100284 <cprintf>
    cprintf("  err  0x%08x\n", tf->tf_err);
  101b89:	8b 45 08             	mov    0x8(%ebp),%eax
  101b8c:	8b 40 34             	mov    0x34(%eax),%eax
  101b8f:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b93:	c7 04 24 0d 3a 10 00 	movl   $0x103a0d,(%esp)
  101b9a:	e8 e5 e6 ff ff       	call   100284 <cprintf>
    cprintf("  eip  0x%08x\n", tf->tf_eip);
  101b9f:	8b 45 08             	mov    0x8(%ebp),%eax
  101ba2:	8b 40 38             	mov    0x38(%eax),%eax
  101ba5:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ba9:	c7 04 24 1c 3a 10 00 	movl   $0x103a1c,(%esp)
  101bb0:	e8 cf e6 ff ff       	call   100284 <cprintf>
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
  101bb5:	8b 45 08             	mov    0x8(%ebp),%eax
  101bb8:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101bbc:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bc0:	c7 04 24 2b 3a 10 00 	movl   $0x103a2b,(%esp)
  101bc7:	e8 b8 e6 ff ff       	call   100284 <cprintf>
    cprintf("  flag 0x%08x ", tf->tf_eflags);
  101bcc:	8b 45 08             	mov    0x8(%ebp),%eax
  101bcf:	8b 40 40             	mov    0x40(%eax),%eax
  101bd2:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bd6:	c7 04 24 3e 3a 10 00 	movl   $0x103a3e,(%esp)
  101bdd:	e8 a2 e6 ff ff       	call   100284 <cprintf>

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101be2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101be9:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  101bf0:	eb 3d                	jmp    101c2f <print_trapframe+0x152>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
  101bf2:	8b 45 08             	mov    0x8(%ebp),%eax
  101bf5:	8b 50 40             	mov    0x40(%eax),%edx
  101bf8:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101bfb:	21 d0                	and    %edx,%eax
  101bfd:	85 c0                	test   %eax,%eax
  101bff:	74 28                	je     101c29 <print_trapframe+0x14c>
  101c01:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101c04:	8b 04 85 80 f5 10 00 	mov    0x10f580(,%eax,4),%eax
  101c0b:	85 c0                	test   %eax,%eax
  101c0d:	74 1a                	je     101c29 <print_trapframe+0x14c>
            cprintf("%s,", IA32flags[i]);
  101c0f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101c12:	8b 04 85 80 f5 10 00 	mov    0x10f580(,%eax,4),%eax
  101c19:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c1d:	c7 04 24 4d 3a 10 00 	movl   $0x103a4d,(%esp)
  101c24:	e8 5b e6 ff ff       	call   100284 <cprintf>
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101c29:	ff 45 f4             	incl   -0xc(%ebp)
  101c2c:	d1 65 f0             	shll   -0x10(%ebp)
  101c2f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101c32:	83 f8 17             	cmp    $0x17,%eax
  101c35:	76 bb                	jbe    101bf2 <print_trapframe+0x115>
        }
    }
    cprintf("IOPL=%d\n", (tf->tf_eflags & FL_IOPL_MASK) >> 12);
  101c37:	8b 45 08             	mov    0x8(%ebp),%eax
  101c3a:	8b 40 40             	mov    0x40(%eax),%eax
  101c3d:	c1 e8 0c             	shr    $0xc,%eax
  101c40:	83 e0 03             	and    $0x3,%eax
  101c43:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c47:	c7 04 24 51 3a 10 00 	movl   $0x103a51,(%esp)
  101c4e:	e8 31 e6 ff ff       	call   100284 <cprintf>

    if (!trap_in_kernel(tf)) {
  101c53:	8b 45 08             	mov    0x8(%ebp),%eax
  101c56:	89 04 24             	mov    %eax,(%esp)
  101c59:	e8 66 fe ff ff       	call   101ac4 <trap_in_kernel>
  101c5e:	85 c0                	test   %eax,%eax
  101c60:	75 2d                	jne    101c8f <print_trapframe+0x1b2>
        cprintf("  esp  0x%08x\n", tf->tf_esp);
  101c62:	8b 45 08             	mov    0x8(%ebp),%eax
  101c65:	8b 40 44             	mov    0x44(%eax),%eax
  101c68:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c6c:	c7 04 24 5a 3a 10 00 	movl   $0x103a5a,(%esp)
  101c73:	e8 0c e6 ff ff       	call   100284 <cprintf>
        cprintf("  ss   0x----%04x\n", tf->tf_ss);
  101c78:	8b 45 08             	mov    0x8(%ebp),%eax
  101c7b:	0f b7 40 48          	movzwl 0x48(%eax),%eax
  101c7f:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c83:	c7 04 24 69 3a 10 00 	movl   $0x103a69,(%esp)
  101c8a:	e8 f5 e5 ff ff       	call   100284 <cprintf>
    }
}
  101c8f:	90                   	nop
  101c90:	c9                   	leave  
  101c91:	c3                   	ret    

00101c92 <print_regs>:

void
print_regs(struct pushregs *regs) {
  101c92:	f3 0f 1e fb          	endbr32 
  101c96:	55                   	push   %ebp
  101c97:	89 e5                	mov    %esp,%ebp
  101c99:	83 ec 18             	sub    $0x18,%esp
    cprintf("  edi  0x%08x\n", regs->reg_edi);
  101c9c:	8b 45 08             	mov    0x8(%ebp),%eax
  101c9f:	8b 00                	mov    (%eax),%eax
  101ca1:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ca5:	c7 04 24 7c 3a 10 00 	movl   $0x103a7c,(%esp)
  101cac:	e8 d3 e5 ff ff       	call   100284 <cprintf>
    cprintf("  esi  0x%08x\n", regs->reg_esi);
  101cb1:	8b 45 08             	mov    0x8(%ebp),%eax
  101cb4:	8b 40 04             	mov    0x4(%eax),%eax
  101cb7:	89 44 24 04          	mov    %eax,0x4(%esp)
  101cbb:	c7 04 24 8b 3a 10 00 	movl   $0x103a8b,(%esp)
  101cc2:	e8 bd e5 ff ff       	call   100284 <cprintf>
    cprintf("  ebp  0x%08x\n", regs->reg_ebp);
  101cc7:	8b 45 08             	mov    0x8(%ebp),%eax
  101cca:	8b 40 08             	mov    0x8(%eax),%eax
  101ccd:	89 44 24 04          	mov    %eax,0x4(%esp)
  101cd1:	c7 04 24 9a 3a 10 00 	movl   $0x103a9a,(%esp)
  101cd8:	e8 a7 e5 ff ff       	call   100284 <cprintf>
    cprintf("  oesp 0x%08x\n", regs->reg_oesp);
  101cdd:	8b 45 08             	mov    0x8(%ebp),%eax
  101ce0:	8b 40 0c             	mov    0xc(%eax),%eax
  101ce3:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ce7:	c7 04 24 a9 3a 10 00 	movl   $0x103aa9,(%esp)
  101cee:	e8 91 e5 ff ff       	call   100284 <cprintf>
    cprintf("  ebx  0x%08x\n", regs->reg_ebx);
  101cf3:	8b 45 08             	mov    0x8(%ebp),%eax
  101cf6:	8b 40 10             	mov    0x10(%eax),%eax
  101cf9:	89 44 24 04          	mov    %eax,0x4(%esp)
  101cfd:	c7 04 24 b8 3a 10 00 	movl   $0x103ab8,(%esp)
  101d04:	e8 7b e5 ff ff       	call   100284 <cprintf>
    cprintf("  edx  0x%08x\n", regs->reg_edx);
  101d09:	8b 45 08             	mov    0x8(%ebp),%eax
  101d0c:	8b 40 14             	mov    0x14(%eax),%eax
  101d0f:	89 44 24 04          	mov    %eax,0x4(%esp)
  101d13:	c7 04 24 c7 3a 10 00 	movl   $0x103ac7,(%esp)
  101d1a:	e8 65 e5 ff ff       	call   100284 <cprintf>
    cprintf("  ecx  0x%08x\n", regs->reg_ecx);
  101d1f:	8b 45 08             	mov    0x8(%ebp),%eax
  101d22:	8b 40 18             	mov    0x18(%eax),%eax
  101d25:	89 44 24 04          	mov    %eax,0x4(%esp)
  101d29:	c7 04 24 d6 3a 10 00 	movl   $0x103ad6,(%esp)
  101d30:	e8 4f e5 ff ff       	call   100284 <cprintf>
    cprintf("  eax  0x%08x\n", regs->reg_eax);
  101d35:	8b 45 08             	mov    0x8(%ebp),%eax
  101d38:	8b 40 1c             	mov    0x1c(%eax),%eax
  101d3b:	89 44 24 04          	mov    %eax,0x4(%esp)
  101d3f:	c7 04 24 e5 3a 10 00 	movl   $0x103ae5,(%esp)
  101d46:	e8 39 e5 ff ff       	call   100284 <cprintf>
}
  101d4b:	90                   	nop
  101d4c:	c9                   	leave  
  101d4d:	c3                   	ret    

00101d4e <trap_dispatch>:

/* trap_dispatch - dispatch based on what type of trap occurred */
static void
trap_dispatch(struct trapframe *tf) {
  101d4e:	f3 0f 1e fb          	endbr32 
  101d52:	55                   	push   %ebp
  101d53:	89 e5                	mov    %esp,%ebp
  101d55:	83 ec 28             	sub    $0x28,%esp
    char c;

    switch (tf->tf_trapno) {
  101d58:	8b 45 08             	mov    0x8(%ebp),%eax
  101d5b:	8b 40 30             	mov    0x30(%eax),%eax
  101d5e:	83 f8 79             	cmp    $0x79,%eax
  101d61:	0f 87 cd 00 00 00    	ja     101e34 <trap_dispatch+0xe6>
  101d67:	83 f8 78             	cmp    $0x78,%eax
  101d6a:	0f 83 a8 00 00 00    	jae    101e18 <trap_dispatch+0xca>
  101d70:	83 f8 2f             	cmp    $0x2f,%eax
  101d73:	0f 87 bb 00 00 00    	ja     101e34 <trap_dispatch+0xe6>
  101d79:	83 f8 2e             	cmp    $0x2e,%eax
  101d7c:	0f 83 e7 00 00 00    	jae    101e69 <trap_dispatch+0x11b>
  101d82:	83 f8 24             	cmp    $0x24,%eax
  101d85:	74 45                	je     101dcc <trap_dispatch+0x7e>
  101d87:	83 f8 24             	cmp    $0x24,%eax
  101d8a:	0f 87 a4 00 00 00    	ja     101e34 <trap_dispatch+0xe6>
  101d90:	83 f8 20             	cmp    $0x20,%eax
  101d93:	74 0a                	je     101d9f <trap_dispatch+0x51>
  101d95:	83 f8 21             	cmp    $0x21,%eax
  101d98:	74 58                	je     101df2 <trap_dispatch+0xa4>
  101d9a:	e9 95 00 00 00       	jmp    101e34 <trap_dispatch+0xe6>
        /* handle the timer interrupt */
        /* (1) After a timer interrupt, you should record this event using a global variable (increase it), such as ticks in kern/driver/clock.c
         * (2) Every TICK_NUM cycle, you can print some info using a funciton, such as print_ticks().
         * (3) Too Simple? Yes, I think so!
         */
        ticks++;
  101d9f:	a1 08 09 11 00       	mov    0x110908,%eax
  101da4:	40                   	inc    %eax
  101da5:	a3 08 09 11 00       	mov    %eax,0x110908
        if(ticks==TICK_NUM) {
  101daa:	a1 08 09 11 00       	mov    0x110908,%eax
  101daf:	83 f8 64             	cmp    $0x64,%eax
  101db2:	0f 85 b4 00 00 00    	jne    101e6c <trap_dispatch+0x11e>
            print_ticks();
  101db8:	e8 3a fb ff ff       	call   1018f7 <print_ticks>
            ticks=0;
  101dbd:	c7 05 08 09 11 00 00 	movl   $0x0,0x110908
  101dc4:	00 00 00 
        }
        break;
  101dc7:	e9 a0 00 00 00       	jmp    101e6c <trap_dispatch+0x11e>
    case IRQ_OFFSET + IRQ_COM1:
        c = cons_getc();
  101dcc:	e8 cc f8 ff ff       	call   10169d <cons_getc>
  101dd1:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("serial [%03d] %c\n", c, c);
  101dd4:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101dd8:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101ddc:	89 54 24 08          	mov    %edx,0x8(%esp)
  101de0:	89 44 24 04          	mov    %eax,0x4(%esp)
  101de4:	c7 04 24 f4 3a 10 00 	movl   $0x103af4,(%esp)
  101deb:	e8 94 e4 ff ff       	call   100284 <cprintf>
        break;
  101df0:	eb 7b                	jmp    101e6d <trap_dispatch+0x11f>
    case IRQ_OFFSET + IRQ_KBD:
        c = cons_getc();
  101df2:	e8 a6 f8 ff ff       	call   10169d <cons_getc>
  101df7:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("kbd [%03d] %c\n", c, c);
  101dfa:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101dfe:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101e02:	89 54 24 08          	mov    %edx,0x8(%esp)
  101e06:	89 44 24 04          	mov    %eax,0x4(%esp)
  101e0a:	c7 04 24 06 3b 10 00 	movl   $0x103b06,(%esp)
  101e11:	e8 6e e4 ff ff       	call   100284 <cprintf>
        break;
  101e16:	eb 55                	jmp    101e6d <trap_dispatch+0x11f>
    //LAB1 CHALLENGE 1 : YOUR CODE you should modify below codes.
    case T_SWITCH_TOU:
    case T_SWITCH_TOK:
        panic("T_SWITCH_** ??\n");
  101e18:	c7 44 24 08 15 3b 10 	movl   $0x103b15,0x8(%esp)
  101e1f:	00 
  101e20:	c7 44 24 04 ae 00 00 	movl   $0xae,0x4(%esp)
  101e27:	00 
  101e28:	c7 04 24 25 3b 10 00 	movl   $0x103b25,(%esp)
  101e2f:	e8 bc e5 ff ff       	call   1003f0 <__panic>
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
    default:
        // in kernel, it must be a mistake
        if ((tf->tf_cs & 3) == 0) {
  101e34:	8b 45 08             	mov    0x8(%ebp),%eax
  101e37:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101e3b:	83 e0 03             	and    $0x3,%eax
  101e3e:	85 c0                	test   %eax,%eax
  101e40:	75 2b                	jne    101e6d <trap_dispatch+0x11f>
            print_trapframe(tf);
  101e42:	8b 45 08             	mov    0x8(%ebp),%eax
  101e45:	89 04 24             	mov    %eax,(%esp)
  101e48:	e8 90 fc ff ff       	call   101add <print_trapframe>
            panic("unexpected trap in kernel.\n");
  101e4d:	c7 44 24 08 36 3b 10 	movl   $0x103b36,0x8(%esp)
  101e54:	00 
  101e55:	c7 44 24 04 b8 00 00 	movl   $0xb8,0x4(%esp)
  101e5c:	00 
  101e5d:	c7 04 24 25 3b 10 00 	movl   $0x103b25,(%esp)
  101e64:	e8 87 e5 ff ff       	call   1003f0 <__panic>
        break;
  101e69:	90                   	nop
  101e6a:	eb 01                	jmp    101e6d <trap_dispatch+0x11f>
        break;
  101e6c:	90                   	nop
        }
    }
}
  101e6d:	90                   	nop
  101e6e:	c9                   	leave  
  101e6f:	c3                   	ret    

00101e70 <trap>:
 * trap - handles or dispatches an exception/interrupt. if and when trap() returns,
 * the code in kern/trap/trapentry.S restores the old CPU state saved in the
 * trapframe and then uses the iret instruction to return from the exception.
 * */
void
trap(struct trapframe *tf) {
  101e70:	f3 0f 1e fb          	endbr32 
  101e74:	55                   	push   %ebp
  101e75:	89 e5                	mov    %esp,%ebp
  101e77:	83 ec 18             	sub    $0x18,%esp
    // dispatch based on what type of trap occurred
    trap_dispatch(tf);
  101e7a:	8b 45 08             	mov    0x8(%ebp),%eax
  101e7d:	89 04 24             	mov    %eax,(%esp)
  101e80:	e8 c9 fe ff ff       	call   101d4e <trap_dispatch>
}
  101e85:	90                   	nop
  101e86:	c9                   	leave  
  101e87:	c3                   	ret    

00101e88 <vector0>:
# handler
.text
.globl __alltraps
.globl vector0
vector0:
  pushl $0
  101e88:	6a 00                	push   $0x0
  pushl $0
  101e8a:	6a 00                	push   $0x0
  jmp __alltraps
  101e8c:	e9 69 0a 00 00       	jmp    1028fa <__alltraps>

00101e91 <vector1>:
.globl vector1
vector1:
  pushl $0
  101e91:	6a 00                	push   $0x0
  pushl $1
  101e93:	6a 01                	push   $0x1
  jmp __alltraps
  101e95:	e9 60 0a 00 00       	jmp    1028fa <__alltraps>

00101e9a <vector2>:
.globl vector2
vector2:
  pushl $0
  101e9a:	6a 00                	push   $0x0
  pushl $2
  101e9c:	6a 02                	push   $0x2
  jmp __alltraps
  101e9e:	e9 57 0a 00 00       	jmp    1028fa <__alltraps>

00101ea3 <vector3>:
.globl vector3
vector3:
  pushl $0
  101ea3:	6a 00                	push   $0x0
  pushl $3
  101ea5:	6a 03                	push   $0x3
  jmp __alltraps
  101ea7:	e9 4e 0a 00 00       	jmp    1028fa <__alltraps>

00101eac <vector4>:
.globl vector4
vector4:
  pushl $0
  101eac:	6a 00                	push   $0x0
  pushl $4
  101eae:	6a 04                	push   $0x4
  jmp __alltraps
  101eb0:	e9 45 0a 00 00       	jmp    1028fa <__alltraps>

00101eb5 <vector5>:
.globl vector5
vector5:
  pushl $0
  101eb5:	6a 00                	push   $0x0
  pushl $5
  101eb7:	6a 05                	push   $0x5
  jmp __alltraps
  101eb9:	e9 3c 0a 00 00       	jmp    1028fa <__alltraps>

00101ebe <vector6>:
.globl vector6
vector6:
  pushl $0
  101ebe:	6a 00                	push   $0x0
  pushl $6
  101ec0:	6a 06                	push   $0x6
  jmp __alltraps
  101ec2:	e9 33 0a 00 00       	jmp    1028fa <__alltraps>

00101ec7 <vector7>:
.globl vector7
vector7:
  pushl $0
  101ec7:	6a 00                	push   $0x0
  pushl $7
  101ec9:	6a 07                	push   $0x7
  jmp __alltraps
  101ecb:	e9 2a 0a 00 00       	jmp    1028fa <__alltraps>

00101ed0 <vector8>:
.globl vector8
vector8:
  pushl $8
  101ed0:	6a 08                	push   $0x8
  jmp __alltraps
  101ed2:	e9 23 0a 00 00       	jmp    1028fa <__alltraps>

00101ed7 <vector9>:
.globl vector9
vector9:
  pushl $0
  101ed7:	6a 00                	push   $0x0
  pushl $9
  101ed9:	6a 09                	push   $0x9
  jmp __alltraps
  101edb:	e9 1a 0a 00 00       	jmp    1028fa <__alltraps>

00101ee0 <vector10>:
.globl vector10
vector10:
  pushl $10
  101ee0:	6a 0a                	push   $0xa
  jmp __alltraps
  101ee2:	e9 13 0a 00 00       	jmp    1028fa <__alltraps>

00101ee7 <vector11>:
.globl vector11
vector11:
  pushl $11
  101ee7:	6a 0b                	push   $0xb
  jmp __alltraps
  101ee9:	e9 0c 0a 00 00       	jmp    1028fa <__alltraps>

00101eee <vector12>:
.globl vector12
vector12:
  pushl $12
  101eee:	6a 0c                	push   $0xc
  jmp __alltraps
  101ef0:	e9 05 0a 00 00       	jmp    1028fa <__alltraps>

00101ef5 <vector13>:
.globl vector13
vector13:
  pushl $13
  101ef5:	6a 0d                	push   $0xd
  jmp __alltraps
  101ef7:	e9 fe 09 00 00       	jmp    1028fa <__alltraps>

00101efc <vector14>:
.globl vector14
vector14:
  pushl $14
  101efc:	6a 0e                	push   $0xe
  jmp __alltraps
  101efe:	e9 f7 09 00 00       	jmp    1028fa <__alltraps>

00101f03 <vector15>:
.globl vector15
vector15:
  pushl $0
  101f03:	6a 00                	push   $0x0
  pushl $15
  101f05:	6a 0f                	push   $0xf
  jmp __alltraps
  101f07:	e9 ee 09 00 00       	jmp    1028fa <__alltraps>

00101f0c <vector16>:
.globl vector16
vector16:
  pushl $0
  101f0c:	6a 00                	push   $0x0
  pushl $16
  101f0e:	6a 10                	push   $0x10
  jmp __alltraps
  101f10:	e9 e5 09 00 00       	jmp    1028fa <__alltraps>

00101f15 <vector17>:
.globl vector17
vector17:
  pushl $17
  101f15:	6a 11                	push   $0x11
  jmp __alltraps
  101f17:	e9 de 09 00 00       	jmp    1028fa <__alltraps>

00101f1c <vector18>:
.globl vector18
vector18:
  pushl $0
  101f1c:	6a 00                	push   $0x0
  pushl $18
  101f1e:	6a 12                	push   $0x12
  jmp __alltraps
  101f20:	e9 d5 09 00 00       	jmp    1028fa <__alltraps>

00101f25 <vector19>:
.globl vector19
vector19:
  pushl $0
  101f25:	6a 00                	push   $0x0
  pushl $19
  101f27:	6a 13                	push   $0x13
  jmp __alltraps
  101f29:	e9 cc 09 00 00       	jmp    1028fa <__alltraps>

00101f2e <vector20>:
.globl vector20
vector20:
  pushl $0
  101f2e:	6a 00                	push   $0x0
  pushl $20
  101f30:	6a 14                	push   $0x14
  jmp __alltraps
  101f32:	e9 c3 09 00 00       	jmp    1028fa <__alltraps>

00101f37 <vector21>:
.globl vector21
vector21:
  pushl $0
  101f37:	6a 00                	push   $0x0
  pushl $21
  101f39:	6a 15                	push   $0x15
  jmp __alltraps
  101f3b:	e9 ba 09 00 00       	jmp    1028fa <__alltraps>

00101f40 <vector22>:
.globl vector22
vector22:
  pushl $0
  101f40:	6a 00                	push   $0x0
  pushl $22
  101f42:	6a 16                	push   $0x16
  jmp __alltraps
  101f44:	e9 b1 09 00 00       	jmp    1028fa <__alltraps>

00101f49 <vector23>:
.globl vector23
vector23:
  pushl $0
  101f49:	6a 00                	push   $0x0
  pushl $23
  101f4b:	6a 17                	push   $0x17
  jmp __alltraps
  101f4d:	e9 a8 09 00 00       	jmp    1028fa <__alltraps>

00101f52 <vector24>:
.globl vector24
vector24:
  pushl $0
  101f52:	6a 00                	push   $0x0
  pushl $24
  101f54:	6a 18                	push   $0x18
  jmp __alltraps
  101f56:	e9 9f 09 00 00       	jmp    1028fa <__alltraps>

00101f5b <vector25>:
.globl vector25
vector25:
  pushl $0
  101f5b:	6a 00                	push   $0x0
  pushl $25
  101f5d:	6a 19                	push   $0x19
  jmp __alltraps
  101f5f:	e9 96 09 00 00       	jmp    1028fa <__alltraps>

00101f64 <vector26>:
.globl vector26
vector26:
  pushl $0
  101f64:	6a 00                	push   $0x0
  pushl $26
  101f66:	6a 1a                	push   $0x1a
  jmp __alltraps
  101f68:	e9 8d 09 00 00       	jmp    1028fa <__alltraps>

00101f6d <vector27>:
.globl vector27
vector27:
  pushl $0
  101f6d:	6a 00                	push   $0x0
  pushl $27
  101f6f:	6a 1b                	push   $0x1b
  jmp __alltraps
  101f71:	e9 84 09 00 00       	jmp    1028fa <__alltraps>

00101f76 <vector28>:
.globl vector28
vector28:
  pushl $0
  101f76:	6a 00                	push   $0x0
  pushl $28
  101f78:	6a 1c                	push   $0x1c
  jmp __alltraps
  101f7a:	e9 7b 09 00 00       	jmp    1028fa <__alltraps>

00101f7f <vector29>:
.globl vector29
vector29:
  pushl $0
  101f7f:	6a 00                	push   $0x0
  pushl $29
  101f81:	6a 1d                	push   $0x1d
  jmp __alltraps
  101f83:	e9 72 09 00 00       	jmp    1028fa <__alltraps>

00101f88 <vector30>:
.globl vector30
vector30:
  pushl $0
  101f88:	6a 00                	push   $0x0
  pushl $30
  101f8a:	6a 1e                	push   $0x1e
  jmp __alltraps
  101f8c:	e9 69 09 00 00       	jmp    1028fa <__alltraps>

00101f91 <vector31>:
.globl vector31
vector31:
  pushl $0
  101f91:	6a 00                	push   $0x0
  pushl $31
  101f93:	6a 1f                	push   $0x1f
  jmp __alltraps
  101f95:	e9 60 09 00 00       	jmp    1028fa <__alltraps>

00101f9a <vector32>:
.globl vector32
vector32:
  pushl $0
  101f9a:	6a 00                	push   $0x0
  pushl $32
  101f9c:	6a 20                	push   $0x20
  jmp __alltraps
  101f9e:	e9 57 09 00 00       	jmp    1028fa <__alltraps>

00101fa3 <vector33>:
.globl vector33
vector33:
  pushl $0
  101fa3:	6a 00                	push   $0x0
  pushl $33
  101fa5:	6a 21                	push   $0x21
  jmp __alltraps
  101fa7:	e9 4e 09 00 00       	jmp    1028fa <__alltraps>

00101fac <vector34>:
.globl vector34
vector34:
  pushl $0
  101fac:	6a 00                	push   $0x0
  pushl $34
  101fae:	6a 22                	push   $0x22
  jmp __alltraps
  101fb0:	e9 45 09 00 00       	jmp    1028fa <__alltraps>

00101fb5 <vector35>:
.globl vector35
vector35:
  pushl $0
  101fb5:	6a 00                	push   $0x0
  pushl $35
  101fb7:	6a 23                	push   $0x23
  jmp __alltraps
  101fb9:	e9 3c 09 00 00       	jmp    1028fa <__alltraps>

00101fbe <vector36>:
.globl vector36
vector36:
  pushl $0
  101fbe:	6a 00                	push   $0x0
  pushl $36
  101fc0:	6a 24                	push   $0x24
  jmp __alltraps
  101fc2:	e9 33 09 00 00       	jmp    1028fa <__alltraps>

00101fc7 <vector37>:
.globl vector37
vector37:
  pushl $0
  101fc7:	6a 00                	push   $0x0
  pushl $37
  101fc9:	6a 25                	push   $0x25
  jmp __alltraps
  101fcb:	e9 2a 09 00 00       	jmp    1028fa <__alltraps>

00101fd0 <vector38>:
.globl vector38
vector38:
  pushl $0
  101fd0:	6a 00                	push   $0x0
  pushl $38
  101fd2:	6a 26                	push   $0x26
  jmp __alltraps
  101fd4:	e9 21 09 00 00       	jmp    1028fa <__alltraps>

00101fd9 <vector39>:
.globl vector39
vector39:
  pushl $0
  101fd9:	6a 00                	push   $0x0
  pushl $39
  101fdb:	6a 27                	push   $0x27
  jmp __alltraps
  101fdd:	e9 18 09 00 00       	jmp    1028fa <__alltraps>

00101fe2 <vector40>:
.globl vector40
vector40:
  pushl $0
  101fe2:	6a 00                	push   $0x0
  pushl $40
  101fe4:	6a 28                	push   $0x28
  jmp __alltraps
  101fe6:	e9 0f 09 00 00       	jmp    1028fa <__alltraps>

00101feb <vector41>:
.globl vector41
vector41:
  pushl $0
  101feb:	6a 00                	push   $0x0
  pushl $41
  101fed:	6a 29                	push   $0x29
  jmp __alltraps
  101fef:	e9 06 09 00 00       	jmp    1028fa <__alltraps>

00101ff4 <vector42>:
.globl vector42
vector42:
  pushl $0
  101ff4:	6a 00                	push   $0x0
  pushl $42
  101ff6:	6a 2a                	push   $0x2a
  jmp __alltraps
  101ff8:	e9 fd 08 00 00       	jmp    1028fa <__alltraps>

00101ffd <vector43>:
.globl vector43
vector43:
  pushl $0
  101ffd:	6a 00                	push   $0x0
  pushl $43
  101fff:	6a 2b                	push   $0x2b
  jmp __alltraps
  102001:	e9 f4 08 00 00       	jmp    1028fa <__alltraps>

00102006 <vector44>:
.globl vector44
vector44:
  pushl $0
  102006:	6a 00                	push   $0x0
  pushl $44
  102008:	6a 2c                	push   $0x2c
  jmp __alltraps
  10200a:	e9 eb 08 00 00       	jmp    1028fa <__alltraps>

0010200f <vector45>:
.globl vector45
vector45:
  pushl $0
  10200f:	6a 00                	push   $0x0
  pushl $45
  102011:	6a 2d                	push   $0x2d
  jmp __alltraps
  102013:	e9 e2 08 00 00       	jmp    1028fa <__alltraps>

00102018 <vector46>:
.globl vector46
vector46:
  pushl $0
  102018:	6a 00                	push   $0x0
  pushl $46
  10201a:	6a 2e                	push   $0x2e
  jmp __alltraps
  10201c:	e9 d9 08 00 00       	jmp    1028fa <__alltraps>

00102021 <vector47>:
.globl vector47
vector47:
  pushl $0
  102021:	6a 00                	push   $0x0
  pushl $47
  102023:	6a 2f                	push   $0x2f
  jmp __alltraps
  102025:	e9 d0 08 00 00       	jmp    1028fa <__alltraps>

0010202a <vector48>:
.globl vector48
vector48:
  pushl $0
  10202a:	6a 00                	push   $0x0
  pushl $48
  10202c:	6a 30                	push   $0x30
  jmp __alltraps
  10202e:	e9 c7 08 00 00       	jmp    1028fa <__alltraps>

00102033 <vector49>:
.globl vector49
vector49:
  pushl $0
  102033:	6a 00                	push   $0x0
  pushl $49
  102035:	6a 31                	push   $0x31
  jmp __alltraps
  102037:	e9 be 08 00 00       	jmp    1028fa <__alltraps>

0010203c <vector50>:
.globl vector50
vector50:
  pushl $0
  10203c:	6a 00                	push   $0x0
  pushl $50
  10203e:	6a 32                	push   $0x32
  jmp __alltraps
  102040:	e9 b5 08 00 00       	jmp    1028fa <__alltraps>

00102045 <vector51>:
.globl vector51
vector51:
  pushl $0
  102045:	6a 00                	push   $0x0
  pushl $51
  102047:	6a 33                	push   $0x33
  jmp __alltraps
  102049:	e9 ac 08 00 00       	jmp    1028fa <__alltraps>

0010204e <vector52>:
.globl vector52
vector52:
  pushl $0
  10204e:	6a 00                	push   $0x0
  pushl $52
  102050:	6a 34                	push   $0x34
  jmp __alltraps
  102052:	e9 a3 08 00 00       	jmp    1028fa <__alltraps>

00102057 <vector53>:
.globl vector53
vector53:
  pushl $0
  102057:	6a 00                	push   $0x0
  pushl $53
  102059:	6a 35                	push   $0x35
  jmp __alltraps
  10205b:	e9 9a 08 00 00       	jmp    1028fa <__alltraps>

00102060 <vector54>:
.globl vector54
vector54:
  pushl $0
  102060:	6a 00                	push   $0x0
  pushl $54
  102062:	6a 36                	push   $0x36
  jmp __alltraps
  102064:	e9 91 08 00 00       	jmp    1028fa <__alltraps>

00102069 <vector55>:
.globl vector55
vector55:
  pushl $0
  102069:	6a 00                	push   $0x0
  pushl $55
  10206b:	6a 37                	push   $0x37
  jmp __alltraps
  10206d:	e9 88 08 00 00       	jmp    1028fa <__alltraps>

00102072 <vector56>:
.globl vector56
vector56:
  pushl $0
  102072:	6a 00                	push   $0x0
  pushl $56
  102074:	6a 38                	push   $0x38
  jmp __alltraps
  102076:	e9 7f 08 00 00       	jmp    1028fa <__alltraps>

0010207b <vector57>:
.globl vector57
vector57:
  pushl $0
  10207b:	6a 00                	push   $0x0
  pushl $57
  10207d:	6a 39                	push   $0x39
  jmp __alltraps
  10207f:	e9 76 08 00 00       	jmp    1028fa <__alltraps>

00102084 <vector58>:
.globl vector58
vector58:
  pushl $0
  102084:	6a 00                	push   $0x0
  pushl $58
  102086:	6a 3a                	push   $0x3a
  jmp __alltraps
  102088:	e9 6d 08 00 00       	jmp    1028fa <__alltraps>

0010208d <vector59>:
.globl vector59
vector59:
  pushl $0
  10208d:	6a 00                	push   $0x0
  pushl $59
  10208f:	6a 3b                	push   $0x3b
  jmp __alltraps
  102091:	e9 64 08 00 00       	jmp    1028fa <__alltraps>

00102096 <vector60>:
.globl vector60
vector60:
  pushl $0
  102096:	6a 00                	push   $0x0
  pushl $60
  102098:	6a 3c                	push   $0x3c
  jmp __alltraps
  10209a:	e9 5b 08 00 00       	jmp    1028fa <__alltraps>

0010209f <vector61>:
.globl vector61
vector61:
  pushl $0
  10209f:	6a 00                	push   $0x0
  pushl $61
  1020a1:	6a 3d                	push   $0x3d
  jmp __alltraps
  1020a3:	e9 52 08 00 00       	jmp    1028fa <__alltraps>

001020a8 <vector62>:
.globl vector62
vector62:
  pushl $0
  1020a8:	6a 00                	push   $0x0
  pushl $62
  1020aa:	6a 3e                	push   $0x3e
  jmp __alltraps
  1020ac:	e9 49 08 00 00       	jmp    1028fa <__alltraps>

001020b1 <vector63>:
.globl vector63
vector63:
  pushl $0
  1020b1:	6a 00                	push   $0x0
  pushl $63
  1020b3:	6a 3f                	push   $0x3f
  jmp __alltraps
  1020b5:	e9 40 08 00 00       	jmp    1028fa <__alltraps>

001020ba <vector64>:
.globl vector64
vector64:
  pushl $0
  1020ba:	6a 00                	push   $0x0
  pushl $64
  1020bc:	6a 40                	push   $0x40
  jmp __alltraps
  1020be:	e9 37 08 00 00       	jmp    1028fa <__alltraps>

001020c3 <vector65>:
.globl vector65
vector65:
  pushl $0
  1020c3:	6a 00                	push   $0x0
  pushl $65
  1020c5:	6a 41                	push   $0x41
  jmp __alltraps
  1020c7:	e9 2e 08 00 00       	jmp    1028fa <__alltraps>

001020cc <vector66>:
.globl vector66
vector66:
  pushl $0
  1020cc:	6a 00                	push   $0x0
  pushl $66
  1020ce:	6a 42                	push   $0x42
  jmp __alltraps
  1020d0:	e9 25 08 00 00       	jmp    1028fa <__alltraps>

001020d5 <vector67>:
.globl vector67
vector67:
  pushl $0
  1020d5:	6a 00                	push   $0x0
  pushl $67
  1020d7:	6a 43                	push   $0x43
  jmp __alltraps
  1020d9:	e9 1c 08 00 00       	jmp    1028fa <__alltraps>

001020de <vector68>:
.globl vector68
vector68:
  pushl $0
  1020de:	6a 00                	push   $0x0
  pushl $68
  1020e0:	6a 44                	push   $0x44
  jmp __alltraps
  1020e2:	e9 13 08 00 00       	jmp    1028fa <__alltraps>

001020e7 <vector69>:
.globl vector69
vector69:
  pushl $0
  1020e7:	6a 00                	push   $0x0
  pushl $69
  1020e9:	6a 45                	push   $0x45
  jmp __alltraps
  1020eb:	e9 0a 08 00 00       	jmp    1028fa <__alltraps>

001020f0 <vector70>:
.globl vector70
vector70:
  pushl $0
  1020f0:	6a 00                	push   $0x0
  pushl $70
  1020f2:	6a 46                	push   $0x46
  jmp __alltraps
  1020f4:	e9 01 08 00 00       	jmp    1028fa <__alltraps>

001020f9 <vector71>:
.globl vector71
vector71:
  pushl $0
  1020f9:	6a 00                	push   $0x0
  pushl $71
  1020fb:	6a 47                	push   $0x47
  jmp __alltraps
  1020fd:	e9 f8 07 00 00       	jmp    1028fa <__alltraps>

00102102 <vector72>:
.globl vector72
vector72:
  pushl $0
  102102:	6a 00                	push   $0x0
  pushl $72
  102104:	6a 48                	push   $0x48
  jmp __alltraps
  102106:	e9 ef 07 00 00       	jmp    1028fa <__alltraps>

0010210b <vector73>:
.globl vector73
vector73:
  pushl $0
  10210b:	6a 00                	push   $0x0
  pushl $73
  10210d:	6a 49                	push   $0x49
  jmp __alltraps
  10210f:	e9 e6 07 00 00       	jmp    1028fa <__alltraps>

00102114 <vector74>:
.globl vector74
vector74:
  pushl $0
  102114:	6a 00                	push   $0x0
  pushl $74
  102116:	6a 4a                	push   $0x4a
  jmp __alltraps
  102118:	e9 dd 07 00 00       	jmp    1028fa <__alltraps>

0010211d <vector75>:
.globl vector75
vector75:
  pushl $0
  10211d:	6a 00                	push   $0x0
  pushl $75
  10211f:	6a 4b                	push   $0x4b
  jmp __alltraps
  102121:	e9 d4 07 00 00       	jmp    1028fa <__alltraps>

00102126 <vector76>:
.globl vector76
vector76:
  pushl $0
  102126:	6a 00                	push   $0x0
  pushl $76
  102128:	6a 4c                	push   $0x4c
  jmp __alltraps
  10212a:	e9 cb 07 00 00       	jmp    1028fa <__alltraps>

0010212f <vector77>:
.globl vector77
vector77:
  pushl $0
  10212f:	6a 00                	push   $0x0
  pushl $77
  102131:	6a 4d                	push   $0x4d
  jmp __alltraps
  102133:	e9 c2 07 00 00       	jmp    1028fa <__alltraps>

00102138 <vector78>:
.globl vector78
vector78:
  pushl $0
  102138:	6a 00                	push   $0x0
  pushl $78
  10213a:	6a 4e                	push   $0x4e
  jmp __alltraps
  10213c:	e9 b9 07 00 00       	jmp    1028fa <__alltraps>

00102141 <vector79>:
.globl vector79
vector79:
  pushl $0
  102141:	6a 00                	push   $0x0
  pushl $79
  102143:	6a 4f                	push   $0x4f
  jmp __alltraps
  102145:	e9 b0 07 00 00       	jmp    1028fa <__alltraps>

0010214a <vector80>:
.globl vector80
vector80:
  pushl $0
  10214a:	6a 00                	push   $0x0
  pushl $80
  10214c:	6a 50                	push   $0x50
  jmp __alltraps
  10214e:	e9 a7 07 00 00       	jmp    1028fa <__alltraps>

00102153 <vector81>:
.globl vector81
vector81:
  pushl $0
  102153:	6a 00                	push   $0x0
  pushl $81
  102155:	6a 51                	push   $0x51
  jmp __alltraps
  102157:	e9 9e 07 00 00       	jmp    1028fa <__alltraps>

0010215c <vector82>:
.globl vector82
vector82:
  pushl $0
  10215c:	6a 00                	push   $0x0
  pushl $82
  10215e:	6a 52                	push   $0x52
  jmp __alltraps
  102160:	e9 95 07 00 00       	jmp    1028fa <__alltraps>

00102165 <vector83>:
.globl vector83
vector83:
  pushl $0
  102165:	6a 00                	push   $0x0
  pushl $83
  102167:	6a 53                	push   $0x53
  jmp __alltraps
  102169:	e9 8c 07 00 00       	jmp    1028fa <__alltraps>

0010216e <vector84>:
.globl vector84
vector84:
  pushl $0
  10216e:	6a 00                	push   $0x0
  pushl $84
  102170:	6a 54                	push   $0x54
  jmp __alltraps
  102172:	e9 83 07 00 00       	jmp    1028fa <__alltraps>

00102177 <vector85>:
.globl vector85
vector85:
  pushl $0
  102177:	6a 00                	push   $0x0
  pushl $85
  102179:	6a 55                	push   $0x55
  jmp __alltraps
  10217b:	e9 7a 07 00 00       	jmp    1028fa <__alltraps>

00102180 <vector86>:
.globl vector86
vector86:
  pushl $0
  102180:	6a 00                	push   $0x0
  pushl $86
  102182:	6a 56                	push   $0x56
  jmp __alltraps
  102184:	e9 71 07 00 00       	jmp    1028fa <__alltraps>

00102189 <vector87>:
.globl vector87
vector87:
  pushl $0
  102189:	6a 00                	push   $0x0
  pushl $87
  10218b:	6a 57                	push   $0x57
  jmp __alltraps
  10218d:	e9 68 07 00 00       	jmp    1028fa <__alltraps>

00102192 <vector88>:
.globl vector88
vector88:
  pushl $0
  102192:	6a 00                	push   $0x0
  pushl $88
  102194:	6a 58                	push   $0x58
  jmp __alltraps
  102196:	e9 5f 07 00 00       	jmp    1028fa <__alltraps>

0010219b <vector89>:
.globl vector89
vector89:
  pushl $0
  10219b:	6a 00                	push   $0x0
  pushl $89
  10219d:	6a 59                	push   $0x59
  jmp __alltraps
  10219f:	e9 56 07 00 00       	jmp    1028fa <__alltraps>

001021a4 <vector90>:
.globl vector90
vector90:
  pushl $0
  1021a4:	6a 00                	push   $0x0
  pushl $90
  1021a6:	6a 5a                	push   $0x5a
  jmp __alltraps
  1021a8:	e9 4d 07 00 00       	jmp    1028fa <__alltraps>

001021ad <vector91>:
.globl vector91
vector91:
  pushl $0
  1021ad:	6a 00                	push   $0x0
  pushl $91
  1021af:	6a 5b                	push   $0x5b
  jmp __alltraps
  1021b1:	e9 44 07 00 00       	jmp    1028fa <__alltraps>

001021b6 <vector92>:
.globl vector92
vector92:
  pushl $0
  1021b6:	6a 00                	push   $0x0
  pushl $92
  1021b8:	6a 5c                	push   $0x5c
  jmp __alltraps
  1021ba:	e9 3b 07 00 00       	jmp    1028fa <__alltraps>

001021bf <vector93>:
.globl vector93
vector93:
  pushl $0
  1021bf:	6a 00                	push   $0x0
  pushl $93
  1021c1:	6a 5d                	push   $0x5d
  jmp __alltraps
  1021c3:	e9 32 07 00 00       	jmp    1028fa <__alltraps>

001021c8 <vector94>:
.globl vector94
vector94:
  pushl $0
  1021c8:	6a 00                	push   $0x0
  pushl $94
  1021ca:	6a 5e                	push   $0x5e
  jmp __alltraps
  1021cc:	e9 29 07 00 00       	jmp    1028fa <__alltraps>

001021d1 <vector95>:
.globl vector95
vector95:
  pushl $0
  1021d1:	6a 00                	push   $0x0
  pushl $95
  1021d3:	6a 5f                	push   $0x5f
  jmp __alltraps
  1021d5:	e9 20 07 00 00       	jmp    1028fa <__alltraps>

001021da <vector96>:
.globl vector96
vector96:
  pushl $0
  1021da:	6a 00                	push   $0x0
  pushl $96
  1021dc:	6a 60                	push   $0x60
  jmp __alltraps
  1021de:	e9 17 07 00 00       	jmp    1028fa <__alltraps>

001021e3 <vector97>:
.globl vector97
vector97:
  pushl $0
  1021e3:	6a 00                	push   $0x0
  pushl $97
  1021e5:	6a 61                	push   $0x61
  jmp __alltraps
  1021e7:	e9 0e 07 00 00       	jmp    1028fa <__alltraps>

001021ec <vector98>:
.globl vector98
vector98:
  pushl $0
  1021ec:	6a 00                	push   $0x0
  pushl $98
  1021ee:	6a 62                	push   $0x62
  jmp __alltraps
  1021f0:	e9 05 07 00 00       	jmp    1028fa <__alltraps>

001021f5 <vector99>:
.globl vector99
vector99:
  pushl $0
  1021f5:	6a 00                	push   $0x0
  pushl $99
  1021f7:	6a 63                	push   $0x63
  jmp __alltraps
  1021f9:	e9 fc 06 00 00       	jmp    1028fa <__alltraps>

001021fe <vector100>:
.globl vector100
vector100:
  pushl $0
  1021fe:	6a 00                	push   $0x0
  pushl $100
  102200:	6a 64                	push   $0x64
  jmp __alltraps
  102202:	e9 f3 06 00 00       	jmp    1028fa <__alltraps>

00102207 <vector101>:
.globl vector101
vector101:
  pushl $0
  102207:	6a 00                	push   $0x0
  pushl $101
  102209:	6a 65                	push   $0x65
  jmp __alltraps
  10220b:	e9 ea 06 00 00       	jmp    1028fa <__alltraps>

00102210 <vector102>:
.globl vector102
vector102:
  pushl $0
  102210:	6a 00                	push   $0x0
  pushl $102
  102212:	6a 66                	push   $0x66
  jmp __alltraps
  102214:	e9 e1 06 00 00       	jmp    1028fa <__alltraps>

00102219 <vector103>:
.globl vector103
vector103:
  pushl $0
  102219:	6a 00                	push   $0x0
  pushl $103
  10221b:	6a 67                	push   $0x67
  jmp __alltraps
  10221d:	e9 d8 06 00 00       	jmp    1028fa <__alltraps>

00102222 <vector104>:
.globl vector104
vector104:
  pushl $0
  102222:	6a 00                	push   $0x0
  pushl $104
  102224:	6a 68                	push   $0x68
  jmp __alltraps
  102226:	e9 cf 06 00 00       	jmp    1028fa <__alltraps>

0010222b <vector105>:
.globl vector105
vector105:
  pushl $0
  10222b:	6a 00                	push   $0x0
  pushl $105
  10222d:	6a 69                	push   $0x69
  jmp __alltraps
  10222f:	e9 c6 06 00 00       	jmp    1028fa <__alltraps>

00102234 <vector106>:
.globl vector106
vector106:
  pushl $0
  102234:	6a 00                	push   $0x0
  pushl $106
  102236:	6a 6a                	push   $0x6a
  jmp __alltraps
  102238:	e9 bd 06 00 00       	jmp    1028fa <__alltraps>

0010223d <vector107>:
.globl vector107
vector107:
  pushl $0
  10223d:	6a 00                	push   $0x0
  pushl $107
  10223f:	6a 6b                	push   $0x6b
  jmp __alltraps
  102241:	e9 b4 06 00 00       	jmp    1028fa <__alltraps>

00102246 <vector108>:
.globl vector108
vector108:
  pushl $0
  102246:	6a 00                	push   $0x0
  pushl $108
  102248:	6a 6c                	push   $0x6c
  jmp __alltraps
  10224a:	e9 ab 06 00 00       	jmp    1028fa <__alltraps>

0010224f <vector109>:
.globl vector109
vector109:
  pushl $0
  10224f:	6a 00                	push   $0x0
  pushl $109
  102251:	6a 6d                	push   $0x6d
  jmp __alltraps
  102253:	e9 a2 06 00 00       	jmp    1028fa <__alltraps>

00102258 <vector110>:
.globl vector110
vector110:
  pushl $0
  102258:	6a 00                	push   $0x0
  pushl $110
  10225a:	6a 6e                	push   $0x6e
  jmp __alltraps
  10225c:	e9 99 06 00 00       	jmp    1028fa <__alltraps>

00102261 <vector111>:
.globl vector111
vector111:
  pushl $0
  102261:	6a 00                	push   $0x0
  pushl $111
  102263:	6a 6f                	push   $0x6f
  jmp __alltraps
  102265:	e9 90 06 00 00       	jmp    1028fa <__alltraps>

0010226a <vector112>:
.globl vector112
vector112:
  pushl $0
  10226a:	6a 00                	push   $0x0
  pushl $112
  10226c:	6a 70                	push   $0x70
  jmp __alltraps
  10226e:	e9 87 06 00 00       	jmp    1028fa <__alltraps>

00102273 <vector113>:
.globl vector113
vector113:
  pushl $0
  102273:	6a 00                	push   $0x0
  pushl $113
  102275:	6a 71                	push   $0x71
  jmp __alltraps
  102277:	e9 7e 06 00 00       	jmp    1028fa <__alltraps>

0010227c <vector114>:
.globl vector114
vector114:
  pushl $0
  10227c:	6a 00                	push   $0x0
  pushl $114
  10227e:	6a 72                	push   $0x72
  jmp __alltraps
  102280:	e9 75 06 00 00       	jmp    1028fa <__alltraps>

00102285 <vector115>:
.globl vector115
vector115:
  pushl $0
  102285:	6a 00                	push   $0x0
  pushl $115
  102287:	6a 73                	push   $0x73
  jmp __alltraps
  102289:	e9 6c 06 00 00       	jmp    1028fa <__alltraps>

0010228e <vector116>:
.globl vector116
vector116:
  pushl $0
  10228e:	6a 00                	push   $0x0
  pushl $116
  102290:	6a 74                	push   $0x74
  jmp __alltraps
  102292:	e9 63 06 00 00       	jmp    1028fa <__alltraps>

00102297 <vector117>:
.globl vector117
vector117:
  pushl $0
  102297:	6a 00                	push   $0x0
  pushl $117
  102299:	6a 75                	push   $0x75
  jmp __alltraps
  10229b:	e9 5a 06 00 00       	jmp    1028fa <__alltraps>

001022a0 <vector118>:
.globl vector118
vector118:
  pushl $0
  1022a0:	6a 00                	push   $0x0
  pushl $118
  1022a2:	6a 76                	push   $0x76
  jmp __alltraps
  1022a4:	e9 51 06 00 00       	jmp    1028fa <__alltraps>

001022a9 <vector119>:
.globl vector119
vector119:
  pushl $0
  1022a9:	6a 00                	push   $0x0
  pushl $119
  1022ab:	6a 77                	push   $0x77
  jmp __alltraps
  1022ad:	e9 48 06 00 00       	jmp    1028fa <__alltraps>

001022b2 <vector120>:
.globl vector120
vector120:
  pushl $0
  1022b2:	6a 00                	push   $0x0
  pushl $120
  1022b4:	6a 78                	push   $0x78
  jmp __alltraps
  1022b6:	e9 3f 06 00 00       	jmp    1028fa <__alltraps>

001022bb <vector121>:
.globl vector121
vector121:
  pushl $0
  1022bb:	6a 00                	push   $0x0
  pushl $121
  1022bd:	6a 79                	push   $0x79
  jmp __alltraps
  1022bf:	e9 36 06 00 00       	jmp    1028fa <__alltraps>

001022c4 <vector122>:
.globl vector122
vector122:
  pushl $0
  1022c4:	6a 00                	push   $0x0
  pushl $122
  1022c6:	6a 7a                	push   $0x7a
  jmp __alltraps
  1022c8:	e9 2d 06 00 00       	jmp    1028fa <__alltraps>

001022cd <vector123>:
.globl vector123
vector123:
  pushl $0
  1022cd:	6a 00                	push   $0x0
  pushl $123
  1022cf:	6a 7b                	push   $0x7b
  jmp __alltraps
  1022d1:	e9 24 06 00 00       	jmp    1028fa <__alltraps>

001022d6 <vector124>:
.globl vector124
vector124:
  pushl $0
  1022d6:	6a 00                	push   $0x0
  pushl $124
  1022d8:	6a 7c                	push   $0x7c
  jmp __alltraps
  1022da:	e9 1b 06 00 00       	jmp    1028fa <__alltraps>

001022df <vector125>:
.globl vector125
vector125:
  pushl $0
  1022df:	6a 00                	push   $0x0
  pushl $125
  1022e1:	6a 7d                	push   $0x7d
  jmp __alltraps
  1022e3:	e9 12 06 00 00       	jmp    1028fa <__alltraps>

001022e8 <vector126>:
.globl vector126
vector126:
  pushl $0
  1022e8:	6a 00                	push   $0x0
  pushl $126
  1022ea:	6a 7e                	push   $0x7e
  jmp __alltraps
  1022ec:	e9 09 06 00 00       	jmp    1028fa <__alltraps>

001022f1 <vector127>:
.globl vector127
vector127:
  pushl $0
  1022f1:	6a 00                	push   $0x0
  pushl $127
  1022f3:	6a 7f                	push   $0x7f
  jmp __alltraps
  1022f5:	e9 00 06 00 00       	jmp    1028fa <__alltraps>

001022fa <vector128>:
.globl vector128
vector128:
  pushl $0
  1022fa:	6a 00                	push   $0x0
  pushl $128
  1022fc:	68 80 00 00 00       	push   $0x80
  jmp __alltraps
  102301:	e9 f4 05 00 00       	jmp    1028fa <__alltraps>

00102306 <vector129>:
.globl vector129
vector129:
  pushl $0
  102306:	6a 00                	push   $0x0
  pushl $129
  102308:	68 81 00 00 00       	push   $0x81
  jmp __alltraps
  10230d:	e9 e8 05 00 00       	jmp    1028fa <__alltraps>

00102312 <vector130>:
.globl vector130
vector130:
  pushl $0
  102312:	6a 00                	push   $0x0
  pushl $130
  102314:	68 82 00 00 00       	push   $0x82
  jmp __alltraps
  102319:	e9 dc 05 00 00       	jmp    1028fa <__alltraps>

0010231e <vector131>:
.globl vector131
vector131:
  pushl $0
  10231e:	6a 00                	push   $0x0
  pushl $131
  102320:	68 83 00 00 00       	push   $0x83
  jmp __alltraps
  102325:	e9 d0 05 00 00       	jmp    1028fa <__alltraps>

0010232a <vector132>:
.globl vector132
vector132:
  pushl $0
  10232a:	6a 00                	push   $0x0
  pushl $132
  10232c:	68 84 00 00 00       	push   $0x84
  jmp __alltraps
  102331:	e9 c4 05 00 00       	jmp    1028fa <__alltraps>

00102336 <vector133>:
.globl vector133
vector133:
  pushl $0
  102336:	6a 00                	push   $0x0
  pushl $133
  102338:	68 85 00 00 00       	push   $0x85
  jmp __alltraps
  10233d:	e9 b8 05 00 00       	jmp    1028fa <__alltraps>

00102342 <vector134>:
.globl vector134
vector134:
  pushl $0
  102342:	6a 00                	push   $0x0
  pushl $134
  102344:	68 86 00 00 00       	push   $0x86
  jmp __alltraps
  102349:	e9 ac 05 00 00       	jmp    1028fa <__alltraps>

0010234e <vector135>:
.globl vector135
vector135:
  pushl $0
  10234e:	6a 00                	push   $0x0
  pushl $135
  102350:	68 87 00 00 00       	push   $0x87
  jmp __alltraps
  102355:	e9 a0 05 00 00       	jmp    1028fa <__alltraps>

0010235a <vector136>:
.globl vector136
vector136:
  pushl $0
  10235a:	6a 00                	push   $0x0
  pushl $136
  10235c:	68 88 00 00 00       	push   $0x88
  jmp __alltraps
  102361:	e9 94 05 00 00       	jmp    1028fa <__alltraps>

00102366 <vector137>:
.globl vector137
vector137:
  pushl $0
  102366:	6a 00                	push   $0x0
  pushl $137
  102368:	68 89 00 00 00       	push   $0x89
  jmp __alltraps
  10236d:	e9 88 05 00 00       	jmp    1028fa <__alltraps>

00102372 <vector138>:
.globl vector138
vector138:
  pushl $0
  102372:	6a 00                	push   $0x0
  pushl $138
  102374:	68 8a 00 00 00       	push   $0x8a
  jmp __alltraps
  102379:	e9 7c 05 00 00       	jmp    1028fa <__alltraps>

0010237e <vector139>:
.globl vector139
vector139:
  pushl $0
  10237e:	6a 00                	push   $0x0
  pushl $139
  102380:	68 8b 00 00 00       	push   $0x8b
  jmp __alltraps
  102385:	e9 70 05 00 00       	jmp    1028fa <__alltraps>

0010238a <vector140>:
.globl vector140
vector140:
  pushl $0
  10238a:	6a 00                	push   $0x0
  pushl $140
  10238c:	68 8c 00 00 00       	push   $0x8c
  jmp __alltraps
  102391:	e9 64 05 00 00       	jmp    1028fa <__alltraps>

00102396 <vector141>:
.globl vector141
vector141:
  pushl $0
  102396:	6a 00                	push   $0x0
  pushl $141
  102398:	68 8d 00 00 00       	push   $0x8d
  jmp __alltraps
  10239d:	e9 58 05 00 00       	jmp    1028fa <__alltraps>

001023a2 <vector142>:
.globl vector142
vector142:
  pushl $0
  1023a2:	6a 00                	push   $0x0
  pushl $142
  1023a4:	68 8e 00 00 00       	push   $0x8e
  jmp __alltraps
  1023a9:	e9 4c 05 00 00       	jmp    1028fa <__alltraps>

001023ae <vector143>:
.globl vector143
vector143:
  pushl $0
  1023ae:	6a 00                	push   $0x0
  pushl $143
  1023b0:	68 8f 00 00 00       	push   $0x8f
  jmp __alltraps
  1023b5:	e9 40 05 00 00       	jmp    1028fa <__alltraps>

001023ba <vector144>:
.globl vector144
vector144:
  pushl $0
  1023ba:	6a 00                	push   $0x0
  pushl $144
  1023bc:	68 90 00 00 00       	push   $0x90
  jmp __alltraps
  1023c1:	e9 34 05 00 00       	jmp    1028fa <__alltraps>

001023c6 <vector145>:
.globl vector145
vector145:
  pushl $0
  1023c6:	6a 00                	push   $0x0
  pushl $145
  1023c8:	68 91 00 00 00       	push   $0x91
  jmp __alltraps
  1023cd:	e9 28 05 00 00       	jmp    1028fa <__alltraps>

001023d2 <vector146>:
.globl vector146
vector146:
  pushl $0
  1023d2:	6a 00                	push   $0x0
  pushl $146
  1023d4:	68 92 00 00 00       	push   $0x92
  jmp __alltraps
  1023d9:	e9 1c 05 00 00       	jmp    1028fa <__alltraps>

001023de <vector147>:
.globl vector147
vector147:
  pushl $0
  1023de:	6a 00                	push   $0x0
  pushl $147
  1023e0:	68 93 00 00 00       	push   $0x93
  jmp __alltraps
  1023e5:	e9 10 05 00 00       	jmp    1028fa <__alltraps>

001023ea <vector148>:
.globl vector148
vector148:
  pushl $0
  1023ea:	6a 00                	push   $0x0
  pushl $148
  1023ec:	68 94 00 00 00       	push   $0x94
  jmp __alltraps
  1023f1:	e9 04 05 00 00       	jmp    1028fa <__alltraps>

001023f6 <vector149>:
.globl vector149
vector149:
  pushl $0
  1023f6:	6a 00                	push   $0x0
  pushl $149
  1023f8:	68 95 00 00 00       	push   $0x95
  jmp __alltraps
  1023fd:	e9 f8 04 00 00       	jmp    1028fa <__alltraps>

00102402 <vector150>:
.globl vector150
vector150:
  pushl $0
  102402:	6a 00                	push   $0x0
  pushl $150
  102404:	68 96 00 00 00       	push   $0x96
  jmp __alltraps
  102409:	e9 ec 04 00 00       	jmp    1028fa <__alltraps>

0010240e <vector151>:
.globl vector151
vector151:
  pushl $0
  10240e:	6a 00                	push   $0x0
  pushl $151
  102410:	68 97 00 00 00       	push   $0x97
  jmp __alltraps
  102415:	e9 e0 04 00 00       	jmp    1028fa <__alltraps>

0010241a <vector152>:
.globl vector152
vector152:
  pushl $0
  10241a:	6a 00                	push   $0x0
  pushl $152
  10241c:	68 98 00 00 00       	push   $0x98
  jmp __alltraps
  102421:	e9 d4 04 00 00       	jmp    1028fa <__alltraps>

00102426 <vector153>:
.globl vector153
vector153:
  pushl $0
  102426:	6a 00                	push   $0x0
  pushl $153
  102428:	68 99 00 00 00       	push   $0x99
  jmp __alltraps
  10242d:	e9 c8 04 00 00       	jmp    1028fa <__alltraps>

00102432 <vector154>:
.globl vector154
vector154:
  pushl $0
  102432:	6a 00                	push   $0x0
  pushl $154
  102434:	68 9a 00 00 00       	push   $0x9a
  jmp __alltraps
  102439:	e9 bc 04 00 00       	jmp    1028fa <__alltraps>

0010243e <vector155>:
.globl vector155
vector155:
  pushl $0
  10243e:	6a 00                	push   $0x0
  pushl $155
  102440:	68 9b 00 00 00       	push   $0x9b
  jmp __alltraps
  102445:	e9 b0 04 00 00       	jmp    1028fa <__alltraps>

0010244a <vector156>:
.globl vector156
vector156:
  pushl $0
  10244a:	6a 00                	push   $0x0
  pushl $156
  10244c:	68 9c 00 00 00       	push   $0x9c
  jmp __alltraps
  102451:	e9 a4 04 00 00       	jmp    1028fa <__alltraps>

00102456 <vector157>:
.globl vector157
vector157:
  pushl $0
  102456:	6a 00                	push   $0x0
  pushl $157
  102458:	68 9d 00 00 00       	push   $0x9d
  jmp __alltraps
  10245d:	e9 98 04 00 00       	jmp    1028fa <__alltraps>

00102462 <vector158>:
.globl vector158
vector158:
  pushl $0
  102462:	6a 00                	push   $0x0
  pushl $158
  102464:	68 9e 00 00 00       	push   $0x9e
  jmp __alltraps
  102469:	e9 8c 04 00 00       	jmp    1028fa <__alltraps>

0010246e <vector159>:
.globl vector159
vector159:
  pushl $0
  10246e:	6a 00                	push   $0x0
  pushl $159
  102470:	68 9f 00 00 00       	push   $0x9f
  jmp __alltraps
  102475:	e9 80 04 00 00       	jmp    1028fa <__alltraps>

0010247a <vector160>:
.globl vector160
vector160:
  pushl $0
  10247a:	6a 00                	push   $0x0
  pushl $160
  10247c:	68 a0 00 00 00       	push   $0xa0
  jmp __alltraps
  102481:	e9 74 04 00 00       	jmp    1028fa <__alltraps>

00102486 <vector161>:
.globl vector161
vector161:
  pushl $0
  102486:	6a 00                	push   $0x0
  pushl $161
  102488:	68 a1 00 00 00       	push   $0xa1
  jmp __alltraps
  10248d:	e9 68 04 00 00       	jmp    1028fa <__alltraps>

00102492 <vector162>:
.globl vector162
vector162:
  pushl $0
  102492:	6a 00                	push   $0x0
  pushl $162
  102494:	68 a2 00 00 00       	push   $0xa2
  jmp __alltraps
  102499:	e9 5c 04 00 00       	jmp    1028fa <__alltraps>

0010249e <vector163>:
.globl vector163
vector163:
  pushl $0
  10249e:	6a 00                	push   $0x0
  pushl $163
  1024a0:	68 a3 00 00 00       	push   $0xa3
  jmp __alltraps
  1024a5:	e9 50 04 00 00       	jmp    1028fa <__alltraps>

001024aa <vector164>:
.globl vector164
vector164:
  pushl $0
  1024aa:	6a 00                	push   $0x0
  pushl $164
  1024ac:	68 a4 00 00 00       	push   $0xa4
  jmp __alltraps
  1024b1:	e9 44 04 00 00       	jmp    1028fa <__alltraps>

001024b6 <vector165>:
.globl vector165
vector165:
  pushl $0
  1024b6:	6a 00                	push   $0x0
  pushl $165
  1024b8:	68 a5 00 00 00       	push   $0xa5
  jmp __alltraps
  1024bd:	e9 38 04 00 00       	jmp    1028fa <__alltraps>

001024c2 <vector166>:
.globl vector166
vector166:
  pushl $0
  1024c2:	6a 00                	push   $0x0
  pushl $166
  1024c4:	68 a6 00 00 00       	push   $0xa6
  jmp __alltraps
  1024c9:	e9 2c 04 00 00       	jmp    1028fa <__alltraps>

001024ce <vector167>:
.globl vector167
vector167:
  pushl $0
  1024ce:	6a 00                	push   $0x0
  pushl $167
  1024d0:	68 a7 00 00 00       	push   $0xa7
  jmp __alltraps
  1024d5:	e9 20 04 00 00       	jmp    1028fa <__alltraps>

001024da <vector168>:
.globl vector168
vector168:
  pushl $0
  1024da:	6a 00                	push   $0x0
  pushl $168
  1024dc:	68 a8 00 00 00       	push   $0xa8
  jmp __alltraps
  1024e1:	e9 14 04 00 00       	jmp    1028fa <__alltraps>

001024e6 <vector169>:
.globl vector169
vector169:
  pushl $0
  1024e6:	6a 00                	push   $0x0
  pushl $169
  1024e8:	68 a9 00 00 00       	push   $0xa9
  jmp __alltraps
  1024ed:	e9 08 04 00 00       	jmp    1028fa <__alltraps>

001024f2 <vector170>:
.globl vector170
vector170:
  pushl $0
  1024f2:	6a 00                	push   $0x0
  pushl $170
  1024f4:	68 aa 00 00 00       	push   $0xaa
  jmp __alltraps
  1024f9:	e9 fc 03 00 00       	jmp    1028fa <__alltraps>

001024fe <vector171>:
.globl vector171
vector171:
  pushl $0
  1024fe:	6a 00                	push   $0x0
  pushl $171
  102500:	68 ab 00 00 00       	push   $0xab
  jmp __alltraps
  102505:	e9 f0 03 00 00       	jmp    1028fa <__alltraps>

0010250a <vector172>:
.globl vector172
vector172:
  pushl $0
  10250a:	6a 00                	push   $0x0
  pushl $172
  10250c:	68 ac 00 00 00       	push   $0xac
  jmp __alltraps
  102511:	e9 e4 03 00 00       	jmp    1028fa <__alltraps>

00102516 <vector173>:
.globl vector173
vector173:
  pushl $0
  102516:	6a 00                	push   $0x0
  pushl $173
  102518:	68 ad 00 00 00       	push   $0xad
  jmp __alltraps
  10251d:	e9 d8 03 00 00       	jmp    1028fa <__alltraps>

00102522 <vector174>:
.globl vector174
vector174:
  pushl $0
  102522:	6a 00                	push   $0x0
  pushl $174
  102524:	68 ae 00 00 00       	push   $0xae
  jmp __alltraps
  102529:	e9 cc 03 00 00       	jmp    1028fa <__alltraps>

0010252e <vector175>:
.globl vector175
vector175:
  pushl $0
  10252e:	6a 00                	push   $0x0
  pushl $175
  102530:	68 af 00 00 00       	push   $0xaf
  jmp __alltraps
  102535:	e9 c0 03 00 00       	jmp    1028fa <__alltraps>

0010253a <vector176>:
.globl vector176
vector176:
  pushl $0
  10253a:	6a 00                	push   $0x0
  pushl $176
  10253c:	68 b0 00 00 00       	push   $0xb0
  jmp __alltraps
  102541:	e9 b4 03 00 00       	jmp    1028fa <__alltraps>

00102546 <vector177>:
.globl vector177
vector177:
  pushl $0
  102546:	6a 00                	push   $0x0
  pushl $177
  102548:	68 b1 00 00 00       	push   $0xb1
  jmp __alltraps
  10254d:	e9 a8 03 00 00       	jmp    1028fa <__alltraps>

00102552 <vector178>:
.globl vector178
vector178:
  pushl $0
  102552:	6a 00                	push   $0x0
  pushl $178
  102554:	68 b2 00 00 00       	push   $0xb2
  jmp __alltraps
  102559:	e9 9c 03 00 00       	jmp    1028fa <__alltraps>

0010255e <vector179>:
.globl vector179
vector179:
  pushl $0
  10255e:	6a 00                	push   $0x0
  pushl $179
  102560:	68 b3 00 00 00       	push   $0xb3
  jmp __alltraps
  102565:	e9 90 03 00 00       	jmp    1028fa <__alltraps>

0010256a <vector180>:
.globl vector180
vector180:
  pushl $0
  10256a:	6a 00                	push   $0x0
  pushl $180
  10256c:	68 b4 00 00 00       	push   $0xb4
  jmp __alltraps
  102571:	e9 84 03 00 00       	jmp    1028fa <__alltraps>

00102576 <vector181>:
.globl vector181
vector181:
  pushl $0
  102576:	6a 00                	push   $0x0
  pushl $181
  102578:	68 b5 00 00 00       	push   $0xb5
  jmp __alltraps
  10257d:	e9 78 03 00 00       	jmp    1028fa <__alltraps>

00102582 <vector182>:
.globl vector182
vector182:
  pushl $0
  102582:	6a 00                	push   $0x0
  pushl $182
  102584:	68 b6 00 00 00       	push   $0xb6
  jmp __alltraps
  102589:	e9 6c 03 00 00       	jmp    1028fa <__alltraps>

0010258e <vector183>:
.globl vector183
vector183:
  pushl $0
  10258e:	6a 00                	push   $0x0
  pushl $183
  102590:	68 b7 00 00 00       	push   $0xb7
  jmp __alltraps
  102595:	e9 60 03 00 00       	jmp    1028fa <__alltraps>

0010259a <vector184>:
.globl vector184
vector184:
  pushl $0
  10259a:	6a 00                	push   $0x0
  pushl $184
  10259c:	68 b8 00 00 00       	push   $0xb8
  jmp __alltraps
  1025a1:	e9 54 03 00 00       	jmp    1028fa <__alltraps>

001025a6 <vector185>:
.globl vector185
vector185:
  pushl $0
  1025a6:	6a 00                	push   $0x0
  pushl $185
  1025a8:	68 b9 00 00 00       	push   $0xb9
  jmp __alltraps
  1025ad:	e9 48 03 00 00       	jmp    1028fa <__alltraps>

001025b2 <vector186>:
.globl vector186
vector186:
  pushl $0
  1025b2:	6a 00                	push   $0x0
  pushl $186
  1025b4:	68 ba 00 00 00       	push   $0xba
  jmp __alltraps
  1025b9:	e9 3c 03 00 00       	jmp    1028fa <__alltraps>

001025be <vector187>:
.globl vector187
vector187:
  pushl $0
  1025be:	6a 00                	push   $0x0
  pushl $187
  1025c0:	68 bb 00 00 00       	push   $0xbb
  jmp __alltraps
  1025c5:	e9 30 03 00 00       	jmp    1028fa <__alltraps>

001025ca <vector188>:
.globl vector188
vector188:
  pushl $0
  1025ca:	6a 00                	push   $0x0
  pushl $188
  1025cc:	68 bc 00 00 00       	push   $0xbc
  jmp __alltraps
  1025d1:	e9 24 03 00 00       	jmp    1028fa <__alltraps>

001025d6 <vector189>:
.globl vector189
vector189:
  pushl $0
  1025d6:	6a 00                	push   $0x0
  pushl $189
  1025d8:	68 bd 00 00 00       	push   $0xbd
  jmp __alltraps
  1025dd:	e9 18 03 00 00       	jmp    1028fa <__alltraps>

001025e2 <vector190>:
.globl vector190
vector190:
  pushl $0
  1025e2:	6a 00                	push   $0x0
  pushl $190
  1025e4:	68 be 00 00 00       	push   $0xbe
  jmp __alltraps
  1025e9:	e9 0c 03 00 00       	jmp    1028fa <__alltraps>

001025ee <vector191>:
.globl vector191
vector191:
  pushl $0
  1025ee:	6a 00                	push   $0x0
  pushl $191
  1025f0:	68 bf 00 00 00       	push   $0xbf
  jmp __alltraps
  1025f5:	e9 00 03 00 00       	jmp    1028fa <__alltraps>

001025fa <vector192>:
.globl vector192
vector192:
  pushl $0
  1025fa:	6a 00                	push   $0x0
  pushl $192
  1025fc:	68 c0 00 00 00       	push   $0xc0
  jmp __alltraps
  102601:	e9 f4 02 00 00       	jmp    1028fa <__alltraps>

00102606 <vector193>:
.globl vector193
vector193:
  pushl $0
  102606:	6a 00                	push   $0x0
  pushl $193
  102608:	68 c1 00 00 00       	push   $0xc1
  jmp __alltraps
  10260d:	e9 e8 02 00 00       	jmp    1028fa <__alltraps>

00102612 <vector194>:
.globl vector194
vector194:
  pushl $0
  102612:	6a 00                	push   $0x0
  pushl $194
  102614:	68 c2 00 00 00       	push   $0xc2
  jmp __alltraps
  102619:	e9 dc 02 00 00       	jmp    1028fa <__alltraps>

0010261e <vector195>:
.globl vector195
vector195:
  pushl $0
  10261e:	6a 00                	push   $0x0
  pushl $195
  102620:	68 c3 00 00 00       	push   $0xc3
  jmp __alltraps
  102625:	e9 d0 02 00 00       	jmp    1028fa <__alltraps>

0010262a <vector196>:
.globl vector196
vector196:
  pushl $0
  10262a:	6a 00                	push   $0x0
  pushl $196
  10262c:	68 c4 00 00 00       	push   $0xc4
  jmp __alltraps
  102631:	e9 c4 02 00 00       	jmp    1028fa <__alltraps>

00102636 <vector197>:
.globl vector197
vector197:
  pushl $0
  102636:	6a 00                	push   $0x0
  pushl $197
  102638:	68 c5 00 00 00       	push   $0xc5
  jmp __alltraps
  10263d:	e9 b8 02 00 00       	jmp    1028fa <__alltraps>

00102642 <vector198>:
.globl vector198
vector198:
  pushl $0
  102642:	6a 00                	push   $0x0
  pushl $198
  102644:	68 c6 00 00 00       	push   $0xc6
  jmp __alltraps
  102649:	e9 ac 02 00 00       	jmp    1028fa <__alltraps>

0010264e <vector199>:
.globl vector199
vector199:
  pushl $0
  10264e:	6a 00                	push   $0x0
  pushl $199
  102650:	68 c7 00 00 00       	push   $0xc7
  jmp __alltraps
  102655:	e9 a0 02 00 00       	jmp    1028fa <__alltraps>

0010265a <vector200>:
.globl vector200
vector200:
  pushl $0
  10265a:	6a 00                	push   $0x0
  pushl $200
  10265c:	68 c8 00 00 00       	push   $0xc8
  jmp __alltraps
  102661:	e9 94 02 00 00       	jmp    1028fa <__alltraps>

00102666 <vector201>:
.globl vector201
vector201:
  pushl $0
  102666:	6a 00                	push   $0x0
  pushl $201
  102668:	68 c9 00 00 00       	push   $0xc9
  jmp __alltraps
  10266d:	e9 88 02 00 00       	jmp    1028fa <__alltraps>

00102672 <vector202>:
.globl vector202
vector202:
  pushl $0
  102672:	6a 00                	push   $0x0
  pushl $202
  102674:	68 ca 00 00 00       	push   $0xca
  jmp __alltraps
  102679:	e9 7c 02 00 00       	jmp    1028fa <__alltraps>

0010267e <vector203>:
.globl vector203
vector203:
  pushl $0
  10267e:	6a 00                	push   $0x0
  pushl $203
  102680:	68 cb 00 00 00       	push   $0xcb
  jmp __alltraps
  102685:	e9 70 02 00 00       	jmp    1028fa <__alltraps>

0010268a <vector204>:
.globl vector204
vector204:
  pushl $0
  10268a:	6a 00                	push   $0x0
  pushl $204
  10268c:	68 cc 00 00 00       	push   $0xcc
  jmp __alltraps
  102691:	e9 64 02 00 00       	jmp    1028fa <__alltraps>

00102696 <vector205>:
.globl vector205
vector205:
  pushl $0
  102696:	6a 00                	push   $0x0
  pushl $205
  102698:	68 cd 00 00 00       	push   $0xcd
  jmp __alltraps
  10269d:	e9 58 02 00 00       	jmp    1028fa <__alltraps>

001026a2 <vector206>:
.globl vector206
vector206:
  pushl $0
  1026a2:	6a 00                	push   $0x0
  pushl $206
  1026a4:	68 ce 00 00 00       	push   $0xce
  jmp __alltraps
  1026a9:	e9 4c 02 00 00       	jmp    1028fa <__alltraps>

001026ae <vector207>:
.globl vector207
vector207:
  pushl $0
  1026ae:	6a 00                	push   $0x0
  pushl $207
  1026b0:	68 cf 00 00 00       	push   $0xcf
  jmp __alltraps
  1026b5:	e9 40 02 00 00       	jmp    1028fa <__alltraps>

001026ba <vector208>:
.globl vector208
vector208:
  pushl $0
  1026ba:	6a 00                	push   $0x0
  pushl $208
  1026bc:	68 d0 00 00 00       	push   $0xd0
  jmp __alltraps
  1026c1:	e9 34 02 00 00       	jmp    1028fa <__alltraps>

001026c6 <vector209>:
.globl vector209
vector209:
  pushl $0
  1026c6:	6a 00                	push   $0x0
  pushl $209
  1026c8:	68 d1 00 00 00       	push   $0xd1
  jmp __alltraps
  1026cd:	e9 28 02 00 00       	jmp    1028fa <__alltraps>

001026d2 <vector210>:
.globl vector210
vector210:
  pushl $0
  1026d2:	6a 00                	push   $0x0
  pushl $210
  1026d4:	68 d2 00 00 00       	push   $0xd2
  jmp __alltraps
  1026d9:	e9 1c 02 00 00       	jmp    1028fa <__alltraps>

001026de <vector211>:
.globl vector211
vector211:
  pushl $0
  1026de:	6a 00                	push   $0x0
  pushl $211
  1026e0:	68 d3 00 00 00       	push   $0xd3
  jmp __alltraps
  1026e5:	e9 10 02 00 00       	jmp    1028fa <__alltraps>

001026ea <vector212>:
.globl vector212
vector212:
  pushl $0
  1026ea:	6a 00                	push   $0x0
  pushl $212
  1026ec:	68 d4 00 00 00       	push   $0xd4
  jmp __alltraps
  1026f1:	e9 04 02 00 00       	jmp    1028fa <__alltraps>

001026f6 <vector213>:
.globl vector213
vector213:
  pushl $0
  1026f6:	6a 00                	push   $0x0
  pushl $213
  1026f8:	68 d5 00 00 00       	push   $0xd5
  jmp __alltraps
  1026fd:	e9 f8 01 00 00       	jmp    1028fa <__alltraps>

00102702 <vector214>:
.globl vector214
vector214:
  pushl $0
  102702:	6a 00                	push   $0x0
  pushl $214
  102704:	68 d6 00 00 00       	push   $0xd6
  jmp __alltraps
  102709:	e9 ec 01 00 00       	jmp    1028fa <__alltraps>

0010270e <vector215>:
.globl vector215
vector215:
  pushl $0
  10270e:	6a 00                	push   $0x0
  pushl $215
  102710:	68 d7 00 00 00       	push   $0xd7
  jmp __alltraps
  102715:	e9 e0 01 00 00       	jmp    1028fa <__alltraps>

0010271a <vector216>:
.globl vector216
vector216:
  pushl $0
  10271a:	6a 00                	push   $0x0
  pushl $216
  10271c:	68 d8 00 00 00       	push   $0xd8
  jmp __alltraps
  102721:	e9 d4 01 00 00       	jmp    1028fa <__alltraps>

00102726 <vector217>:
.globl vector217
vector217:
  pushl $0
  102726:	6a 00                	push   $0x0
  pushl $217
  102728:	68 d9 00 00 00       	push   $0xd9
  jmp __alltraps
  10272d:	e9 c8 01 00 00       	jmp    1028fa <__alltraps>

00102732 <vector218>:
.globl vector218
vector218:
  pushl $0
  102732:	6a 00                	push   $0x0
  pushl $218
  102734:	68 da 00 00 00       	push   $0xda
  jmp __alltraps
  102739:	e9 bc 01 00 00       	jmp    1028fa <__alltraps>

0010273e <vector219>:
.globl vector219
vector219:
  pushl $0
  10273e:	6a 00                	push   $0x0
  pushl $219
  102740:	68 db 00 00 00       	push   $0xdb
  jmp __alltraps
  102745:	e9 b0 01 00 00       	jmp    1028fa <__alltraps>

0010274a <vector220>:
.globl vector220
vector220:
  pushl $0
  10274a:	6a 00                	push   $0x0
  pushl $220
  10274c:	68 dc 00 00 00       	push   $0xdc
  jmp __alltraps
  102751:	e9 a4 01 00 00       	jmp    1028fa <__alltraps>

00102756 <vector221>:
.globl vector221
vector221:
  pushl $0
  102756:	6a 00                	push   $0x0
  pushl $221
  102758:	68 dd 00 00 00       	push   $0xdd
  jmp __alltraps
  10275d:	e9 98 01 00 00       	jmp    1028fa <__alltraps>

00102762 <vector222>:
.globl vector222
vector222:
  pushl $0
  102762:	6a 00                	push   $0x0
  pushl $222
  102764:	68 de 00 00 00       	push   $0xde
  jmp __alltraps
  102769:	e9 8c 01 00 00       	jmp    1028fa <__alltraps>

0010276e <vector223>:
.globl vector223
vector223:
  pushl $0
  10276e:	6a 00                	push   $0x0
  pushl $223
  102770:	68 df 00 00 00       	push   $0xdf
  jmp __alltraps
  102775:	e9 80 01 00 00       	jmp    1028fa <__alltraps>

0010277a <vector224>:
.globl vector224
vector224:
  pushl $0
  10277a:	6a 00                	push   $0x0
  pushl $224
  10277c:	68 e0 00 00 00       	push   $0xe0
  jmp __alltraps
  102781:	e9 74 01 00 00       	jmp    1028fa <__alltraps>

00102786 <vector225>:
.globl vector225
vector225:
  pushl $0
  102786:	6a 00                	push   $0x0
  pushl $225
  102788:	68 e1 00 00 00       	push   $0xe1
  jmp __alltraps
  10278d:	e9 68 01 00 00       	jmp    1028fa <__alltraps>

00102792 <vector226>:
.globl vector226
vector226:
  pushl $0
  102792:	6a 00                	push   $0x0
  pushl $226
  102794:	68 e2 00 00 00       	push   $0xe2
  jmp __alltraps
  102799:	e9 5c 01 00 00       	jmp    1028fa <__alltraps>

0010279e <vector227>:
.globl vector227
vector227:
  pushl $0
  10279e:	6a 00                	push   $0x0
  pushl $227
  1027a0:	68 e3 00 00 00       	push   $0xe3
  jmp __alltraps
  1027a5:	e9 50 01 00 00       	jmp    1028fa <__alltraps>

001027aa <vector228>:
.globl vector228
vector228:
  pushl $0
  1027aa:	6a 00                	push   $0x0
  pushl $228
  1027ac:	68 e4 00 00 00       	push   $0xe4
  jmp __alltraps
  1027b1:	e9 44 01 00 00       	jmp    1028fa <__alltraps>

001027b6 <vector229>:
.globl vector229
vector229:
  pushl $0
  1027b6:	6a 00                	push   $0x0
  pushl $229
  1027b8:	68 e5 00 00 00       	push   $0xe5
  jmp __alltraps
  1027bd:	e9 38 01 00 00       	jmp    1028fa <__alltraps>

001027c2 <vector230>:
.globl vector230
vector230:
  pushl $0
  1027c2:	6a 00                	push   $0x0
  pushl $230
  1027c4:	68 e6 00 00 00       	push   $0xe6
  jmp __alltraps
  1027c9:	e9 2c 01 00 00       	jmp    1028fa <__alltraps>

001027ce <vector231>:
.globl vector231
vector231:
  pushl $0
  1027ce:	6a 00                	push   $0x0
  pushl $231
  1027d0:	68 e7 00 00 00       	push   $0xe7
  jmp __alltraps
  1027d5:	e9 20 01 00 00       	jmp    1028fa <__alltraps>

001027da <vector232>:
.globl vector232
vector232:
  pushl $0
  1027da:	6a 00                	push   $0x0
  pushl $232
  1027dc:	68 e8 00 00 00       	push   $0xe8
  jmp __alltraps
  1027e1:	e9 14 01 00 00       	jmp    1028fa <__alltraps>

001027e6 <vector233>:
.globl vector233
vector233:
  pushl $0
  1027e6:	6a 00                	push   $0x0
  pushl $233
  1027e8:	68 e9 00 00 00       	push   $0xe9
  jmp __alltraps
  1027ed:	e9 08 01 00 00       	jmp    1028fa <__alltraps>

001027f2 <vector234>:
.globl vector234
vector234:
  pushl $0
  1027f2:	6a 00                	push   $0x0
  pushl $234
  1027f4:	68 ea 00 00 00       	push   $0xea
  jmp __alltraps
  1027f9:	e9 fc 00 00 00       	jmp    1028fa <__alltraps>

001027fe <vector235>:
.globl vector235
vector235:
  pushl $0
  1027fe:	6a 00                	push   $0x0
  pushl $235
  102800:	68 eb 00 00 00       	push   $0xeb
  jmp __alltraps
  102805:	e9 f0 00 00 00       	jmp    1028fa <__alltraps>

0010280a <vector236>:
.globl vector236
vector236:
  pushl $0
  10280a:	6a 00                	push   $0x0
  pushl $236
  10280c:	68 ec 00 00 00       	push   $0xec
  jmp __alltraps
  102811:	e9 e4 00 00 00       	jmp    1028fa <__alltraps>

00102816 <vector237>:
.globl vector237
vector237:
  pushl $0
  102816:	6a 00                	push   $0x0
  pushl $237
  102818:	68 ed 00 00 00       	push   $0xed
  jmp __alltraps
  10281d:	e9 d8 00 00 00       	jmp    1028fa <__alltraps>

00102822 <vector238>:
.globl vector238
vector238:
  pushl $0
  102822:	6a 00                	push   $0x0
  pushl $238
  102824:	68 ee 00 00 00       	push   $0xee
  jmp __alltraps
  102829:	e9 cc 00 00 00       	jmp    1028fa <__alltraps>

0010282e <vector239>:
.globl vector239
vector239:
  pushl $0
  10282e:	6a 00                	push   $0x0
  pushl $239
  102830:	68 ef 00 00 00       	push   $0xef
  jmp __alltraps
  102835:	e9 c0 00 00 00       	jmp    1028fa <__alltraps>

0010283a <vector240>:
.globl vector240
vector240:
  pushl $0
  10283a:	6a 00                	push   $0x0
  pushl $240
  10283c:	68 f0 00 00 00       	push   $0xf0
  jmp __alltraps
  102841:	e9 b4 00 00 00       	jmp    1028fa <__alltraps>

00102846 <vector241>:
.globl vector241
vector241:
  pushl $0
  102846:	6a 00                	push   $0x0
  pushl $241
  102848:	68 f1 00 00 00       	push   $0xf1
  jmp __alltraps
  10284d:	e9 a8 00 00 00       	jmp    1028fa <__alltraps>

00102852 <vector242>:
.globl vector242
vector242:
  pushl $0
  102852:	6a 00                	push   $0x0
  pushl $242
  102854:	68 f2 00 00 00       	push   $0xf2
  jmp __alltraps
  102859:	e9 9c 00 00 00       	jmp    1028fa <__alltraps>

0010285e <vector243>:
.globl vector243
vector243:
  pushl $0
  10285e:	6a 00                	push   $0x0
  pushl $243
  102860:	68 f3 00 00 00       	push   $0xf3
  jmp __alltraps
  102865:	e9 90 00 00 00       	jmp    1028fa <__alltraps>

0010286a <vector244>:
.globl vector244
vector244:
  pushl $0
  10286a:	6a 00                	push   $0x0
  pushl $244
  10286c:	68 f4 00 00 00       	push   $0xf4
  jmp __alltraps
  102871:	e9 84 00 00 00       	jmp    1028fa <__alltraps>

00102876 <vector245>:
.globl vector245
vector245:
  pushl $0
  102876:	6a 00                	push   $0x0
  pushl $245
  102878:	68 f5 00 00 00       	push   $0xf5
  jmp __alltraps
  10287d:	e9 78 00 00 00       	jmp    1028fa <__alltraps>

00102882 <vector246>:
.globl vector246
vector246:
  pushl $0
  102882:	6a 00                	push   $0x0
  pushl $246
  102884:	68 f6 00 00 00       	push   $0xf6
  jmp __alltraps
  102889:	e9 6c 00 00 00       	jmp    1028fa <__alltraps>

0010288e <vector247>:
.globl vector247
vector247:
  pushl $0
  10288e:	6a 00                	push   $0x0
  pushl $247
  102890:	68 f7 00 00 00       	push   $0xf7
  jmp __alltraps
  102895:	e9 60 00 00 00       	jmp    1028fa <__alltraps>

0010289a <vector248>:
.globl vector248
vector248:
  pushl $0
  10289a:	6a 00                	push   $0x0
  pushl $248
  10289c:	68 f8 00 00 00       	push   $0xf8
  jmp __alltraps
  1028a1:	e9 54 00 00 00       	jmp    1028fa <__alltraps>

001028a6 <vector249>:
.globl vector249
vector249:
  pushl $0
  1028a6:	6a 00                	push   $0x0
  pushl $249
  1028a8:	68 f9 00 00 00       	push   $0xf9
  jmp __alltraps
  1028ad:	e9 48 00 00 00       	jmp    1028fa <__alltraps>

001028b2 <vector250>:
.globl vector250
vector250:
  pushl $0
  1028b2:	6a 00                	push   $0x0
  pushl $250
  1028b4:	68 fa 00 00 00       	push   $0xfa
  jmp __alltraps
  1028b9:	e9 3c 00 00 00       	jmp    1028fa <__alltraps>

001028be <vector251>:
.globl vector251
vector251:
  pushl $0
  1028be:	6a 00                	push   $0x0
  pushl $251
  1028c0:	68 fb 00 00 00       	push   $0xfb
  jmp __alltraps
  1028c5:	e9 30 00 00 00       	jmp    1028fa <__alltraps>

001028ca <vector252>:
.globl vector252
vector252:
  pushl $0
  1028ca:	6a 00                	push   $0x0
  pushl $252
  1028cc:	68 fc 00 00 00       	push   $0xfc
  jmp __alltraps
  1028d1:	e9 24 00 00 00       	jmp    1028fa <__alltraps>

001028d6 <vector253>:
.globl vector253
vector253:
  pushl $0
  1028d6:	6a 00                	push   $0x0
  pushl $253
  1028d8:	68 fd 00 00 00       	push   $0xfd
  jmp __alltraps
  1028dd:	e9 18 00 00 00       	jmp    1028fa <__alltraps>

001028e2 <vector254>:
.globl vector254
vector254:
  pushl $0
  1028e2:	6a 00                	push   $0x0
  pushl $254
  1028e4:	68 fe 00 00 00       	push   $0xfe
  jmp __alltraps
  1028e9:	e9 0c 00 00 00       	jmp    1028fa <__alltraps>

001028ee <vector255>:
.globl vector255
vector255:
  pushl $0
  1028ee:	6a 00                	push   $0x0
  pushl $255
  1028f0:	68 ff 00 00 00       	push   $0xff
  jmp __alltraps
  1028f5:	e9 00 00 00 00       	jmp    1028fa <__alltraps>

001028fa <__alltraps>:
.text
.globl __alltraps
__alltraps:
    # push registers to build a trap frame
    # therefore make the stack look like a struct trapframe
    pushl %ds
  1028fa:	1e                   	push   %ds
    pushl %es
  1028fb:	06                   	push   %es
    pushl %fs
  1028fc:	0f a0                	push   %fs
    pushl %gs
  1028fe:	0f a8                	push   %gs
    pushal
  102900:	60                   	pusha  

    # load GD_KDATA into %ds and %es to set up data segments for kernel
    movl $GD_KDATA, %eax
  102901:	b8 10 00 00 00       	mov    $0x10,%eax
    movw %ax, %ds
  102906:	8e d8                	mov    %eax,%ds
    movw %ax, %es
  102908:	8e c0                	mov    %eax,%es

    # push %esp to pass a pointer to the trapframe as an argument to trap()
    pushl %esp
  10290a:	54                   	push   %esp

    # call trap(tf), where tf=%esp
    call trap
  10290b:	e8 60 f5 ff ff       	call   101e70 <trap>

    # pop the pushed stack pointer
    popl %esp
  102910:	5c                   	pop    %esp

00102911 <__trapret>:

    # return falls through to trapret...
.globl __trapret
__trapret:
    # restore registers from stack
    popal
  102911:	61                   	popa   

    # restore %ds, %es, %fs and %gs
    popl %gs
  102912:	0f a9                	pop    %gs
    popl %fs
  102914:	0f a1                	pop    %fs
    popl %es
  102916:	07                   	pop    %es
    popl %ds
  102917:	1f                   	pop    %ds

    # get rid of the trap number and error code
    addl $0x8, %esp
  102918:	83 c4 08             	add    $0x8,%esp
    iret
  10291b:	cf                   	iret   

0010291c <lgdt>:
/* *
 * lgdt - load the global descriptor table register and reset the
 * data/code segement registers for kernel.
 * */
static inline void
lgdt(struct pseudodesc *pd) {
  10291c:	55                   	push   %ebp
  10291d:	89 e5                	mov    %esp,%ebp
    asm volatile ("lgdt (%0)" :: "r" (pd));
  10291f:	8b 45 08             	mov    0x8(%ebp),%eax
  102922:	0f 01 10             	lgdtl  (%eax)
    asm volatile ("movw %%ax, %%gs" :: "a" (USER_DS));
  102925:	b8 23 00 00 00       	mov    $0x23,%eax
  10292a:	8e e8                	mov    %eax,%gs
    asm volatile ("movw %%ax, %%fs" :: "a" (USER_DS));
  10292c:	b8 23 00 00 00       	mov    $0x23,%eax
  102931:	8e e0                	mov    %eax,%fs
    asm volatile ("movw %%ax, %%es" :: "a" (KERNEL_DS));
  102933:	b8 10 00 00 00       	mov    $0x10,%eax
  102938:	8e c0                	mov    %eax,%es
    asm volatile ("movw %%ax, %%ds" :: "a" (KERNEL_DS));
  10293a:	b8 10 00 00 00       	mov    $0x10,%eax
  10293f:	8e d8                	mov    %eax,%ds
    asm volatile ("movw %%ax, %%ss" :: "a" (KERNEL_DS));
  102941:	b8 10 00 00 00       	mov    $0x10,%eax
  102946:	8e d0                	mov    %eax,%ss
    // reload cs
    asm volatile ("ljmp %0, $1f\n 1:\n" :: "i" (KERNEL_CS));
  102948:	ea 4f 29 10 00 08 00 	ljmp   $0x8,$0x10294f
}
  10294f:	90                   	nop
  102950:	5d                   	pop    %ebp
  102951:	c3                   	ret    

00102952 <gdt_init>:
/* temporary kernel stack */
uint8_t stack0[1024];

/* gdt_init - initialize the default GDT and TSS */
static void
gdt_init(void) {
  102952:	f3 0f 1e fb          	endbr32 
  102956:	55                   	push   %ebp
  102957:	89 e5                	mov    %esp,%ebp
  102959:	83 ec 14             	sub    $0x14,%esp
    // Setup a TSS so that we can get the right stack when we trap from
    // user to the kernel. But not safe here, it's only a temporary value,
    // it will be set to KSTACKTOP in lab2.
    ts.ts_esp0 = (uint32_t)&stack0 + sizeof(stack0);
  10295c:	b8 20 09 11 00       	mov    $0x110920,%eax
  102961:	05 00 04 00 00       	add    $0x400,%eax
  102966:	a3 a4 08 11 00       	mov    %eax,0x1108a4
    ts.ts_ss0 = KERNEL_DS;
  10296b:	66 c7 05 a8 08 11 00 	movw   $0x10,0x1108a8
  102972:	10 00 

    // initialize the TSS filed of the gdt
    gdt[SEG_TSS] = SEG16(STS_T32A, (uint32_t)&ts, sizeof(ts), DPL_KERNEL);
  102974:	66 c7 05 08 fa 10 00 	movw   $0x68,0x10fa08
  10297b:	68 00 
  10297d:	b8 a0 08 11 00       	mov    $0x1108a0,%eax
  102982:	0f b7 c0             	movzwl %ax,%eax
  102985:	66 a3 0a fa 10 00    	mov    %ax,0x10fa0a
  10298b:	b8 a0 08 11 00       	mov    $0x1108a0,%eax
  102990:	c1 e8 10             	shr    $0x10,%eax
  102993:	a2 0c fa 10 00       	mov    %al,0x10fa0c
  102998:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  10299f:	24 f0                	and    $0xf0,%al
  1029a1:	0c 09                	or     $0x9,%al
  1029a3:	a2 0d fa 10 00       	mov    %al,0x10fa0d
  1029a8:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  1029af:	0c 10                	or     $0x10,%al
  1029b1:	a2 0d fa 10 00       	mov    %al,0x10fa0d
  1029b6:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  1029bd:	24 9f                	and    $0x9f,%al
  1029bf:	a2 0d fa 10 00       	mov    %al,0x10fa0d
  1029c4:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  1029cb:	0c 80                	or     $0x80,%al
  1029cd:	a2 0d fa 10 00       	mov    %al,0x10fa0d
  1029d2:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  1029d9:	24 f0                	and    $0xf0,%al
  1029db:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  1029e0:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  1029e7:	24 ef                	and    $0xef,%al
  1029e9:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  1029ee:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  1029f5:	24 df                	and    $0xdf,%al
  1029f7:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  1029fc:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  102a03:	0c 40                	or     $0x40,%al
  102a05:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  102a0a:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  102a11:	24 7f                	and    $0x7f,%al
  102a13:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  102a18:	b8 a0 08 11 00       	mov    $0x1108a0,%eax
  102a1d:	c1 e8 18             	shr    $0x18,%eax
  102a20:	a2 0f fa 10 00       	mov    %al,0x10fa0f
    gdt[SEG_TSS].sd_s = 0;
  102a25:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  102a2c:	24 ef                	and    $0xef,%al
  102a2e:	a2 0d fa 10 00       	mov    %al,0x10fa0d

    // reload all segment registers
    lgdt(&gdt_pd);
  102a33:	c7 04 24 10 fa 10 00 	movl   $0x10fa10,(%esp)
  102a3a:	e8 dd fe ff ff       	call   10291c <lgdt>
  102a3f:	66 c7 45 fe 28 00    	movw   $0x28,-0x2(%ebp)

static inline void
ltr(uint16_t sel) {
    asm volatile ("ltr %0" :: "r" (sel));
  102a45:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  102a49:	0f 00 d8             	ltr    %ax
}
  102a4c:	90                   	nop

    // load the TSS
    ltr(GD_TSS);
}
  102a4d:	90                   	nop
  102a4e:	c9                   	leave  
  102a4f:	c3                   	ret    

00102a50 <pmm_init>:

/* pmm_init - initialize the physical memory management */
void
pmm_init(void) {
  102a50:	f3 0f 1e fb          	endbr32 
  102a54:	55                   	push   %ebp
  102a55:	89 e5                	mov    %esp,%ebp
    gdt_init();
  102a57:	e8 f6 fe ff ff       	call   102952 <gdt_init>
}
  102a5c:	90                   	nop
  102a5d:	5d                   	pop    %ebp
  102a5e:	c3                   	ret    

00102a5f <strlen>:
 * @s:        the input string
 *
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
  102a5f:	f3 0f 1e fb          	endbr32 
  102a63:	55                   	push   %ebp
  102a64:	89 e5                	mov    %esp,%ebp
  102a66:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  102a69:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (*s ++ != '\0') {
  102a70:	eb 03                	jmp    102a75 <strlen+0x16>
        cnt ++;
  102a72:	ff 45 fc             	incl   -0x4(%ebp)
    while (*s ++ != '\0') {
  102a75:	8b 45 08             	mov    0x8(%ebp),%eax
  102a78:	8d 50 01             	lea    0x1(%eax),%edx
  102a7b:	89 55 08             	mov    %edx,0x8(%ebp)
  102a7e:	0f b6 00             	movzbl (%eax),%eax
  102a81:	84 c0                	test   %al,%al
  102a83:	75 ed                	jne    102a72 <strlen+0x13>
    }
    return cnt;
  102a85:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102a88:	c9                   	leave  
  102a89:	c3                   	ret    

00102a8a <strnlen>:
 * The return value is strlen(s), if that is less than @len, or
 * @len if there is no '\0' character among the first @len characters
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
  102a8a:	f3 0f 1e fb          	endbr32 
  102a8e:	55                   	push   %ebp
  102a8f:	89 e5                	mov    %esp,%ebp
  102a91:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  102a94:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  102a9b:	eb 03                	jmp    102aa0 <strnlen+0x16>
        cnt ++;
  102a9d:	ff 45 fc             	incl   -0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  102aa0:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102aa3:	3b 45 0c             	cmp    0xc(%ebp),%eax
  102aa6:	73 10                	jae    102ab8 <strnlen+0x2e>
  102aa8:	8b 45 08             	mov    0x8(%ebp),%eax
  102aab:	8d 50 01             	lea    0x1(%eax),%edx
  102aae:	89 55 08             	mov    %edx,0x8(%ebp)
  102ab1:	0f b6 00             	movzbl (%eax),%eax
  102ab4:	84 c0                	test   %al,%al
  102ab6:	75 e5                	jne    102a9d <strnlen+0x13>
    }
    return cnt;
  102ab8:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102abb:	c9                   	leave  
  102abc:	c3                   	ret    

00102abd <strcpy>:
 * To avoid overflows, the size of array pointed by @dst should be long enough to
 * contain the same string as @src (including the terminating null character), and
 * should not overlap in memory with @src.
 * */
char *
strcpy(char *dst, const char *src) {
  102abd:	f3 0f 1e fb          	endbr32 
  102ac1:	55                   	push   %ebp
  102ac2:	89 e5                	mov    %esp,%ebp
  102ac4:	57                   	push   %edi
  102ac5:	56                   	push   %esi
  102ac6:	83 ec 20             	sub    $0x20,%esp
  102ac9:	8b 45 08             	mov    0x8(%ebp),%eax
  102acc:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102acf:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ad2:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCPY
#define __HAVE_ARCH_STRCPY
static inline char *
__strcpy(char *dst, const char *src) {
    int d0, d1, d2;
    asm volatile (
  102ad5:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102ad8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102adb:	89 d1                	mov    %edx,%ecx
  102add:	89 c2                	mov    %eax,%edx
  102adf:	89 ce                	mov    %ecx,%esi
  102ae1:	89 d7                	mov    %edx,%edi
  102ae3:	ac                   	lods   %ds:(%esi),%al
  102ae4:	aa                   	stos   %al,%es:(%edi)
  102ae5:	84 c0                	test   %al,%al
  102ae7:	75 fa                	jne    102ae3 <strcpy+0x26>
  102ae9:	89 fa                	mov    %edi,%edx
  102aeb:	89 f1                	mov    %esi,%ecx
  102aed:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  102af0:	89 55 e8             	mov    %edx,-0x18(%ebp)
  102af3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "stosb;"
            "testb %%al, %%al;"
            "jne 1b;"
            : "=&S" (d0), "=&D" (d1), "=&a" (d2)
            : "0" (src), "1" (dst) : "memory");
    return dst;
  102af6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    char *p = dst;
    while ((*p ++ = *src ++) != '\0')
        /* nothing */;
    return dst;
#endif /* __HAVE_ARCH_STRCPY */
}
  102af9:	83 c4 20             	add    $0x20,%esp
  102afc:	5e                   	pop    %esi
  102afd:	5f                   	pop    %edi
  102afe:	5d                   	pop    %ebp
  102aff:	c3                   	ret    

00102b00 <strncpy>:
 * @len:    maximum number of characters to be copied from @src
 *
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
  102b00:	f3 0f 1e fb          	endbr32 
  102b04:	55                   	push   %ebp
  102b05:	89 e5                	mov    %esp,%ebp
  102b07:	83 ec 10             	sub    $0x10,%esp
    char *p = dst;
  102b0a:	8b 45 08             	mov    0x8(%ebp),%eax
  102b0d:	89 45 fc             	mov    %eax,-0x4(%ebp)
    while (len > 0) {
  102b10:	eb 1e                	jmp    102b30 <strncpy+0x30>
        if ((*p = *src) != '\0') {
  102b12:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b15:	0f b6 10             	movzbl (%eax),%edx
  102b18:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102b1b:	88 10                	mov    %dl,(%eax)
  102b1d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102b20:	0f b6 00             	movzbl (%eax),%eax
  102b23:	84 c0                	test   %al,%al
  102b25:	74 03                	je     102b2a <strncpy+0x2a>
            src ++;
  102b27:	ff 45 0c             	incl   0xc(%ebp)
        }
        p ++, len --;
  102b2a:	ff 45 fc             	incl   -0x4(%ebp)
  102b2d:	ff 4d 10             	decl   0x10(%ebp)
    while (len > 0) {
  102b30:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102b34:	75 dc                	jne    102b12 <strncpy+0x12>
    }
    return dst;
  102b36:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102b39:	c9                   	leave  
  102b3a:	c3                   	ret    

00102b3b <strcmp>:
 * - A value greater than zero indicates that the first character that does
 *   not match has a greater value in @s1 than in @s2;
 * - And a value less than zero indicates the opposite.
 * */
int
strcmp(const char *s1, const char *s2) {
  102b3b:	f3 0f 1e fb          	endbr32 
  102b3f:	55                   	push   %ebp
  102b40:	89 e5                	mov    %esp,%ebp
  102b42:	57                   	push   %edi
  102b43:	56                   	push   %esi
  102b44:	83 ec 20             	sub    $0x20,%esp
  102b47:	8b 45 08             	mov    0x8(%ebp),%eax
  102b4a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102b4d:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b50:	89 45 f0             	mov    %eax,-0x10(%ebp)
    asm volatile (
  102b53:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102b56:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102b59:	89 d1                	mov    %edx,%ecx
  102b5b:	89 c2                	mov    %eax,%edx
  102b5d:	89 ce                	mov    %ecx,%esi
  102b5f:	89 d7                	mov    %edx,%edi
  102b61:	ac                   	lods   %ds:(%esi),%al
  102b62:	ae                   	scas   %es:(%edi),%al
  102b63:	75 08                	jne    102b6d <strcmp+0x32>
  102b65:	84 c0                	test   %al,%al
  102b67:	75 f8                	jne    102b61 <strcmp+0x26>
  102b69:	31 c0                	xor    %eax,%eax
  102b6b:	eb 04                	jmp    102b71 <strcmp+0x36>
  102b6d:	19 c0                	sbb    %eax,%eax
  102b6f:	0c 01                	or     $0x1,%al
  102b71:	89 fa                	mov    %edi,%edx
  102b73:	89 f1                	mov    %esi,%ecx
  102b75:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102b78:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  102b7b:	89 55 e4             	mov    %edx,-0x1c(%ebp)
    return ret;
  102b7e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    while (*s1 != '\0' && *s1 == *s2) {
        s1 ++, s2 ++;
    }
    return (int)((unsigned char)*s1 - (unsigned char)*s2);
#endif /* __HAVE_ARCH_STRCMP */
}
  102b81:	83 c4 20             	add    $0x20,%esp
  102b84:	5e                   	pop    %esi
  102b85:	5f                   	pop    %edi
  102b86:	5d                   	pop    %ebp
  102b87:	c3                   	ret    

00102b88 <strncmp>:
 * they are equal to each other, it continues with the following pairs until
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
  102b88:	f3 0f 1e fb          	endbr32 
  102b8c:	55                   	push   %ebp
  102b8d:	89 e5                	mov    %esp,%ebp
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  102b8f:	eb 09                	jmp    102b9a <strncmp+0x12>
        n --, s1 ++, s2 ++;
  102b91:	ff 4d 10             	decl   0x10(%ebp)
  102b94:	ff 45 08             	incl   0x8(%ebp)
  102b97:	ff 45 0c             	incl   0xc(%ebp)
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  102b9a:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102b9e:	74 1a                	je     102bba <strncmp+0x32>
  102ba0:	8b 45 08             	mov    0x8(%ebp),%eax
  102ba3:	0f b6 00             	movzbl (%eax),%eax
  102ba6:	84 c0                	test   %al,%al
  102ba8:	74 10                	je     102bba <strncmp+0x32>
  102baa:	8b 45 08             	mov    0x8(%ebp),%eax
  102bad:	0f b6 10             	movzbl (%eax),%edx
  102bb0:	8b 45 0c             	mov    0xc(%ebp),%eax
  102bb3:	0f b6 00             	movzbl (%eax),%eax
  102bb6:	38 c2                	cmp    %al,%dl
  102bb8:	74 d7                	je     102b91 <strncmp+0x9>
    }
    return (n == 0) ? 0 : (int)((unsigned char)*s1 - (unsigned char)*s2);
  102bba:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102bbe:	74 18                	je     102bd8 <strncmp+0x50>
  102bc0:	8b 45 08             	mov    0x8(%ebp),%eax
  102bc3:	0f b6 00             	movzbl (%eax),%eax
  102bc6:	0f b6 d0             	movzbl %al,%edx
  102bc9:	8b 45 0c             	mov    0xc(%ebp),%eax
  102bcc:	0f b6 00             	movzbl (%eax),%eax
  102bcf:	0f b6 c0             	movzbl %al,%eax
  102bd2:	29 c2                	sub    %eax,%edx
  102bd4:	89 d0                	mov    %edx,%eax
  102bd6:	eb 05                	jmp    102bdd <strncmp+0x55>
  102bd8:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102bdd:	5d                   	pop    %ebp
  102bde:	c3                   	ret    

00102bdf <strchr>:
 *
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
  102bdf:	f3 0f 1e fb          	endbr32 
  102be3:	55                   	push   %ebp
  102be4:	89 e5                	mov    %esp,%ebp
  102be6:	83 ec 04             	sub    $0x4,%esp
  102be9:	8b 45 0c             	mov    0xc(%ebp),%eax
  102bec:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102bef:	eb 13                	jmp    102c04 <strchr+0x25>
        if (*s == c) {
  102bf1:	8b 45 08             	mov    0x8(%ebp),%eax
  102bf4:	0f b6 00             	movzbl (%eax),%eax
  102bf7:	38 45 fc             	cmp    %al,-0x4(%ebp)
  102bfa:	75 05                	jne    102c01 <strchr+0x22>
            return (char *)s;
  102bfc:	8b 45 08             	mov    0x8(%ebp),%eax
  102bff:	eb 12                	jmp    102c13 <strchr+0x34>
        }
        s ++;
  102c01:	ff 45 08             	incl   0x8(%ebp)
    while (*s != '\0') {
  102c04:	8b 45 08             	mov    0x8(%ebp),%eax
  102c07:	0f b6 00             	movzbl (%eax),%eax
  102c0a:	84 c0                	test   %al,%al
  102c0c:	75 e3                	jne    102bf1 <strchr+0x12>
    }
    return NULL;
  102c0e:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102c13:	c9                   	leave  
  102c14:	c3                   	ret    

00102c15 <strfind>:
 * The strfind() function is like strchr() except that if @c is
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
  102c15:	f3 0f 1e fb          	endbr32 
  102c19:	55                   	push   %ebp
  102c1a:	89 e5                	mov    %esp,%ebp
  102c1c:	83 ec 04             	sub    $0x4,%esp
  102c1f:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c22:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102c25:	eb 0e                	jmp    102c35 <strfind+0x20>
        if (*s == c) {
  102c27:	8b 45 08             	mov    0x8(%ebp),%eax
  102c2a:	0f b6 00             	movzbl (%eax),%eax
  102c2d:	38 45 fc             	cmp    %al,-0x4(%ebp)
  102c30:	74 0f                	je     102c41 <strfind+0x2c>
            break;
        }
        s ++;
  102c32:	ff 45 08             	incl   0x8(%ebp)
    while (*s != '\0') {
  102c35:	8b 45 08             	mov    0x8(%ebp),%eax
  102c38:	0f b6 00             	movzbl (%eax),%eax
  102c3b:	84 c0                	test   %al,%al
  102c3d:	75 e8                	jne    102c27 <strfind+0x12>
  102c3f:	eb 01                	jmp    102c42 <strfind+0x2d>
            break;
  102c41:	90                   	nop
    }
    return (char *)s;
  102c42:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102c45:	c9                   	leave  
  102c46:	c3                   	ret    

00102c47 <strtol>:
 * an optional "0x" or "0X" prefix.
 *
 * The strtol() function returns the converted integral number as a long int value.
 * */
long
strtol(const char *s, char **endptr, int base) {
  102c47:	f3 0f 1e fb          	endbr32 
  102c4b:	55                   	push   %ebp
  102c4c:	89 e5                	mov    %esp,%ebp
  102c4e:	83 ec 10             	sub    $0x10,%esp
    int neg = 0;
  102c51:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    long val = 0;
  102c58:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  102c5f:	eb 03                	jmp    102c64 <strtol+0x1d>
        s ++;
  102c61:	ff 45 08             	incl   0x8(%ebp)
    while (*s == ' ' || *s == '\t') {
  102c64:	8b 45 08             	mov    0x8(%ebp),%eax
  102c67:	0f b6 00             	movzbl (%eax),%eax
  102c6a:	3c 20                	cmp    $0x20,%al
  102c6c:	74 f3                	je     102c61 <strtol+0x1a>
  102c6e:	8b 45 08             	mov    0x8(%ebp),%eax
  102c71:	0f b6 00             	movzbl (%eax),%eax
  102c74:	3c 09                	cmp    $0x9,%al
  102c76:	74 e9                	je     102c61 <strtol+0x1a>
    }

    // plus/minus sign
    if (*s == '+') {
  102c78:	8b 45 08             	mov    0x8(%ebp),%eax
  102c7b:	0f b6 00             	movzbl (%eax),%eax
  102c7e:	3c 2b                	cmp    $0x2b,%al
  102c80:	75 05                	jne    102c87 <strtol+0x40>
        s ++;
  102c82:	ff 45 08             	incl   0x8(%ebp)
  102c85:	eb 14                	jmp    102c9b <strtol+0x54>
    }
    else if (*s == '-') {
  102c87:	8b 45 08             	mov    0x8(%ebp),%eax
  102c8a:	0f b6 00             	movzbl (%eax),%eax
  102c8d:	3c 2d                	cmp    $0x2d,%al
  102c8f:	75 0a                	jne    102c9b <strtol+0x54>
        s ++, neg = 1;
  102c91:	ff 45 08             	incl   0x8(%ebp)
  102c94:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
    }

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x')) {
  102c9b:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102c9f:	74 06                	je     102ca7 <strtol+0x60>
  102ca1:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
  102ca5:	75 22                	jne    102cc9 <strtol+0x82>
  102ca7:	8b 45 08             	mov    0x8(%ebp),%eax
  102caa:	0f b6 00             	movzbl (%eax),%eax
  102cad:	3c 30                	cmp    $0x30,%al
  102caf:	75 18                	jne    102cc9 <strtol+0x82>
  102cb1:	8b 45 08             	mov    0x8(%ebp),%eax
  102cb4:	40                   	inc    %eax
  102cb5:	0f b6 00             	movzbl (%eax),%eax
  102cb8:	3c 78                	cmp    $0x78,%al
  102cba:	75 0d                	jne    102cc9 <strtol+0x82>
        s += 2, base = 16;
  102cbc:	83 45 08 02          	addl   $0x2,0x8(%ebp)
  102cc0:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
  102cc7:	eb 29                	jmp    102cf2 <strtol+0xab>
    }
    else if (base == 0 && s[0] == '0') {
  102cc9:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102ccd:	75 16                	jne    102ce5 <strtol+0x9e>
  102ccf:	8b 45 08             	mov    0x8(%ebp),%eax
  102cd2:	0f b6 00             	movzbl (%eax),%eax
  102cd5:	3c 30                	cmp    $0x30,%al
  102cd7:	75 0c                	jne    102ce5 <strtol+0x9e>
        s ++, base = 8;
  102cd9:	ff 45 08             	incl   0x8(%ebp)
  102cdc:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
  102ce3:	eb 0d                	jmp    102cf2 <strtol+0xab>
    }
    else if (base == 0) {
  102ce5:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102ce9:	75 07                	jne    102cf2 <strtol+0xab>
        base = 10;
  102ceb:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9') {
  102cf2:	8b 45 08             	mov    0x8(%ebp),%eax
  102cf5:	0f b6 00             	movzbl (%eax),%eax
  102cf8:	3c 2f                	cmp    $0x2f,%al
  102cfa:	7e 1b                	jle    102d17 <strtol+0xd0>
  102cfc:	8b 45 08             	mov    0x8(%ebp),%eax
  102cff:	0f b6 00             	movzbl (%eax),%eax
  102d02:	3c 39                	cmp    $0x39,%al
  102d04:	7f 11                	jg     102d17 <strtol+0xd0>
            dig = *s - '0';
  102d06:	8b 45 08             	mov    0x8(%ebp),%eax
  102d09:	0f b6 00             	movzbl (%eax),%eax
  102d0c:	0f be c0             	movsbl %al,%eax
  102d0f:	83 e8 30             	sub    $0x30,%eax
  102d12:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102d15:	eb 48                	jmp    102d5f <strtol+0x118>
        }
        else if (*s >= 'a' && *s <= 'z') {
  102d17:	8b 45 08             	mov    0x8(%ebp),%eax
  102d1a:	0f b6 00             	movzbl (%eax),%eax
  102d1d:	3c 60                	cmp    $0x60,%al
  102d1f:	7e 1b                	jle    102d3c <strtol+0xf5>
  102d21:	8b 45 08             	mov    0x8(%ebp),%eax
  102d24:	0f b6 00             	movzbl (%eax),%eax
  102d27:	3c 7a                	cmp    $0x7a,%al
  102d29:	7f 11                	jg     102d3c <strtol+0xf5>
            dig = *s - 'a' + 10;
  102d2b:	8b 45 08             	mov    0x8(%ebp),%eax
  102d2e:	0f b6 00             	movzbl (%eax),%eax
  102d31:	0f be c0             	movsbl %al,%eax
  102d34:	83 e8 57             	sub    $0x57,%eax
  102d37:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102d3a:	eb 23                	jmp    102d5f <strtol+0x118>
        }
        else if (*s >= 'A' && *s <= 'Z') {
  102d3c:	8b 45 08             	mov    0x8(%ebp),%eax
  102d3f:	0f b6 00             	movzbl (%eax),%eax
  102d42:	3c 40                	cmp    $0x40,%al
  102d44:	7e 3b                	jle    102d81 <strtol+0x13a>
  102d46:	8b 45 08             	mov    0x8(%ebp),%eax
  102d49:	0f b6 00             	movzbl (%eax),%eax
  102d4c:	3c 5a                	cmp    $0x5a,%al
  102d4e:	7f 31                	jg     102d81 <strtol+0x13a>
            dig = *s - 'A' + 10;
  102d50:	8b 45 08             	mov    0x8(%ebp),%eax
  102d53:	0f b6 00             	movzbl (%eax),%eax
  102d56:	0f be c0             	movsbl %al,%eax
  102d59:	83 e8 37             	sub    $0x37,%eax
  102d5c:	89 45 f4             	mov    %eax,-0xc(%ebp)
        }
        else {
            break;
        }
        if (dig >= base) {
  102d5f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102d62:	3b 45 10             	cmp    0x10(%ebp),%eax
  102d65:	7d 19                	jge    102d80 <strtol+0x139>
            break;
        }
        s ++, val = (val * base) + dig;
  102d67:	ff 45 08             	incl   0x8(%ebp)
  102d6a:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102d6d:	0f af 45 10          	imul   0x10(%ebp),%eax
  102d71:	89 c2                	mov    %eax,%edx
  102d73:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102d76:	01 d0                	add    %edx,%eax
  102d78:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (1) {
  102d7b:	e9 72 ff ff ff       	jmp    102cf2 <strtol+0xab>
            break;
  102d80:	90                   	nop
        // we don't properly detect overflow!
    }

    if (endptr) {
  102d81:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102d85:	74 08                	je     102d8f <strtol+0x148>
        *endptr = (char *) s;
  102d87:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d8a:	8b 55 08             	mov    0x8(%ebp),%edx
  102d8d:	89 10                	mov    %edx,(%eax)
    }
    return (neg ? -val : val);
  102d8f:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  102d93:	74 07                	je     102d9c <strtol+0x155>
  102d95:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102d98:	f7 d8                	neg    %eax
  102d9a:	eb 03                	jmp    102d9f <strtol+0x158>
  102d9c:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  102d9f:	c9                   	leave  
  102da0:	c3                   	ret    

00102da1 <memset>:
 * @n:        number of bytes to be set to the value
 *
 * The memset() function returns @s.
 * */
void *
memset(void *s, char c, size_t n) {
  102da1:	f3 0f 1e fb          	endbr32 
  102da5:	55                   	push   %ebp
  102da6:	89 e5                	mov    %esp,%ebp
  102da8:	57                   	push   %edi
  102da9:	83 ec 24             	sub    $0x24,%esp
  102dac:	8b 45 0c             	mov    0xc(%ebp),%eax
  102daf:	88 45 d8             	mov    %al,-0x28(%ebp)
#ifdef __HAVE_ARCH_MEMSET
    return __memset(s, c, n);
  102db2:	0f be 55 d8          	movsbl -0x28(%ebp),%edx
  102db6:	8b 45 08             	mov    0x8(%ebp),%eax
  102db9:	89 45 f8             	mov    %eax,-0x8(%ebp)
  102dbc:	88 55 f7             	mov    %dl,-0x9(%ebp)
  102dbf:	8b 45 10             	mov    0x10(%ebp),%eax
  102dc2:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_MEMSET
#define __HAVE_ARCH_MEMSET
static inline void *
__memset(void *s, char c, size_t n) {
    int d0, d1;
    asm volatile (
  102dc5:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  102dc8:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  102dcc:	8b 55 f8             	mov    -0x8(%ebp),%edx
  102dcf:	89 d7                	mov    %edx,%edi
  102dd1:	f3 aa                	rep stos %al,%es:(%edi)
  102dd3:	89 fa                	mov    %edi,%edx
  102dd5:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  102dd8:	89 55 e8             	mov    %edx,-0x18(%ebp)
            "rep; stosb;"
            : "=&c" (d0), "=&D" (d1)
            : "0" (n), "a" (c), "1" (s)
            : "memory");
    return s;
  102ddb:	8b 45 f8             	mov    -0x8(%ebp),%eax
    while (n -- > 0) {
        *p ++ = c;
    }
    return s;
#endif /* __HAVE_ARCH_MEMSET */
}
  102dde:	83 c4 24             	add    $0x24,%esp
  102de1:	5f                   	pop    %edi
  102de2:	5d                   	pop    %ebp
  102de3:	c3                   	ret    

00102de4 <memmove>:
 * @n:        number of bytes to copy
 *
 * The memmove() function returns @dst.
 * */
void *
memmove(void *dst, const void *src, size_t n) {
  102de4:	f3 0f 1e fb          	endbr32 
  102de8:	55                   	push   %ebp
  102de9:	89 e5                	mov    %esp,%ebp
  102deb:	57                   	push   %edi
  102dec:	56                   	push   %esi
  102ded:	53                   	push   %ebx
  102dee:	83 ec 30             	sub    $0x30,%esp
  102df1:	8b 45 08             	mov    0x8(%ebp),%eax
  102df4:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102df7:	8b 45 0c             	mov    0xc(%ebp),%eax
  102dfa:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102dfd:	8b 45 10             	mov    0x10(%ebp),%eax
  102e00:	89 45 e8             	mov    %eax,-0x18(%ebp)

#ifndef __HAVE_ARCH_MEMMOVE
#define __HAVE_ARCH_MEMMOVE
static inline void *
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
  102e03:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102e06:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  102e09:	73 42                	jae    102e4d <memmove+0x69>
  102e0b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102e0e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102e11:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102e14:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102e17:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102e1a:	89 45 dc             	mov    %eax,-0x24(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  102e1d:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102e20:	c1 e8 02             	shr    $0x2,%eax
  102e23:	89 c1                	mov    %eax,%ecx
    asm volatile (
  102e25:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  102e28:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102e2b:	89 d7                	mov    %edx,%edi
  102e2d:	89 c6                	mov    %eax,%esi
  102e2f:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  102e31:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  102e34:	83 e1 03             	and    $0x3,%ecx
  102e37:	74 02                	je     102e3b <memmove+0x57>
  102e39:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102e3b:	89 f0                	mov    %esi,%eax
  102e3d:	89 fa                	mov    %edi,%edx
  102e3f:	89 4d d8             	mov    %ecx,-0x28(%ebp)
  102e42:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  102e45:	89 45 d0             	mov    %eax,-0x30(%ebp)
            : "memory");
    return dst;
  102e48:	8b 45 e4             	mov    -0x1c(%ebp),%eax
        return __memcpy(dst, src, n);
  102e4b:	eb 36                	jmp    102e83 <memmove+0x9f>
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
  102e4d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102e50:	8d 50 ff             	lea    -0x1(%eax),%edx
  102e53:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102e56:	01 c2                	add    %eax,%edx
  102e58:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102e5b:	8d 48 ff             	lea    -0x1(%eax),%ecx
  102e5e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102e61:	8d 1c 01             	lea    (%ecx,%eax,1),%ebx
    asm volatile (
  102e64:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102e67:	89 c1                	mov    %eax,%ecx
  102e69:	89 d8                	mov    %ebx,%eax
  102e6b:	89 d6                	mov    %edx,%esi
  102e6d:	89 c7                	mov    %eax,%edi
  102e6f:	fd                   	std    
  102e70:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102e72:	fc                   	cld    
  102e73:	89 f8                	mov    %edi,%eax
  102e75:	89 f2                	mov    %esi,%edx
  102e77:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  102e7a:	89 55 c8             	mov    %edx,-0x38(%ebp)
  102e7d:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    return dst;
  102e80:	8b 45 f0             	mov    -0x10(%ebp),%eax
            *d ++ = *s ++;
        }
    }
    return dst;
#endif /* __HAVE_ARCH_MEMMOVE */
}
  102e83:	83 c4 30             	add    $0x30,%esp
  102e86:	5b                   	pop    %ebx
  102e87:	5e                   	pop    %esi
  102e88:	5f                   	pop    %edi
  102e89:	5d                   	pop    %ebp
  102e8a:	c3                   	ret    

00102e8b <memcpy>:
 * it always copies exactly @n bytes. To avoid overflows, the size of arrays pointed
 * by both @src and @dst, should be at least @n bytes, and should not overlap
 * (for overlapping memory area, memmove is a safer approach).
 * */
void *
memcpy(void *dst, const void *src, size_t n) {
  102e8b:	f3 0f 1e fb          	endbr32 
  102e8f:	55                   	push   %ebp
  102e90:	89 e5                	mov    %esp,%ebp
  102e92:	57                   	push   %edi
  102e93:	56                   	push   %esi
  102e94:	83 ec 20             	sub    $0x20,%esp
  102e97:	8b 45 08             	mov    0x8(%ebp),%eax
  102e9a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102e9d:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ea0:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102ea3:	8b 45 10             	mov    0x10(%ebp),%eax
  102ea6:	89 45 ec             	mov    %eax,-0x14(%ebp)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  102ea9:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102eac:	c1 e8 02             	shr    $0x2,%eax
  102eaf:	89 c1                	mov    %eax,%ecx
    asm volatile (
  102eb1:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102eb4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102eb7:	89 d7                	mov    %edx,%edi
  102eb9:	89 c6                	mov    %eax,%esi
  102ebb:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  102ebd:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  102ec0:	83 e1 03             	and    $0x3,%ecx
  102ec3:	74 02                	je     102ec7 <memcpy+0x3c>
  102ec5:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102ec7:	89 f0                	mov    %esi,%eax
  102ec9:	89 fa                	mov    %edi,%edx
  102ecb:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  102ece:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  102ed1:	89 45 e0             	mov    %eax,-0x20(%ebp)
    return dst;
  102ed4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    while (n -- > 0) {
        *d ++ = *s ++;
    }
    return dst;
#endif /* __HAVE_ARCH_MEMCPY */
}
  102ed7:	83 c4 20             	add    $0x20,%esp
  102eda:	5e                   	pop    %esi
  102edb:	5f                   	pop    %edi
  102edc:	5d                   	pop    %ebp
  102edd:	c3                   	ret    

00102ede <memcmp>:
 *   match in both memory blocks has a greater value in @v1 than in @v2
 *   as if evaluated as unsigned char values;
 * - And a value less than zero indicates the opposite.
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
  102ede:	f3 0f 1e fb          	endbr32 
  102ee2:	55                   	push   %ebp
  102ee3:	89 e5                	mov    %esp,%ebp
  102ee5:	83 ec 10             	sub    $0x10,%esp
    const char *s1 = (const char *)v1;
  102ee8:	8b 45 08             	mov    0x8(%ebp),%eax
  102eeb:	89 45 fc             	mov    %eax,-0x4(%ebp)
    const char *s2 = (const char *)v2;
  102eee:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ef1:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (n -- > 0) {
  102ef4:	eb 2e                	jmp    102f24 <memcmp+0x46>
        if (*s1 != *s2) {
  102ef6:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102ef9:	0f b6 10             	movzbl (%eax),%edx
  102efc:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102eff:	0f b6 00             	movzbl (%eax),%eax
  102f02:	38 c2                	cmp    %al,%dl
  102f04:	74 18                	je     102f1e <memcmp+0x40>
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
  102f06:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102f09:	0f b6 00             	movzbl (%eax),%eax
  102f0c:	0f b6 d0             	movzbl %al,%edx
  102f0f:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102f12:	0f b6 00             	movzbl (%eax),%eax
  102f15:	0f b6 c0             	movzbl %al,%eax
  102f18:	29 c2                	sub    %eax,%edx
  102f1a:	89 d0                	mov    %edx,%eax
  102f1c:	eb 18                	jmp    102f36 <memcmp+0x58>
        }
        s1 ++, s2 ++;
  102f1e:	ff 45 fc             	incl   -0x4(%ebp)
  102f21:	ff 45 f8             	incl   -0x8(%ebp)
    while (n -- > 0) {
  102f24:	8b 45 10             	mov    0x10(%ebp),%eax
  102f27:	8d 50 ff             	lea    -0x1(%eax),%edx
  102f2a:	89 55 10             	mov    %edx,0x10(%ebp)
  102f2d:	85 c0                	test   %eax,%eax
  102f2f:	75 c5                	jne    102ef6 <memcmp+0x18>
    }
    return 0;
  102f31:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102f36:	c9                   	leave  
  102f37:	c3                   	ret    

00102f38 <printnum>:
 * @width:         maximum number of digits, if the actual width is less than @width, use @padc instead
 * @padc:        character that padded on the left if the actual width is less than @width
 * */
static void
printnum(void (*putch)(int, void*), void *putdat,
        unsigned long long num, unsigned base, int width, int padc) {
  102f38:	f3 0f 1e fb          	endbr32 
  102f3c:	55                   	push   %ebp
  102f3d:	89 e5                	mov    %esp,%ebp
  102f3f:	83 ec 58             	sub    $0x58,%esp
  102f42:	8b 45 10             	mov    0x10(%ebp),%eax
  102f45:	89 45 d0             	mov    %eax,-0x30(%ebp)
  102f48:	8b 45 14             	mov    0x14(%ebp),%eax
  102f4b:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    unsigned long long result = num;
  102f4e:	8b 45 d0             	mov    -0x30(%ebp),%eax
  102f51:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  102f54:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102f57:	89 55 ec             	mov    %edx,-0x14(%ebp)
    unsigned mod = do_div(result, base);
  102f5a:	8b 45 18             	mov    0x18(%ebp),%eax
  102f5d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102f60:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102f63:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102f66:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102f69:	89 55 f0             	mov    %edx,-0x10(%ebp)
  102f6c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102f6f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102f72:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  102f76:	74 1c                	je     102f94 <printnum+0x5c>
  102f78:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102f7b:	ba 00 00 00 00       	mov    $0x0,%edx
  102f80:	f7 75 e4             	divl   -0x1c(%ebp)
  102f83:	89 55 f4             	mov    %edx,-0xc(%ebp)
  102f86:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102f89:	ba 00 00 00 00       	mov    $0x0,%edx
  102f8e:	f7 75 e4             	divl   -0x1c(%ebp)
  102f91:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102f94:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102f97:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102f9a:	f7 75 e4             	divl   -0x1c(%ebp)
  102f9d:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102fa0:	89 55 dc             	mov    %edx,-0x24(%ebp)
  102fa3:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102fa6:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102fa9:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102fac:	89 55 ec             	mov    %edx,-0x14(%ebp)
  102faf:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102fb2:	89 45 d8             	mov    %eax,-0x28(%ebp)

    // first recursively print all preceding (more significant) digits
    if (num >= base) {
  102fb5:	8b 45 18             	mov    0x18(%ebp),%eax
  102fb8:	ba 00 00 00 00       	mov    $0x0,%edx
  102fbd:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
  102fc0:	39 45 d0             	cmp    %eax,-0x30(%ebp)
  102fc3:	19 d1                	sbb    %edx,%ecx
  102fc5:	72 4c                	jb     103013 <printnum+0xdb>
        printnum(putch, putdat, result, base, width - 1, padc);
  102fc7:	8b 45 1c             	mov    0x1c(%ebp),%eax
  102fca:	8d 50 ff             	lea    -0x1(%eax),%edx
  102fcd:	8b 45 20             	mov    0x20(%ebp),%eax
  102fd0:	89 44 24 18          	mov    %eax,0x18(%esp)
  102fd4:	89 54 24 14          	mov    %edx,0x14(%esp)
  102fd8:	8b 45 18             	mov    0x18(%ebp),%eax
  102fdb:	89 44 24 10          	mov    %eax,0x10(%esp)
  102fdf:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102fe2:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102fe5:	89 44 24 08          	mov    %eax,0x8(%esp)
  102fe9:	89 54 24 0c          	mov    %edx,0xc(%esp)
  102fed:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ff0:	89 44 24 04          	mov    %eax,0x4(%esp)
  102ff4:	8b 45 08             	mov    0x8(%ebp),%eax
  102ff7:	89 04 24             	mov    %eax,(%esp)
  102ffa:	e8 39 ff ff ff       	call   102f38 <printnum>
  102fff:	eb 1b                	jmp    10301c <printnum+0xe4>
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
            putch(padc, putdat);
  103001:	8b 45 0c             	mov    0xc(%ebp),%eax
  103004:	89 44 24 04          	mov    %eax,0x4(%esp)
  103008:	8b 45 20             	mov    0x20(%ebp),%eax
  10300b:	89 04 24             	mov    %eax,(%esp)
  10300e:	8b 45 08             	mov    0x8(%ebp),%eax
  103011:	ff d0                	call   *%eax
        while (-- width > 0)
  103013:	ff 4d 1c             	decl   0x1c(%ebp)
  103016:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
  10301a:	7f e5                	jg     103001 <printnum+0xc9>
    }
    // then print this (the least significant) digit
    putch("0123456789abcdef"[mod], putdat);
  10301c:	8b 45 d8             	mov    -0x28(%ebp),%eax
  10301f:	05 70 3d 10 00       	add    $0x103d70,%eax
  103024:	0f b6 00             	movzbl (%eax),%eax
  103027:	0f be c0             	movsbl %al,%eax
  10302a:	8b 55 0c             	mov    0xc(%ebp),%edx
  10302d:	89 54 24 04          	mov    %edx,0x4(%esp)
  103031:	89 04 24             	mov    %eax,(%esp)
  103034:	8b 45 08             	mov    0x8(%ebp),%eax
  103037:	ff d0                	call   *%eax
}
  103039:	90                   	nop
  10303a:	c9                   	leave  
  10303b:	c3                   	ret    

0010303c <getuint>:
 * getuint - get an unsigned int of various possible sizes from a varargs list
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static unsigned long long
getuint(va_list *ap, int lflag) {
  10303c:	f3 0f 1e fb          	endbr32 
  103040:	55                   	push   %ebp
  103041:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  103043:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  103047:	7e 14                	jle    10305d <getuint+0x21>
        return va_arg(*ap, unsigned long long);
  103049:	8b 45 08             	mov    0x8(%ebp),%eax
  10304c:	8b 00                	mov    (%eax),%eax
  10304e:	8d 48 08             	lea    0x8(%eax),%ecx
  103051:	8b 55 08             	mov    0x8(%ebp),%edx
  103054:	89 0a                	mov    %ecx,(%edx)
  103056:	8b 50 04             	mov    0x4(%eax),%edx
  103059:	8b 00                	mov    (%eax),%eax
  10305b:	eb 30                	jmp    10308d <getuint+0x51>
    }
    else if (lflag) {
  10305d:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  103061:	74 16                	je     103079 <getuint+0x3d>
        return va_arg(*ap, unsigned long);
  103063:	8b 45 08             	mov    0x8(%ebp),%eax
  103066:	8b 00                	mov    (%eax),%eax
  103068:	8d 48 04             	lea    0x4(%eax),%ecx
  10306b:	8b 55 08             	mov    0x8(%ebp),%edx
  10306e:	89 0a                	mov    %ecx,(%edx)
  103070:	8b 00                	mov    (%eax),%eax
  103072:	ba 00 00 00 00       	mov    $0x0,%edx
  103077:	eb 14                	jmp    10308d <getuint+0x51>
    }
    else {
        return va_arg(*ap, unsigned int);
  103079:	8b 45 08             	mov    0x8(%ebp),%eax
  10307c:	8b 00                	mov    (%eax),%eax
  10307e:	8d 48 04             	lea    0x4(%eax),%ecx
  103081:	8b 55 08             	mov    0x8(%ebp),%edx
  103084:	89 0a                	mov    %ecx,(%edx)
  103086:	8b 00                	mov    (%eax),%eax
  103088:	ba 00 00 00 00       	mov    $0x0,%edx
    }
}
  10308d:	5d                   	pop    %ebp
  10308e:	c3                   	ret    

0010308f <getint>:
 * getint - same as getuint but signed, we can't use getuint because of sign extension
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static long long
getint(va_list *ap, int lflag) {
  10308f:	f3 0f 1e fb          	endbr32 
  103093:	55                   	push   %ebp
  103094:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  103096:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  10309a:	7e 14                	jle    1030b0 <getint+0x21>
        return va_arg(*ap, long long);
  10309c:	8b 45 08             	mov    0x8(%ebp),%eax
  10309f:	8b 00                	mov    (%eax),%eax
  1030a1:	8d 48 08             	lea    0x8(%eax),%ecx
  1030a4:	8b 55 08             	mov    0x8(%ebp),%edx
  1030a7:	89 0a                	mov    %ecx,(%edx)
  1030a9:	8b 50 04             	mov    0x4(%eax),%edx
  1030ac:	8b 00                	mov    (%eax),%eax
  1030ae:	eb 28                	jmp    1030d8 <getint+0x49>
    }
    else if (lflag) {
  1030b0:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  1030b4:	74 12                	je     1030c8 <getint+0x39>
        return va_arg(*ap, long);
  1030b6:	8b 45 08             	mov    0x8(%ebp),%eax
  1030b9:	8b 00                	mov    (%eax),%eax
  1030bb:	8d 48 04             	lea    0x4(%eax),%ecx
  1030be:	8b 55 08             	mov    0x8(%ebp),%edx
  1030c1:	89 0a                	mov    %ecx,(%edx)
  1030c3:	8b 00                	mov    (%eax),%eax
  1030c5:	99                   	cltd   
  1030c6:	eb 10                	jmp    1030d8 <getint+0x49>
    }
    else {
        return va_arg(*ap, int);
  1030c8:	8b 45 08             	mov    0x8(%ebp),%eax
  1030cb:	8b 00                	mov    (%eax),%eax
  1030cd:	8d 48 04             	lea    0x4(%eax),%ecx
  1030d0:	8b 55 08             	mov    0x8(%ebp),%edx
  1030d3:	89 0a                	mov    %ecx,(%edx)
  1030d5:	8b 00                	mov    (%eax),%eax
  1030d7:	99                   	cltd   
    }
}
  1030d8:	5d                   	pop    %ebp
  1030d9:	c3                   	ret    

001030da <printfmt>:
 * @putch:        specified putch function, print a single character
 * @putdat:        used by @putch function
 * @fmt:        the format string to use
 * */
void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
  1030da:	f3 0f 1e fb          	endbr32 
  1030de:	55                   	push   %ebp
  1030df:	89 e5                	mov    %esp,%ebp
  1030e1:	83 ec 28             	sub    $0x28,%esp
    va_list ap;

    va_start(ap, fmt);
  1030e4:	8d 45 14             	lea    0x14(%ebp),%eax
  1030e7:	89 45 f4             	mov    %eax,-0xc(%ebp)
    vprintfmt(putch, putdat, fmt, ap);
  1030ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1030ed:	89 44 24 0c          	mov    %eax,0xc(%esp)
  1030f1:	8b 45 10             	mov    0x10(%ebp),%eax
  1030f4:	89 44 24 08          	mov    %eax,0x8(%esp)
  1030f8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1030fb:	89 44 24 04          	mov    %eax,0x4(%esp)
  1030ff:	8b 45 08             	mov    0x8(%ebp),%eax
  103102:	89 04 24             	mov    %eax,(%esp)
  103105:	e8 03 00 00 00       	call   10310d <vprintfmt>
    va_end(ap);
}
  10310a:	90                   	nop
  10310b:	c9                   	leave  
  10310c:	c3                   	ret    

0010310d <vprintfmt>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want printfmt() instead.
 * */
void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap) {
  10310d:	f3 0f 1e fb          	endbr32 
  103111:	55                   	push   %ebp
  103112:	89 e5                	mov    %esp,%ebp
  103114:	56                   	push   %esi
  103115:	53                   	push   %ebx
  103116:	83 ec 40             	sub    $0x40,%esp
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  103119:	eb 17                	jmp    103132 <vprintfmt+0x25>
            if (ch == '\0') {
  10311b:	85 db                	test   %ebx,%ebx
  10311d:	0f 84 c0 03 00 00    	je     1034e3 <vprintfmt+0x3d6>
                return;
            }
            putch(ch, putdat);
  103123:	8b 45 0c             	mov    0xc(%ebp),%eax
  103126:	89 44 24 04          	mov    %eax,0x4(%esp)
  10312a:	89 1c 24             	mov    %ebx,(%esp)
  10312d:	8b 45 08             	mov    0x8(%ebp),%eax
  103130:	ff d0                	call   *%eax
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  103132:	8b 45 10             	mov    0x10(%ebp),%eax
  103135:	8d 50 01             	lea    0x1(%eax),%edx
  103138:	89 55 10             	mov    %edx,0x10(%ebp)
  10313b:	0f b6 00             	movzbl (%eax),%eax
  10313e:	0f b6 d8             	movzbl %al,%ebx
  103141:	83 fb 25             	cmp    $0x25,%ebx
  103144:	75 d5                	jne    10311b <vprintfmt+0xe>
        }

        // Process a %-escape sequence
        char padc = ' ';
  103146:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
        width = precision = -1;
  10314a:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
  103151:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  103154:	89 45 e8             	mov    %eax,-0x18(%ebp)
        lflag = altflag = 0;
  103157:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  10315e:	8b 45 dc             	mov    -0x24(%ebp),%eax
  103161:	89 45 e0             	mov    %eax,-0x20(%ebp)

    reswitch:
        switch (ch = *(unsigned char *)fmt ++) {
  103164:	8b 45 10             	mov    0x10(%ebp),%eax
  103167:	8d 50 01             	lea    0x1(%eax),%edx
  10316a:	89 55 10             	mov    %edx,0x10(%ebp)
  10316d:	0f b6 00             	movzbl (%eax),%eax
  103170:	0f b6 d8             	movzbl %al,%ebx
  103173:	8d 43 dd             	lea    -0x23(%ebx),%eax
  103176:	83 f8 55             	cmp    $0x55,%eax
  103179:	0f 87 38 03 00 00    	ja     1034b7 <vprintfmt+0x3aa>
  10317f:	8b 04 85 94 3d 10 00 	mov    0x103d94(,%eax,4),%eax
  103186:	3e ff e0             	notrack jmp *%eax

        // flag to pad on the right
        case '-':
            padc = '-';
  103189:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
            goto reswitch;
  10318d:	eb d5                	jmp    103164 <vprintfmt+0x57>

        // flag to pad with 0's instead of spaces
        case '0':
            padc = '0';
  10318f:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
            goto reswitch;
  103193:	eb cf                	jmp    103164 <vprintfmt+0x57>

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  103195:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
                precision = precision * 10 + ch - '0';
  10319c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  10319f:	89 d0                	mov    %edx,%eax
  1031a1:	c1 e0 02             	shl    $0x2,%eax
  1031a4:	01 d0                	add    %edx,%eax
  1031a6:	01 c0                	add    %eax,%eax
  1031a8:	01 d8                	add    %ebx,%eax
  1031aa:	83 e8 30             	sub    $0x30,%eax
  1031ad:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                ch = *fmt;
  1031b0:	8b 45 10             	mov    0x10(%ebp),%eax
  1031b3:	0f b6 00             	movzbl (%eax),%eax
  1031b6:	0f be d8             	movsbl %al,%ebx
                if (ch < '0' || ch > '9') {
  1031b9:	83 fb 2f             	cmp    $0x2f,%ebx
  1031bc:	7e 38                	jle    1031f6 <vprintfmt+0xe9>
  1031be:	83 fb 39             	cmp    $0x39,%ebx
  1031c1:	7f 33                	jg     1031f6 <vprintfmt+0xe9>
            for (precision = 0; ; ++ fmt) {
  1031c3:	ff 45 10             	incl   0x10(%ebp)
                precision = precision * 10 + ch - '0';
  1031c6:	eb d4                	jmp    10319c <vprintfmt+0x8f>
                }
            }
            goto process_precision;

        case '*':
            precision = va_arg(ap, int);
  1031c8:	8b 45 14             	mov    0x14(%ebp),%eax
  1031cb:	8d 50 04             	lea    0x4(%eax),%edx
  1031ce:	89 55 14             	mov    %edx,0x14(%ebp)
  1031d1:	8b 00                	mov    (%eax),%eax
  1031d3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            goto process_precision;
  1031d6:	eb 1f                	jmp    1031f7 <vprintfmt+0xea>

        case '.':
            if (width < 0)
  1031d8:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  1031dc:	79 86                	jns    103164 <vprintfmt+0x57>
                width = 0;
  1031de:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
            goto reswitch;
  1031e5:	e9 7a ff ff ff       	jmp    103164 <vprintfmt+0x57>

        case '#':
            altflag = 1;
  1031ea:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
            goto reswitch;
  1031f1:	e9 6e ff ff ff       	jmp    103164 <vprintfmt+0x57>
            goto process_precision;
  1031f6:	90                   	nop

        process_precision:
            if (width < 0)
  1031f7:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  1031fb:	0f 89 63 ff ff ff    	jns    103164 <vprintfmt+0x57>
                width = precision, precision = -1;
  103201:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  103204:	89 45 e8             	mov    %eax,-0x18(%ebp)
  103207:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
            goto reswitch;
  10320e:	e9 51 ff ff ff       	jmp    103164 <vprintfmt+0x57>

        // long flag (doubled for long long)
        case 'l':
            lflag ++;
  103213:	ff 45 e0             	incl   -0x20(%ebp)
            goto reswitch;
  103216:	e9 49 ff ff ff       	jmp    103164 <vprintfmt+0x57>

        // character
        case 'c':
            putch(va_arg(ap, int), putdat);
  10321b:	8b 45 14             	mov    0x14(%ebp),%eax
  10321e:	8d 50 04             	lea    0x4(%eax),%edx
  103221:	89 55 14             	mov    %edx,0x14(%ebp)
  103224:	8b 00                	mov    (%eax),%eax
  103226:	8b 55 0c             	mov    0xc(%ebp),%edx
  103229:	89 54 24 04          	mov    %edx,0x4(%esp)
  10322d:	89 04 24             	mov    %eax,(%esp)
  103230:	8b 45 08             	mov    0x8(%ebp),%eax
  103233:	ff d0                	call   *%eax
            break;
  103235:	e9 a4 02 00 00       	jmp    1034de <vprintfmt+0x3d1>

        // error message
        case 'e':
            err = va_arg(ap, int);
  10323a:	8b 45 14             	mov    0x14(%ebp),%eax
  10323d:	8d 50 04             	lea    0x4(%eax),%edx
  103240:	89 55 14             	mov    %edx,0x14(%ebp)
  103243:	8b 18                	mov    (%eax),%ebx
            if (err < 0) {
  103245:	85 db                	test   %ebx,%ebx
  103247:	79 02                	jns    10324b <vprintfmt+0x13e>
                err = -err;
  103249:	f7 db                	neg    %ebx
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
  10324b:	83 fb 06             	cmp    $0x6,%ebx
  10324e:	7f 0b                	jg     10325b <vprintfmt+0x14e>
  103250:	8b 34 9d 54 3d 10 00 	mov    0x103d54(,%ebx,4),%esi
  103257:	85 f6                	test   %esi,%esi
  103259:	75 23                	jne    10327e <vprintfmt+0x171>
                printfmt(putch, putdat, "error %d", err);
  10325b:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  10325f:	c7 44 24 08 81 3d 10 	movl   $0x103d81,0x8(%esp)
  103266:	00 
  103267:	8b 45 0c             	mov    0xc(%ebp),%eax
  10326a:	89 44 24 04          	mov    %eax,0x4(%esp)
  10326e:	8b 45 08             	mov    0x8(%ebp),%eax
  103271:	89 04 24             	mov    %eax,(%esp)
  103274:	e8 61 fe ff ff       	call   1030da <printfmt>
            }
            else {
                printfmt(putch, putdat, "%s", p);
            }
            break;
  103279:	e9 60 02 00 00       	jmp    1034de <vprintfmt+0x3d1>
                printfmt(putch, putdat, "%s", p);
  10327e:	89 74 24 0c          	mov    %esi,0xc(%esp)
  103282:	c7 44 24 08 8a 3d 10 	movl   $0x103d8a,0x8(%esp)
  103289:	00 
  10328a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10328d:	89 44 24 04          	mov    %eax,0x4(%esp)
  103291:	8b 45 08             	mov    0x8(%ebp),%eax
  103294:	89 04 24             	mov    %eax,(%esp)
  103297:	e8 3e fe ff ff       	call   1030da <printfmt>
            break;
  10329c:	e9 3d 02 00 00       	jmp    1034de <vprintfmt+0x3d1>

        // string
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
  1032a1:	8b 45 14             	mov    0x14(%ebp),%eax
  1032a4:	8d 50 04             	lea    0x4(%eax),%edx
  1032a7:	89 55 14             	mov    %edx,0x14(%ebp)
  1032aa:	8b 30                	mov    (%eax),%esi
  1032ac:	85 f6                	test   %esi,%esi
  1032ae:	75 05                	jne    1032b5 <vprintfmt+0x1a8>
                p = "(null)";
  1032b0:	be 8d 3d 10 00       	mov    $0x103d8d,%esi
            }
            if (width > 0 && padc != '-') {
  1032b5:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  1032b9:	7e 76                	jle    103331 <vprintfmt+0x224>
  1032bb:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
  1032bf:	74 70                	je     103331 <vprintfmt+0x224>
                for (width -= strnlen(p, precision); width > 0; width --) {
  1032c1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1032c4:	89 44 24 04          	mov    %eax,0x4(%esp)
  1032c8:	89 34 24             	mov    %esi,(%esp)
  1032cb:	e8 ba f7 ff ff       	call   102a8a <strnlen>
  1032d0:	8b 55 e8             	mov    -0x18(%ebp),%edx
  1032d3:	29 c2                	sub    %eax,%edx
  1032d5:	89 d0                	mov    %edx,%eax
  1032d7:	89 45 e8             	mov    %eax,-0x18(%ebp)
  1032da:	eb 16                	jmp    1032f2 <vprintfmt+0x1e5>
                    putch(padc, putdat);
  1032dc:	0f be 45 db          	movsbl -0x25(%ebp),%eax
  1032e0:	8b 55 0c             	mov    0xc(%ebp),%edx
  1032e3:	89 54 24 04          	mov    %edx,0x4(%esp)
  1032e7:	89 04 24             	mov    %eax,(%esp)
  1032ea:	8b 45 08             	mov    0x8(%ebp),%eax
  1032ed:	ff d0                	call   *%eax
                for (width -= strnlen(p, precision); width > 0; width --) {
  1032ef:	ff 4d e8             	decl   -0x18(%ebp)
  1032f2:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  1032f6:	7f e4                	jg     1032dc <vprintfmt+0x1cf>
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  1032f8:	eb 37                	jmp    103331 <vprintfmt+0x224>
                if (altflag && (ch < ' ' || ch > '~')) {
  1032fa:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  1032fe:	74 1f                	je     10331f <vprintfmt+0x212>
  103300:	83 fb 1f             	cmp    $0x1f,%ebx
  103303:	7e 05                	jle    10330a <vprintfmt+0x1fd>
  103305:	83 fb 7e             	cmp    $0x7e,%ebx
  103308:	7e 15                	jle    10331f <vprintfmt+0x212>
                    putch('?', putdat);
  10330a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10330d:	89 44 24 04          	mov    %eax,0x4(%esp)
  103311:	c7 04 24 3f 00 00 00 	movl   $0x3f,(%esp)
  103318:	8b 45 08             	mov    0x8(%ebp),%eax
  10331b:	ff d0                	call   *%eax
  10331d:	eb 0f                	jmp    10332e <vprintfmt+0x221>
                }
                else {
                    putch(ch, putdat);
  10331f:	8b 45 0c             	mov    0xc(%ebp),%eax
  103322:	89 44 24 04          	mov    %eax,0x4(%esp)
  103326:	89 1c 24             	mov    %ebx,(%esp)
  103329:	8b 45 08             	mov    0x8(%ebp),%eax
  10332c:	ff d0                	call   *%eax
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  10332e:	ff 4d e8             	decl   -0x18(%ebp)
  103331:	89 f0                	mov    %esi,%eax
  103333:	8d 70 01             	lea    0x1(%eax),%esi
  103336:	0f b6 00             	movzbl (%eax),%eax
  103339:	0f be d8             	movsbl %al,%ebx
  10333c:	85 db                	test   %ebx,%ebx
  10333e:	74 27                	je     103367 <vprintfmt+0x25a>
  103340:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  103344:	78 b4                	js     1032fa <vprintfmt+0x1ed>
  103346:	ff 4d e4             	decl   -0x1c(%ebp)
  103349:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  10334d:	79 ab                	jns    1032fa <vprintfmt+0x1ed>
                }
            }
            for (; width > 0; width --) {
  10334f:	eb 16                	jmp    103367 <vprintfmt+0x25a>
                putch(' ', putdat);
  103351:	8b 45 0c             	mov    0xc(%ebp),%eax
  103354:	89 44 24 04          	mov    %eax,0x4(%esp)
  103358:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  10335f:	8b 45 08             	mov    0x8(%ebp),%eax
  103362:	ff d0                	call   *%eax
            for (; width > 0; width --) {
  103364:	ff 4d e8             	decl   -0x18(%ebp)
  103367:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  10336b:	7f e4                	jg     103351 <vprintfmt+0x244>
            }
            break;
  10336d:	e9 6c 01 00 00       	jmp    1034de <vprintfmt+0x3d1>

        // (signed) decimal
        case 'd':
            num = getint(&ap, lflag);
  103372:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103375:	89 44 24 04          	mov    %eax,0x4(%esp)
  103379:	8d 45 14             	lea    0x14(%ebp),%eax
  10337c:	89 04 24             	mov    %eax,(%esp)
  10337f:	e8 0b fd ff ff       	call   10308f <getint>
  103384:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103387:	89 55 f4             	mov    %edx,-0xc(%ebp)
            if ((long long)num < 0) {
  10338a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10338d:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103390:	85 d2                	test   %edx,%edx
  103392:	79 26                	jns    1033ba <vprintfmt+0x2ad>
                putch('-', putdat);
  103394:	8b 45 0c             	mov    0xc(%ebp),%eax
  103397:	89 44 24 04          	mov    %eax,0x4(%esp)
  10339b:	c7 04 24 2d 00 00 00 	movl   $0x2d,(%esp)
  1033a2:	8b 45 08             	mov    0x8(%ebp),%eax
  1033a5:	ff d0                	call   *%eax
                num = -(long long)num;
  1033a7:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1033aa:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1033ad:	f7 d8                	neg    %eax
  1033af:	83 d2 00             	adc    $0x0,%edx
  1033b2:	f7 da                	neg    %edx
  1033b4:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1033b7:	89 55 f4             	mov    %edx,-0xc(%ebp)
            }
            base = 10;
  1033ba:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  1033c1:	e9 a8 00 00 00       	jmp    10346e <vprintfmt+0x361>

        // unsigned decimal
        case 'u':
            num = getuint(&ap, lflag);
  1033c6:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1033c9:	89 44 24 04          	mov    %eax,0x4(%esp)
  1033cd:	8d 45 14             	lea    0x14(%ebp),%eax
  1033d0:	89 04 24             	mov    %eax,(%esp)
  1033d3:	e8 64 fc ff ff       	call   10303c <getuint>
  1033d8:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1033db:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 10;
  1033de:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  1033e5:	e9 84 00 00 00       	jmp    10346e <vprintfmt+0x361>

        // (unsigned) octal
        case 'o':
            num = getuint(&ap, lflag);
  1033ea:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1033ed:	89 44 24 04          	mov    %eax,0x4(%esp)
  1033f1:	8d 45 14             	lea    0x14(%ebp),%eax
  1033f4:	89 04 24             	mov    %eax,(%esp)
  1033f7:	e8 40 fc ff ff       	call   10303c <getuint>
  1033fc:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1033ff:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 8;
  103402:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
            goto number;
  103409:	eb 63                	jmp    10346e <vprintfmt+0x361>

        // pointer
        case 'p':
            putch('0', putdat);
  10340b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10340e:	89 44 24 04          	mov    %eax,0x4(%esp)
  103412:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
  103419:	8b 45 08             	mov    0x8(%ebp),%eax
  10341c:	ff d0                	call   *%eax
            putch('x', putdat);
  10341e:	8b 45 0c             	mov    0xc(%ebp),%eax
  103421:	89 44 24 04          	mov    %eax,0x4(%esp)
  103425:	c7 04 24 78 00 00 00 	movl   $0x78,(%esp)
  10342c:	8b 45 08             	mov    0x8(%ebp),%eax
  10342f:	ff d0                	call   *%eax
            num = (unsigned long long)(uintptr_t)va_arg(ap, void *);
  103431:	8b 45 14             	mov    0x14(%ebp),%eax
  103434:	8d 50 04             	lea    0x4(%eax),%edx
  103437:	89 55 14             	mov    %edx,0x14(%ebp)
  10343a:	8b 00                	mov    (%eax),%eax
  10343c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10343f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            base = 16;
  103446:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
            goto number;
  10344d:	eb 1f                	jmp    10346e <vprintfmt+0x361>

        // (unsigned) hexadecimal
        case 'x':
            num = getuint(&ap, lflag);
  10344f:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103452:	89 44 24 04          	mov    %eax,0x4(%esp)
  103456:	8d 45 14             	lea    0x14(%ebp),%eax
  103459:	89 04 24             	mov    %eax,(%esp)
  10345c:	e8 db fb ff ff       	call   10303c <getuint>
  103461:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103464:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 16;
  103467:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
        number:
            printnum(putch, putdat, num, base, width, padc);
  10346e:	0f be 55 db          	movsbl -0x25(%ebp),%edx
  103472:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103475:	89 54 24 18          	mov    %edx,0x18(%esp)
  103479:	8b 55 e8             	mov    -0x18(%ebp),%edx
  10347c:	89 54 24 14          	mov    %edx,0x14(%esp)
  103480:	89 44 24 10          	mov    %eax,0x10(%esp)
  103484:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103487:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10348a:	89 44 24 08          	mov    %eax,0x8(%esp)
  10348e:	89 54 24 0c          	mov    %edx,0xc(%esp)
  103492:	8b 45 0c             	mov    0xc(%ebp),%eax
  103495:	89 44 24 04          	mov    %eax,0x4(%esp)
  103499:	8b 45 08             	mov    0x8(%ebp),%eax
  10349c:	89 04 24             	mov    %eax,(%esp)
  10349f:	e8 94 fa ff ff       	call   102f38 <printnum>
            break;
  1034a4:	eb 38                	jmp    1034de <vprintfmt+0x3d1>

        // escaped '%' character
        case '%':
            putch(ch, putdat);
  1034a6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1034a9:	89 44 24 04          	mov    %eax,0x4(%esp)
  1034ad:	89 1c 24             	mov    %ebx,(%esp)
  1034b0:	8b 45 08             	mov    0x8(%ebp),%eax
  1034b3:	ff d0                	call   *%eax
            break;
  1034b5:	eb 27                	jmp    1034de <vprintfmt+0x3d1>

        // unrecognized escape sequence - just print it literally
        default:
            putch('%', putdat);
  1034b7:	8b 45 0c             	mov    0xc(%ebp),%eax
  1034ba:	89 44 24 04          	mov    %eax,0x4(%esp)
  1034be:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
  1034c5:	8b 45 08             	mov    0x8(%ebp),%eax
  1034c8:	ff d0                	call   *%eax
            for (fmt --; fmt[-1] != '%'; fmt --)
  1034ca:	ff 4d 10             	decl   0x10(%ebp)
  1034cd:	eb 03                	jmp    1034d2 <vprintfmt+0x3c5>
  1034cf:	ff 4d 10             	decl   0x10(%ebp)
  1034d2:	8b 45 10             	mov    0x10(%ebp),%eax
  1034d5:	48                   	dec    %eax
  1034d6:	0f b6 00             	movzbl (%eax),%eax
  1034d9:	3c 25                	cmp    $0x25,%al
  1034db:	75 f2                	jne    1034cf <vprintfmt+0x3c2>
                /* do nothing */;
            break;
  1034dd:	90                   	nop
    while (1) {
  1034de:	e9 36 fc ff ff       	jmp    103119 <vprintfmt+0xc>
                return;
  1034e3:	90                   	nop
        }
    }
}
  1034e4:	83 c4 40             	add    $0x40,%esp
  1034e7:	5b                   	pop    %ebx
  1034e8:	5e                   	pop    %esi
  1034e9:	5d                   	pop    %ebp
  1034ea:	c3                   	ret    

001034eb <sprintputch>:
 * sprintputch - 'print' a single character in a buffer
 * @ch:            the character will be printed
 * @b:            the buffer to place the character @ch
 * */
static void
sprintputch(int ch, struct sprintbuf *b) {
  1034eb:	f3 0f 1e fb          	endbr32 
  1034ef:	55                   	push   %ebp
  1034f0:	89 e5                	mov    %esp,%ebp
    b->cnt ++;
  1034f2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1034f5:	8b 40 08             	mov    0x8(%eax),%eax
  1034f8:	8d 50 01             	lea    0x1(%eax),%edx
  1034fb:	8b 45 0c             	mov    0xc(%ebp),%eax
  1034fe:	89 50 08             	mov    %edx,0x8(%eax)
    if (b->buf < b->ebuf) {
  103501:	8b 45 0c             	mov    0xc(%ebp),%eax
  103504:	8b 10                	mov    (%eax),%edx
  103506:	8b 45 0c             	mov    0xc(%ebp),%eax
  103509:	8b 40 04             	mov    0x4(%eax),%eax
  10350c:	39 c2                	cmp    %eax,%edx
  10350e:	73 12                	jae    103522 <sprintputch+0x37>
        *b->buf ++ = ch;
  103510:	8b 45 0c             	mov    0xc(%ebp),%eax
  103513:	8b 00                	mov    (%eax),%eax
  103515:	8d 48 01             	lea    0x1(%eax),%ecx
  103518:	8b 55 0c             	mov    0xc(%ebp),%edx
  10351b:	89 0a                	mov    %ecx,(%edx)
  10351d:	8b 55 08             	mov    0x8(%ebp),%edx
  103520:	88 10                	mov    %dl,(%eax)
    }
}
  103522:	90                   	nop
  103523:	5d                   	pop    %ebp
  103524:	c3                   	ret    

00103525 <snprintf>:
 * @str:        the buffer to place the result into
 * @size:        the size of buffer, including the trailing null space
 * @fmt:        the format string to use
 * */
int
snprintf(char *str, size_t size, const char *fmt, ...) {
  103525:	f3 0f 1e fb          	endbr32 
  103529:	55                   	push   %ebp
  10352a:	89 e5                	mov    %esp,%ebp
  10352c:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  10352f:	8d 45 14             	lea    0x14(%ebp),%eax
  103532:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vsnprintf(str, size, fmt, ap);
  103535:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103538:	89 44 24 0c          	mov    %eax,0xc(%esp)
  10353c:	8b 45 10             	mov    0x10(%ebp),%eax
  10353f:	89 44 24 08          	mov    %eax,0x8(%esp)
  103543:	8b 45 0c             	mov    0xc(%ebp),%eax
  103546:	89 44 24 04          	mov    %eax,0x4(%esp)
  10354a:	8b 45 08             	mov    0x8(%ebp),%eax
  10354d:	89 04 24             	mov    %eax,(%esp)
  103550:	e8 08 00 00 00       	call   10355d <vsnprintf>
  103555:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  103558:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10355b:	c9                   	leave  
  10355c:	c3                   	ret    

0010355d <vsnprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want snprintf() instead.
 * */
int
vsnprintf(char *str, size_t size, const char *fmt, va_list ap) {
  10355d:	f3 0f 1e fb          	endbr32 
  103561:	55                   	push   %ebp
  103562:	89 e5                	mov    %esp,%ebp
  103564:	83 ec 28             	sub    $0x28,%esp
    struct sprintbuf b = {str, str + size - 1, 0};
  103567:	8b 45 08             	mov    0x8(%ebp),%eax
  10356a:	89 45 ec             	mov    %eax,-0x14(%ebp)
  10356d:	8b 45 0c             	mov    0xc(%ebp),%eax
  103570:	8d 50 ff             	lea    -0x1(%eax),%edx
  103573:	8b 45 08             	mov    0x8(%ebp),%eax
  103576:	01 d0                	add    %edx,%eax
  103578:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10357b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if (str == NULL || b.buf > b.ebuf) {
  103582:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  103586:	74 0a                	je     103592 <vsnprintf+0x35>
  103588:	8b 55 ec             	mov    -0x14(%ebp),%edx
  10358b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10358e:	39 c2                	cmp    %eax,%edx
  103590:	76 07                	jbe    103599 <vsnprintf+0x3c>
        return -E_INVAL;
  103592:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  103597:	eb 2a                	jmp    1035c3 <vsnprintf+0x66>
    }
    // print the string to the buffer
    vprintfmt((void*)sprintputch, &b, fmt, ap);
  103599:	8b 45 14             	mov    0x14(%ebp),%eax
  10359c:	89 44 24 0c          	mov    %eax,0xc(%esp)
  1035a0:	8b 45 10             	mov    0x10(%ebp),%eax
  1035a3:	89 44 24 08          	mov    %eax,0x8(%esp)
  1035a7:	8d 45 ec             	lea    -0x14(%ebp),%eax
  1035aa:	89 44 24 04          	mov    %eax,0x4(%esp)
  1035ae:	c7 04 24 eb 34 10 00 	movl   $0x1034eb,(%esp)
  1035b5:	e8 53 fb ff ff       	call   10310d <vprintfmt>
    // null terminate the buffer
    *b.buf = '\0';
  1035ba:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1035bd:	c6 00 00             	movb   $0x0,(%eax)
    return b.cnt;
  1035c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1035c3:	c9                   	leave  
  1035c4:	c3                   	ret    
