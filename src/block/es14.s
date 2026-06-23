.global _start
_start:
	
	li a2,0
	la a0,v
	la a1,w
	li t1,3
	
.L2:
	sub t2,t1,a2
	slli t3,a2,3
	add t3,t3,a0
	ld t3,0(t3)
	
	slli t2,t2,3
	add t2,t2,a1
	sd t3,0(t2)
	
	addi a2,a2,1
	bleu a2,t1,.L2

# uint64_t v[4]; //global
# uint64_t w[4]; //global
#
# uint64_t i; //local, stored in a2

# solution:
#
# for(i=0; i<=3; i++){
# 	w[3-i] = v[i];
# }
