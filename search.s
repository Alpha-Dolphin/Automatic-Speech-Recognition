# Ben Elleman
# BY SUBMITTING THIS FILE AS PART OF MY LAB ASSIGNMENT, I CERTIFY THAT
# ALL OF THE CODE FOUND WITHIN THIS FILE WAS CREATED BY ME WITH NO
# ASSISTANCE FROM ANY PERSON OTHER THAN THE INSTRUCTOR OF THIS COURSE
# OR ONE OF OUR UNDERGRADUATE GRADERS. I WROTE THIS CODE BY HAND,
# IT IS NOT MACHINE GENRATED OR TAKEN FROM MACHINE GENERATED CODE.

.file "search.s"
.section .rodata

.LC0:
	.string "\nSearch selected frame %ld with %d zero-crossings.\n"	
.data

.globl search
	.type search, @function
search:
	pushq %rbp
	movq %rsp, %rbp			#Set up stack frame

	pushq %r12			#Push needed registers, original address
	pushq %r13			#Current address
	pushq %r14			#Highest zc
	pushq %r15			#Address of frame with the highest zc

	movq %rdi, %r12			#Move 1st arg so it doesn't get trashed
	imulq $152, %rsi, %r13		#Size of struct * count
	leaq (%rdi, %r13), %r13		#Address of first frame + 152 * count aka address of last frame
	
loop_start:
	
	leaq -152(%r13), %r13 		#Get address of next frame

	movq %r13, %rdi			#Put current address in 1st param register
	call evaluate			#Call function, put zc of current frame in %rax
	
	cmpq %rax, %r14			#Compare highest zc with returned zc
    jge lower_crossings			#If %rax has a lower (or equal) number of crossings, skip
	movq %rax, %r14			#Set %rbx with new highest zero-crossing count
	movq %r13, %r15			#Put address of current frame in %r15
    lower_crossings:			#Label to jump to if no new highest zero-crossing count

	cmp %r12, %r13			#Are we about to fall off a cliff
jg loop_start				#If not, continue

					#"\nSearch selected frame %ld with %d zero-crossings.\n"	
	movq %r14, %rdx			#Put zc count into 3rd print arg
	movq (%r15), %rsi		#Put best frame into 2nd print arg
	movq $.LC0, %rdi		#Put format string into 1st print arg
	xorl %eax, %eax			#To keep ABI happy
	call print			#Do the print

	movq %r15, %rax			#Put address of highest zc frame in return register

	pop %r15 			#Restore all used callee-saved registers
	pop %r14			#~
	pop %r13			#~
	pop %r12			#~

	leave
	ret
    .size search, .-search
