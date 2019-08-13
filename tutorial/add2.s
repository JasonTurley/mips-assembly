# Jason Turley -- 8/12/2019
# add2.s - Adds together two numbers that are read from the user at runtime.
#
# Registers used:
#       $t0 - used to hold the first number
#       $t1 - used to hold the second number
#       $t2 - used to hold the sum
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

    add     $t2, $t0, $t1   # compute the sum

    ## Print the number to screen
    move    $a0, $t2        # copy $t2 to $a0 for printing
    li      $v0, 1          # syscall code 1 is to print an int from $a0
    syscall                 # make the syscall

    li      $v0, 10         # syscall code 10 is to exit
    syscall                 # make the syscall
