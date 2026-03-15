/* linker.ld */

/* 1. Define the Entry Point */
ENTRY(_start)

SECTIONS
{
    /* 2. Set the starting address for QEMU RISC-V RAM */
    . = 0x80000000;

    /* 3. The Executable Code (Text) */
    .text : {
        KEEP(*(.text.boot)) /* Ensure our assembly start code isn't deleted */
        *(.text .text.*)    /* All other C++ code */
    }

    /* 4. Read-Only Data (Constants like strings) */
    .rodata : {
        *(.rodata .rodata.*)
    }

    /* 5. Initialized Data (Global variables with a value) */
    .data : {
        *(.data .data.*)
    }

    /* 6. Uninitialized Data (Variables starting at zero) */
    .bss : {
        *(.bss .bss.*)
        *(COMMON)
    }

    /* 7. Define the Stack (grows downwards) */
    . = ALIGN(16);          /* RISC-V likes 16-byte alignment */
    . += 0x4000;            /* Reserve 16KB for the stack */
    _stack_top = .;         /* Mark the top of the stack */
}