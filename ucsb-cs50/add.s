# Jason Turley -- 8/12/2019
# add.s - Adds the numbers 1 and 2 together and exits.
#
# Registers used:
#       $t0 - used to hold the result of 1 + 2
#       $t1 - used to hold the value 1
#       $v0 - used for syscall

main:
    li      $t1, 1          # load 1 into $t1
    add     $t0, $t1, 2     # compute the result of 1 + 2

    li      $v0, 10         # syscall code 10 is to exit
    syscall                 # make the syscall
