# given:
#
# #include <stdint.h>
# #include <stdio.h>
#
# uint64_t inc(uint64_t);
#
# uint64_t  f(uint64_t v, uint64_t w){ 
#	return w + inc(v);
# }


# Stack frame information for function 'f':
# - register a0 contains v (size: 8 bytes)
# - register a1 contains w (size: 8 bytes)
# - saved reg ra at stack offset: 8
# - saved reg s0 at stack offset: 0

# function prologue
	.text
	.global f
f:
	addi sp,sp,-16
	sd ra,8(sp)
	sd s0,0(sp)
	
	
# function body
	mv s0,a1
	call inc
	add a0,a0,s0
	
# function epilogue
fEPI:
	ld s0,0(sp)
	ld ra,8(sp)
	addi sp,sp,16
	ret
