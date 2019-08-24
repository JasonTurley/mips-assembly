# Jason Turley -- 8/24/2019
# larger.s - Reads in two integers from the user and prints the larger of the
# two.
#
# Registers used:
#       $t0 - used to hold the first number
#       $t1 - used to hold the second number
#       $t2 - used to hold the larger number
#       $v0 - syscall parameter and return value
#       $a0 - syscall parameter

main:
    ## Get the first number from the user, put into $t0
    li      $v0, 5          # syscall code 5 is to read in an int
    syscall                 # make the syscall
    move    $t0, $v0        # copy the number to $t0

    ## Get the first number from the user, put into $t1
    li      $v0, 5          # syscall code 5 is to read in an int
    syscall                 # make the syscall
    move    $t1, $v0        # copy the number to $t1

    ## If t1 is larger than t0, branch to t1_larger
    blt     $t0, $t1, t1_larger
    move    $t2, $t0        # t0 is larger, copy it to $t2
    j       print_result    # jump to syscall

t1_larger:
    move    $t2, $t1        # t1 is larger, copy it to $t2

    ## Print the number to screen
print_result:
    move    $a0, $t2        # copy $t2 to $a0 for printing
    li      $v0, 1          # syscall code 1 is to print an int from $a0
    syscall                 # make the syscall

    li      $v0, 10         # syscall code 10 is to exit
    syscall                 # make the syscall
