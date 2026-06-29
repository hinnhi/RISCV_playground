# given:
#
# #include <stdint.h>
#
# typedef struct {
#   char name[16];
#   uint64_t grade[4];
# } student;
#
# uint64_t fRef(student s) {
#   int sum = 0;
#   for (int i = 0; i < 4; i++) {
#     sum += s.grade[i];
#   }
#   sum = sum / 4;
#   return sum;
# }


# Stack frame information for function 'f':
# - parameter s.grade[31..24] at stack offset: 56
# - parameter s.grade[23..16] at stack offset: 48
# - parameter s.grade[15..8] at stack offset: 40
# - parameter s.grade[7..0] at stack offset: 32
# - parameter s.name[15..8] at stack offset: 24
# - parameter s.name[7..0] at stack offset: 16
# - local var i at stack offset: 8
# - local var sum at stack offset: 0

# function prologue
  .text
  .globl f
f:
  addi sp, sp, -16

# function body
  .equiv I, 8
  .equiv SUM, 0
  .equiv STUDENT_GRADE_OFF, 16
  .equiv STUDENT_NAME_OFF, 0

  sd zero, SUM(sp)
  sd zero, I(sp)
  
for:
  ld t0, I(sp)
  li t2, 4
  bge t0, t2, endFor
  slli t0, t0, 3
  add t0, t0, STUDENT_GRADE_OFF
  add t0, a0, t0
  ld t0, 0(t0)
  ld t1, SUM(sp)
  add t1, t1, t0
  sd t1, SUM(sp)
  ld t0, I(sp)
  add t0,t0,1
  sd t0, I(sp)
  j for
  
endFor:
  ld t0, SUM(sp)
  srli t0,t0,2
  mv a0, t0

# function epilogue
fEPI:
  addi sp, sp, 16
  ret
