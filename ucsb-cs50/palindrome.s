## Jason Turley -- 08/24/2019
## palindrome.s - reads a line of text and tests if it is a palindrome.
## Register usage:
##      $t1     - A
##      $t2     - B
##      $t3     - the character at address A
##      $t4     - the character at address B
##      $v0     - syscall parameter / return values
##      $a0     - syscall parameters
##      $a1     - syscall parameters

    .data
string_space:        .space  1024        # set aside 1024 bytes for the string
string_is_palin:     .asciiz "The string is a palindrome\n"
string_is_not_palin: .asciiz "The string is NOT a palindrome\n"

    .text
main:
    ## Read the string S:
    la      $a0, string_space               # points to the start of S
    li      $a1, 1024                       # stores the max number of bytes to read
    li      $v0, 8                          # load "read_string" code into $v0
    syscall

    ## Load the address of string_space into $t1
    la      $t1, string_space               # A = S

    ## Advance B to the last character in string
    la      $t2, string_space               # B = S

length_loop:
    lb      $t3, ($t2)                      # load the byte at B into $t3
    beq     $t3, $zero, end_length_loop     # if $t3 == 0, exit loop
    addu    $t2, $t2, 1                     # B = B + 1
    j length_loop

    ## Subtract 2 to move B back past the '\0' and '\n'
end_length_loop:
    subu    $t2, $t2, 2

    ## Check if S is a palindrome
palindrome_loop:
    bge     $t1, $t2, is_palin              # string is palindrome, end loop

    lb      $t3, ($t1)                      # $t3 = *A
    lb      $t4, ($t2)                      # $t4 = *B
    bne     $t3, $t4, not_palin             # *A != *B, string isn't palindrome

    addu    $t1, $t1, 1                     # A = A + 1
    subu    $t2, $t2, 1                     # B = B - 1
    j palindrome_loop

    ## Load message for when string is a palindrome
is_palin:
    la      $a0, string_is_palin
    j       exit

    ## Load message for when string is NOT a palindrome
not_palin:
    la      $a0, string_is_not_palin

    ## Print message and exit
exit:
    li      $v0, 4
    syscall

    li      $v0, 10
    syscall

