# Compute first twelve Fibonacci numbers and put in array, then print
    .data
seq:  .word  0 : 25                 # "array" of 30 words to contain sequence values
size: .word  25                     # size of "array" 
      
    .text
    
    la      $t0, seq                # $t0 = &seq
    la      $t5, size               # $t5 = &size
    lw      $t5, 0($t5)             # $t5 = *$t5 --> $t5 = 25
    
    li      $t2, 1                  # $t2 = 1 
    sw      $t2, 0($t0)             # store S[0] with 1
    addiu   $t2, $t2, 2             # $t2 = 2 + 1 = 3 
    sw      $t2, 4($t0)             # store S[1] with 3
    
    subu    $t1, $t5, $t2           # the number of loop is (size-2)
    ori     $t7, $zero, 1           # the lastest loop 

    addi    $t0, $t0, 8             # point to S[2]
    
Loop:
    slt     $t4, $t1, $t7           # $t4 = ($t1 < 1) ? 1 : 0
    beq	    $t4, $t7, Sumseq        # repeat if not finished yet
    lw      $a0, -8($t0)            # $a0 = S[n]
    lw      $a1, -4($t0)            # $a1 = S[n+1]
    jal     sequence                # $v0 = sequence( S[n], S[n+1] )
    sw      $v0, 0($t0)             # store S[n+2]
    addi    $t0, $t0, 4             # $t0 point to S[n+1]
    addi    $t1, $t1, -1            # loop counter decreased by 1
    j       Loop

sequence :
    subu    $t3, $a1, $a0	    # $t3 = y - x
    addu    $t3, $t3, $t3	    # $t3 = $t3 * 2
    addu    $v0, $a1, $t3	    # $v0 = 2*(y - x) + y
    jr      $ra            	    # return	
 
Sumseq:
    la      $t0, seq                # $t0 = &seq
    addiu   $t0, $t0, 4             # point to S[1]
    li      $s0, 0                  # $s0 = 0
    addi    $t1, $t5, -1             # the number of loop is (size-1)
   
Sum_Loop:
    lw      $a0, -4($t0)            # $a0 = S[n]
    addiu   $a1, $s0, 0	            # $a1 = Sum
    jal     Sum		            # $v0 = sequence( S[n], S[n+1] )
    addu    $s0, $v0, $s0           # Sum = Sum + s[n] 
    addi    $t0, $t0, 4             # $t0 point to S[n+1]
    addi    $t1, $t1, -1            # loop counter decreased by 1
    slt     $t4, $t1, $t7           # $t4 = ($t1 < 1) ? 1 : 0
    bne	    $t4, $t7, Sum_Loop      # repeat if not finished yet
    j       End

Sum:
    addu    $v0, $a0 , $a1	    # $v0 = x + y
    jr      $ra            	    # return
    
End:
    sw      $s0, 4($t0)	            # *($t0+4) = $s0    
    lui     $t6, 0xABCD             # $t6 = 0xABCD0000
    sw      $t6, -4($t0)            # *($t0-4) = $t6

