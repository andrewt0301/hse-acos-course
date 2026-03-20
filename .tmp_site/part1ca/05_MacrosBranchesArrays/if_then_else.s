# Example:
#
# if (t0 == 0) {
#     t1 = 1;
# } else if (t0 < 0) {
#     t1 = 2;
# } else if (t0 >= 10) {
#     t1 = 3;
# } else {
#     t1 = 4;
# }
main:
   li   a7, 5
   ecall
   mv   t0, a0
if_0:
   bnez t0, if_less_0
   li   t1, 1
   j    end_if
if_less_0:
   bgtz t0, if_greater_10
   li   t1, 2
   j    end_if
if_greater_10:
   li   t3, 10
   ble  t0, t3, else
   li   t1, 3
   j    end_if
else:
   li   t1, 4
end_if:
   li   a7, 1
   mv   a0, t1
   ecall
