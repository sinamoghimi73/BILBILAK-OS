#pragma once
#include <cstdint>

namespace Drivers {

class Uart {
public:
    // The base address for UART0 on QEMU's RISC-V 'virt' board
    static constexpr uintptr_t UART0 = 0x10000000;

    void putc(char c) {
        // We cast the address to a volatile pointer.
        // Writing to this address sends the byte to the serial console.
        volatile uint8_t* ptr = reinterpret_cast<uint8_t*>(UART0);
        *ptr = static_cast<uint8_t>(c);
    }

    void print(const char* str) {
        while (*str) {
            putc(*str++);
        }
    }
};

} // namespace Drivers