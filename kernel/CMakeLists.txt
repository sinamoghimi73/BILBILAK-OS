# /kernel/CMakeLists.txt

# 1. CREATE the target first
add_executable(
    kernel.elf 
    boot.S 
    main.cpp
)

# 2. NOW you can link things to it
# (Make sure common_lib was defined in your root or /common/ folder)
target_link_libraries(kernel.elf PRIVATE common_lib)

# 3. Set options for the target
target_link_options(kernel.elf PRIVATE 
    -T ${CMAKE_CURRENT_SOURCE_DIR}/linker.ld
    -nostartfiles
)

# 4. Post-build conversion
add_custom_command(TARGET kernel.elf POST_BUILD
    COMMAND riscv64-unknown-elf-objcopy -O binary kernel.elf kernel.bin
    COMMENT "Converting ELF to raw binary..."
)