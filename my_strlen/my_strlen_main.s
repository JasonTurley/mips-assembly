.data

# Strings for printing purposes
str1_msg: .asciiz "my_strlen(str1): "
str2_msg: .asciiz "my_strlen(str2): "

# String data for test cases
str1: .asciiz "Hello world"
str2: .asciiz ""

.text
MAIN_STK_SPC = 4
main:
    sub     $sp, $sp, MAIN_STK_SPC
    sw      $ra, 0($sp)

# Test str1
    la      $a0, str1_msg
    jal     print_string
    la      $a0, str1
    jal     my_strlen
    move    $a0, $v0
    jal     print_int_and_space
    jal     print_newline


# Restore stack
    lw      $ra, 0($sp)
    add     $sp, $sp, MAIN_STK_SPC
    jr      $ra
