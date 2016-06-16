.code16
.extern _lowstart
.global _start

.text
_start:
    /* clear interrupts */
    cli
    /* set segments */
    xorw %ax, %ax
    movw %ax, %ds
    movw %ax, %es
    movw %ax, %fs
    movw %ax, %ss
    /* copy 512 bytes (256 words) to 0x0600 */
    .copy:
        movw $0x0100, %cx
        movw $0x7c00, %si
        movw $0x0600, %di
        rep movsw
    /* jump to the _lowstart, setting cs to 0 */
    ljmp $0, $_lowstart

