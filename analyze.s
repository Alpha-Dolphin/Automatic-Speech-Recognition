# Ben Elleman
# BY SUBMITTING THIS FILE AS PART OF MY LAB ASSIGNMENT, I CERTIFY THAT
# ALL OF THE CODE FOUND WITHIN THIS FILE WAS CREATED BY ME WITH NO
# ASSISTANCE FROM ANY PERSON OTHER THAN THE INSTRUCTOR OF THIS COURSE
# OR ONE OF OUR UNDERGRADUATE GRADERS. I WROTE THIS CODE BY HAND,
# IT IS NOT MACHINE GENRATED OR TAKEN FROM MACHINE GENERATED CODE.

.file "analyze.s"
.section .rodata

.data

.globl analyze
	.type analyze, @function
analyze:
	pushq %rbp
	movq %rsp, %rbp			#Set up stack frame
	
	xorw %ax, %ax			#Zero last 2 bits of the crossing register
	xorl %edx, %edx			#Zero entire energy register
	xorq %r9, %r9			#Zero entire previous entry register

	leaq 24(%rdi), %r11		#Go 24 past %rdi to get to the first element of samples
	leaq 128(%r11), %r10		#Find the address of the last element and put it in %r10
	
    loop_start:				#Start of for-loop

	movswq (%r11), %r8		#Pull sample[i] out of memory and put in the entire register
	
	xorq %r8, %r9			#Set the higest bit of %r9 with sign difference
	shrq $63, %r9			#Set the carry flag
	addq %r9, %rax			#Add carry flag result to zero-crossing count
	
	movq %r8, %r9			#Preserve the value of sample[i-1]
	
	imulq %r8, %r8			#Overwrite scrathpad with sample[i]^2 = amplitude^2 = energy
	addq %r8, %rdx			#Add energy to sum 

	leaq 2(%r11), %r11		#Increment %r11 by the size of a short
	cmpq %r10, %r11			#Are we at the end of the array
	jb loop_start			#If not at the end, continue looping

	movw %ax, 8(%rdi)		#Put the zero-crossings in zc

	movq %rdx, 16(%rdi)		#Put the total energy in energy

	leave
	ret
    .size analyze, .-analyze
