.code16
.global _start
.text

_start:
    cli  
    movw $0x1000, %sp
a20:
    call Lcheck
    jnz Lfinish
    mov $0x2401, %ax
    int $0x15
    call Lcheck
    jnz Lfinish
    cli
    hlt

Lfinish:
    lgdt gdtr
    movl %cr0, %eax
    orl $1, %eax
    movl %eax, %cr0
    movw $0x10, %ax
    movw %ax, %ds
    movw %ax, %ss
    ljmp $0x08, $prot

Lcheck:
    pushw %ds
    xorw %ax, %ax
    movw %ax, %es
    
    notw %ax
    movw %ax, %ds

    movw $0x500, %di
    movw $0x510, %si

    movb %es:(%di), %al
    pushw %ax
    mov %ds:(%si), %al
    pushw %ax

    movb $0x00, %es:(%di)
    movb $0xff, %ds:(%si)

    cmpb $0xff, %es:(%di)
    popw %ax
    movb %al, %ds:(%si)
    popw %ax
    movb %al, %es:(%di)
    popw %ds
    ret

.code32
prot:
    cli
    hlt

.data
gdtr:
    .word (Lgdtend - Lgdt - 1)
    .long Lgdt
    
.align 0x10
Lgdt:
    .quad 0

    .word 0xffff, 0x0000
    .byte 0x00, 0b10011010, 0b11001111, 0x00

    .word 0xffff, 0x0000
    .byte 0x00, 0b10010010, 0b11001111, 0x00

    .quad 0
Lgdtend:
