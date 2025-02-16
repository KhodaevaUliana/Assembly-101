# a simple program that exits and returns a status code back to Linux kernel
# use echo$? to see the result
#AT&T syntax

.section __TEXT,__text #an assembler directive aka pseudo-operation: an instruction to the assembler itself
.globl _start #_start is a symbol, i.e., it is going to be replaced by sth else during assebly or linking (marks location of the start)

_start: #labels (sth followed by a colon) define symbols' values
    mov $0X0000003, %rdi        # exit status 3
    mov $0x2000001, %rax   # syscall number for exit() on macOS
    syscall                # make syscall