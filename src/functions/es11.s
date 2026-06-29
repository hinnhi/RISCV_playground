# given:
# 
# #include <stdint.h>
#
# uint64_t fRef(uint64_t *v, uint64_t size) {
#   int sum = 0;
#   int i;
#   for (i = 0; i < size; i++) {
#     int val = v[i];
#     sum += val;
#   }
#   return sum;
# }


# Stack frame information for function 'f':
# - register a0 contains v (size: 8 bytes)
# - register a1 contains size (size: 8 bytes)
# - saved reg fp at stack offset: 16
# - local var sum at stack offset: 8
# - local var i at stack offset: 0

# function prologue
  .text
  .globl f
f:
  addi sp, sp, -24
  sd fp, 16(sp)
  addi fp, sp, 24

# function body
  .equiv SUM_FP, -16
  .equiv I_FP, -24

  sd zero, SUM_FP(fp)
  sd zero, I_FP(fp)
  add sp, sp, -8

for:
  ld t0, I_FP(fp)
  bge t0, a1, exitFor
  slli t0, t0, 3
  add t0, t0, a0
  ld t0, 0(t0)
  sd t0, 0(sp)
  ld t1, SUM_FP(fp)
  ld t0, 0(sp)
  add t1, t1, t0
  sd t1, SUM_FP(fp)
  ld t0, I_FP(fp)
  addi t0, t0, 1
  sd t0, I_FP(fp)
  j for

exitFor:
  add sp, sp, 8
  ld a0, SUM_FP(fp)
  j fEPI

# function epilogue
fEPI:
  ld fp, 16(sp)
  addi sp, sp, 24
  ret
