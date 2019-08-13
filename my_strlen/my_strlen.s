.text
.globl my_strlen

my_strlen:
    li      $v0, 0               # set counter to 0
    beq     $a0, 0, ms_end       # null check

ms_loop:
    lb      $t0, 0($a0)          # load the first byte of string into t0
    beq     $t0, 0, ms_end       # null check
    addi    $v0, $v0, 1          # increment counter
    addi    $a0, $a0, 1          # increment pointer
    j       ms_loop

ms_end:
    jr      $ra                  # jump to return address

