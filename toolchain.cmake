# toolchain.cmake

# 1. Set the Target System
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR riscv64)

# 2. Define the Cross-Compiler
# Note: Ensure these are in your system PATH
set(CMAKE_C_COMPILER riscv64-unknown-elf-gcc)
set(CMAKE_CXX_COMPILER riscv64-unknown-elf-g++)

# 3. Bare-Metal (Freestanding) Flags
# -ffreestanding: Don't assume a standard library exists.
# -fno-exceptions / -fno-rtti: Disable heavy C++ features that require an OS.
# -nostdlib: Don't link against the system's C library.
# -mcmodel=medany: Required for RISC-V to handle the 0x80000000 address range.
set(COMMON_FLAGS "-ffreestanding -fno-exceptions -fno-rtti -nostdlib -mcmodel=medany -Wall -Wextra")

set(CMAKE_C_FLAGS "${COMMON_FLAGS}" CACHE STRING "" FORCE)
set(CMAKE_CXX_FLAGS "${COMMON_FLAGS}" CACHE STRING "" FORCE)

# 4. Critical for OS Dev: Don't try to run a test program!
# Usually, CMake tries to compile and RUN a "Hello World" to check the compiler.
# On an OS, that test would fail because there is no environment to run it in yet.
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)