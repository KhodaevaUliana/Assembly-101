# find the maximum number in an array with zero as the terminating element
# see the result as the exit code (echo $?)
#since we are returning the result as the exit code, which is 8-bit long, all numbers must be less than 256

.section __DATA, __data

data_items:
	.quad 3, 69, 34, 240, 10, 1, 25, 14, 228, 0   #!!! all of them are less than 256 !!!

.section __TEXT, __text

.globl _start
_start:
	mov $0, %rbx    #rbx holds the index of data being examined
	lea data_items(%rip), %rsi
	mov (%rsi,%rbx,8), %rax    #load the first byte into rax
	mov %rax, %rdi  #rdi holds the largest item found

start_loop:
	cmp $0, %rax  #check whether we've hit the end
	je loop_exit   #jump if we got "equal"
	inc %rbx  #load (increment) the next value
	lea data_items(%rip), %rsi  #load effective address rip is a relative index pointer
	mov (%rsi,%rbx,8), %rax
	cmp %rdi, %rax  #compare values
	jle start_loop  #jump if we got "less or equal"
	mov %rax, %rdi  #if we got "larger"
	jmp start_loop  #unconditional jump

loop_exit:
	mov $0x2000001, %rax  #exit() syscall
	syscall