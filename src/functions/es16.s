# given:
#
# #include <stdint.h>
# #include <stdio.h>
#
# uint64_t inc(uint64_t);
#
# uint64_t  f(uint64_t v){ 
# 	uint64_t k;
#	k = inc(inc(v));
#	return v;
# }


# Stack frame information for function 'f':
# - register a0 contains v (size: 8 bytes)
# - saved reg ra at stack offset: 16
# - saved reg s0 at stack offset: 8
# - saved var k at stack offset: 0

# function prologue
	.text
	.global f
f:
	addi sp,sp,-24
	sd ra,16(sp)
	sd s0,8(sp)
	
	
# function body
	mv s0,a0
	call inc
	call inc
	sd a0,0(sp)
	mv a0,s0
	
# function epilogue
fEPI:
	ld s0,8(sp)
	ld ra,16(sp)
	addi sp,sp,24
	ret
