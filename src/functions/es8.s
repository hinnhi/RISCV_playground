# given:
#
# #include <stdint.h>
#
# uint64_t  fRef(uint64_t n){ 
# 	uint64_t i;
# 	uint64_t a = 0;
# 	for (i=n; i>=0; i--){
#		a = a + 1;
#	}
#	return a;
# }


# Stack frame information for function 'f':
# - register a0 contains n (size: 8 bytes)
# - local var a at stack offset: 8
# - local var i at stack offset: 0

# function prologue
	.text
	.global f
f:
	addi sp,sp,-16
	
# function body
	sd zero,8(sp)
	mv t0,a0
	sd t0,0(sp)
	
for:
	ld t0,0(sp)
	blt t0,zero,endFor
	ld t0,8(sp)
	ld t1,0(sp)
	add t0,t1,t0
	sd t0,8(sp)
	ld t1,0(sp)
	addi t1,t1,-1
	sd t1,0(sp)
	j for

endFor:
	ld a0,8(sp)

# function epilogue
fEPI:
	addi sp,sp,16
	ret
