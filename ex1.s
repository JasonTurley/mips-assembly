.text
.globl main

main:
    li $t0, 0   # value = 0
    li $t1, 10  # iterations = 10
    li $t2, 0   # i = 0

for_loop:
    beq $t2, $t1, end   # if i == iteration, goto end
    add $t0, $t0, $t2   # value = value + i
    addi $t2, $t2, 1    # i = i + 1
    j for_loop
end:
    li $v0, 10      # exit
    syscall
