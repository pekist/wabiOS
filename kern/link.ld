OUTPUT_FORMAT(binary)
OUTPUT(kern.bin)
ENTRY(_start)

SECTIONS
{
    .text 0x7c00 : 
    {
        *(.text)
        *(.bss)
    }

     
    .data ALIGN(0x10) :
    {
        *(.data)
    }

    .bss ALIGN(0x10) :
    {
        *(.bss)
    }
}
