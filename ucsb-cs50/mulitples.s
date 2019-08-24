# Jason Turley -- 8/24/2019
# multiples.s - Reads in two numbers A and B, prints out all multiples of A from
# A * B.
# If B <= 0, then no multiples are printed.
#
# Registers used:
#       $t0 - used to hold A
#       $t1 - used to hold B
#       $t2 - used to store S, the sentinel value A * B
#       $t3 - used to store m, the current multiple of A
#       $v0 - syscall parameter and return value
#       $a0 - syscall parameter

.data

newline_char:   .asciiz "\n"

.text

main:
    ## Read A into $t0
    li      $v0, 5          # syscall code 5 is to read in an int
    syscall                 # make the syscall
    move    $t0, $v0        # copy the number to $t0

    ## Read B into $t1
    li      $v0, 5          # syscall code 5 is to read in an int
    syscall                 # make the syscall
    move    $t1, $v0        # copy the number to $t1

    blez    $t1, exit       # if B <= 0, exit
    mul     $t2, $t0, $t1   # S = A * B
    move    $t3, $t0        # m = A

loop:
    ## Print m
    move    $a0, $t3        # copy m into $a0 for printing
    li      $v0, 1          # 1 is the print_int syscall
    syscall                 # make the syscall

    ## Print a newline
    la      $a0, newline_char
    li      $v0, 4          # 4 is the print_string syscall
    syscall                 # make the syscall

    beq     $t3, $t2, exit  # if m == S, then exit
    add     $t3, $t3, $t0   # m = m + A
    j loop

exit:
    li      $v0, 10         # syscall code 10 is to exit
    syscall                 # make the syscall
