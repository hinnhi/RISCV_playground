.global _start
_start:
	
	ld a2,v
	li a1,1
	
.L5:
	mv t1,a1
	li t0,7
	bgt t1,t0,.L2
	
	mv t1,a1
	slli t1,t1,3
	la t0,v
	add t0,t1,t0
	ld t0,0(t0)
	ble t0,a2,.L3
	j .L4
	
.L3:
	mv t0,a2
	
.L4:
	mv a2,t0
	addi a1,a1,1
	j .L5

.L2:

# solution:
#
# int64_t v[8];
#
# int main(){
#   
# 	for(i=1; i<=7; i++){
# 		max = (v[i] > max) ? v[i] : max;
# 	}
# }
