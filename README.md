# ARM Cortex-M3/M4  on Linux, gcc and freesoftware

the goal is to:
* buy a cheap stm32 cortex-m3 module and a SWD programmer
  * example kit: [https://www.aliexpress.com/item/STM32F103C8T6/32779896380.html] ~$8
  * contains a simple stm32f103 based module, similar to (or the same as) the [Blue Pill](http://wiki.stm32duino.com/index.php?title=Blue_Pill)
  * Jlink OB ARM emulator debugger (clone of the Segger jlink device)
  * also have an stm32 st-link v2 programmer which is < $2 on aliexpress

* use only gcc, openocd, gdb and other free software to develop, flash and debug them
* don't use Eclipse or any other bloatware IDEs or stuff

# Plan
* make a minimal blinky program in C
* serial communication in C
* bootloader (STM32duino)
* try Rust
* try FreeRTOS/Apache mynewt
* try to port the learned knowledge to a nrf52 cortex-m4 µC

# Requirements
* GNU/Linux distro (I use Arch)
* arm-none-eabi-binutils (tested with 2.30)
* arm-none-eabi-gcc (7.3.0)
* arm-none-eabi-gdb (8.1)
* arm-none-eabi-newlib (3.0.0)
* stlink 1.5.0

# Resources:
* [http://electronut.in/stm32-start/]
* [https://electronics.stackexchange.com/questions/27594/]
* [https://en.wikipedia.org/wiki/List_of_ARM_Cortex-M_development_tools#C/C++_software_libraries]
* [https://blog.aignacio.com/http-wiki-stm32duino-com-index-php-title-blue_pill/]
* [https://github.com/satoshinm/pill_blink/]
