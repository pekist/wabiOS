OUTPUT_FORMAT(binary)
OUTPUT(mbr.bin)
ENTRY(_start)

SECTIONS
{
    .text 0x600 : 
    {
        *(.text)
        *(.data)
    }
    . = 0x7b4;
    UID = .;
    PT1 = . + 0x0a;
    PT2 = . + 0x1a;
    PT3 = . + 0x2a;
    PT4 = . + 0x3a;
}
