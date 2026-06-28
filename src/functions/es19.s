# https://oeis.org/A000108

# given:
#
# /* To convert (a / b) use: __udivdi3(a,b) && assume binamial function already exist;
# */
#
# #include <stdint.h>
# #include <stdio.h>
#
# uint64_t catalan(register uint64_t n){ return binomial(2 * n, n) / (n + 1);}


# Stack frame information for function 'f':
# - register a0 contains n (size: 8 bytes)
# - saved reg ra at stack offset: 8
# - saved reg s0 at stack offset: 0

# function prologue
	.text
	.global catalan
	
catalan:
	addi sp,sp,-16
	sw ra,8(sp)
	sw s0,0(sp)
	
# function body
	mv s0,a0
	slli a0,a0,1
	mv a1,a0
	call binomial
	addi a1,s0,1
	call __udivdi3

# function epilogue
fEPI:
	lw ra,8(sp)
	lw s0,0(sp)
	addi sp,sp,16
	ret	
