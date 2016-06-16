.code16

.global _lowstart

.text
_lowstart:
    sti
    Lcheckparts:
        movw $PT1, %bx
        movw $4, %cx
        Lckptlp:
            movb (%bx), %al
            testb $0x80, %al
            jnz Lckptfound
            addw $0x10, %bx
            loop Lckptlp
        jmp ERROR
        Lckptfound:
            movw %bx, %cx
            addw $8, %bx
    Lread:
        movl (%bx), %ebx
        movl %ebx, d_lba
        movb $0x42, %ah
        movw $dapack, %si
        int $0x13
    Ljump:
        mov %cx, %di
        jmp 0x7c00
ERROR:
    cli
    hlt

.data
dapack:
    .byte 0x10
    .byte 0x00
blkcnt:
    .word 0x02
db_add:
    .word 0x7c00
    .word 0x0000
d_lba:
    .long 0x00000000
    .long 0x00000000
