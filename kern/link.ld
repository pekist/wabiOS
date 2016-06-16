OUTPUT_FORMAT(binary)
OUTPUT(kern.bin)
ENTRY(_start)

SECTIONS
{
    .text 0x7c00 : 
    {
        *(.text)
        *(.data)
        *(.bss)
    }
}
