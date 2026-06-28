# given:
#
# #include <stdint.h>
# #include <stdio.h>
#
# uint64_t a(uint64_t n) {
#   if (n == 0)
#     return 1;
#   else
#     return 3 * a(n - 1) + n;
# }


# Stack frame information for function 'a':
# - register a0 contains n (size: 8 bytes)
# - saved reg ra at stack offset: 8
# - saved reg s0 at stack offset: 0

  .text
  .global a
a:
  addi sp,sp,-16
  sd ra,8(sp)
  sd s0,0(sp)

  mv s0,a0
  bnez s0,.L2
  li a5,1
  j .L3
  
.L2:
  addi a5,s0,-1
  mv a0,a5
  call a
  mv a4,a0
  mv a5,a4
  slli a5,a5,1
  add a5,a5,a4
  add a5,s0,a5

.L3:
  mv a0,a5

fEPI:
  ld ra,8(sp)
  ld s0,0(sp)
  addi sp,sp,16
  ret
  
