# Jason Turley -- 8/12/2019
# hello.s - Prints "Hello, world!"
#
# Registers used:
#       $v0 - syscall parameter and return value
#       $a0 - syscall parameter

.data
hello_msg: .asciiz    "Hello, world!\n"

.text
main:
    la      $a0, hello_msg      # load the addr of our hello_msg
    li      $v0, 4              # syscall code 4 is for printing strings
    syscall

    li      $v0, 10             # syscall code 10 is to exit
    syscall
