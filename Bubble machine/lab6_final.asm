.data
    
    prompt: .asciiz "Enter a float: "
    newline:.asciiz "\n"
    arr: .float  0.897, 0.565, 0.656, 0.1234, 0.665, 0.3434, 0.1126, 0.554, 0.3349, 0.678, 0.3656, 0.9989
    bucket:.float 0.0, 0.0, 0.0, 0.0, 0.0,0.1234, 0.1126, 0.0, 0.0, 0.0,0.0, 0.0, 0.0, 0.0, 0.0,0.3434,  0.3349, 0.3656, 0.0, 0.0,0.0, 0.0, 0.0, 0.0, 0.0,0.565,  0.554, 0.0, 0.0, 0.0,0.656, 0.665, 0.678, 0.0, 0.0,0.0, 0.0, 0.0, 0.0, 0.0,0.897, 0.0, 0.0, 0.0, 0.0,0.9989, 0.0, 0.0, 0.0, 0.0

            #          bucket:.float 0.0, 0.0, 0.0, 0.0, 0.0,
            #      0.1234, 0.1126, 0.0, 0.0, 0.0,
            #      0.0, 0.0, 0.0, 0.0, 0.0,
            #     0.3434,  0.3349, 0.3656, 0.0, 0.0,
            #      0.0, 0.0, 0.0, 0.0, 0.0,
            #     0.565,  0.554, 0.0, 0.0, 0.0,
           # 0.656, 0.665, 0.678, 0.0, 0.0,
            #        0.0, 0.0, 0.0, 0.0, 0.0,
            #       0.897, 0.0, 0.0, 0.0, 0.0,
            #         0.9989, 0.0, 0.0, 0.0, 0.0

    # index_in_bucket: .word  0,0,0,0,0,0,0,0,0,0
    # reserve space for an array of 10 floats
 n: .word 12
.text
.globl main
main:
    la $a0, prompt      # load the address of the prompt string into $a0
    syscall
    li $t0, 0           # initialize a counter $t0 to keep track of the index of the array
    la $t1, arr         # load the base address of the array into $t1
   li $t2, 12
 j bucket_sort



.text 
bucket_sort:
    la $s1,bucket
    li $s0,0 #bucket index
    addi $s2,$s1,200 #check strictly less inequality of s1,s2
    loop3:
    bge $s1,$s2,merging_bucks
    jal insertion_sort
    addi $s1,$s1,20
    j loop3

.text
 merging_bucks:
    la $t1,arr
    la $s1,bucket
    addi $s2,$s1,200
    loop4:
    bge $s1,$s2,print
    l.s $f12,0($s1)
    addi $s1,$s1,4
    li.s $f0,0.001
   c.lt.s $f0,$f12 
    bc1t loop5
    j loop4

loop5:
 s.s $f12,0($t1)
 addi $t1,$t1,4
 j loop4

.text
insertion_sort:
    li $t5, -1 #i
    li $t2,4 
    loop_out:
        addi $t5,$t5,1#i=i+1 


        bge $t5, $t2, exit_ins
        addi $t6, $t5, -1#j=i-1
        
        li $t9,-1
        innerLoop:
         bge $t9, $t6, loop_out
           sll $t7,$t6,2 #j*4
         add $t7,$s1,$t7#arr[j]
        l.s $f0, 0($t7)#load arr[j] #error
        l.s $f1, 4($t7)#arr[j+1]
        c.le.s $f0,$f1 #arr[j+1]>=arr[j] go bc1t
        bc1t loop_out#break
        s.s $f1, 0($t7)
        s.s $f0, 4($t7)
        addi $t6,$t6,-1#j--
        j innerLoop
exit_ins: jr $ra
         
      #  Exit:
.text   
print:
    la $t1, arr         # load the base address of the array into $t1
    li $t0, 0           # initialize a counter $t0 to keep track of the index of the array
.text
print_loop:
    bge $t0, 12, exit    # if $t0 >= n, we have printed all the elements of the array, so we exit the loop

    # load the float from the array into $f12
    l.s $f12, 0($t1)
    la $a0, newline
    li $v0, 4           # load the system call code for printing a string into $v0
    syscall             # execute the system call to print the prompt string
    # print the float
    li $v0, 2           # load the system call code for printing a float into $v0
    syscall             # execute the system call to print the float

    addi $t0, $t0, 1    # increment the counter to move on to the next element of the array
    addi $t1, $t1, 4    # increment the base address to point to the next element of the array
    j print_loop        # jump back to the beginning of the loop to print the next element of the array
.text
exit:
    li $v0, 10          # load the system call code for exiting the program into $v0
    syscall             # execute the system call to exit the program



