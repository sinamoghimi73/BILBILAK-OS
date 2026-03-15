# boot.S

.section .text.boot     # Match the section name in linker.ld
.global _start          # Make this label visible to the linker

_start:
    # 1. Set the Stack Pointer (sp)
    # We use the '_stack_top' symbol we defined in linker.ld
    la sp, _stack_top

    # 2. Jump to our C++ kernel_main
    # 'tail' is a jump that doesn't expect to return
    tail kernel_main

.loop:
    # If kernel_main ever returns (it shouldn't), 
    # we put the CPU in a low-power wait state.
    wfi
    j .loop