#include "uart.hpp"

extern "C" void kernel_main() {
    Drivers::Uart console;

    console.print("------------------------------------\n");
    console.print(" Welcome to BILBILAK OS!            \n");
    console.print(" Status: Booted at 0x80000000       \n");
    console.print("------------------------------------\n");

    // Keep the CPU alive but idle
    while (true) {
        asm volatile("wfi");
    }
}