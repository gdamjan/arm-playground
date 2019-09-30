# `bluepill-blink`

> Based on [blue-pill-quickstart](https://github.com/TeXitoi/blue-pill-quickstart)

``` console
$ rustup target add thumbv7m-none-eabi
$ cargo build --release
$ arm-none-eabi-objcopy  -Obinary target/thumbv7m-none-eabi/release/bluepill-blink bluepill-blink.bin
$ dfu-util -a 0 -d 0483:df11 -s 0x08002000:leave -D bluepill-blink.bin
```

Note: This bluepill has a [dfu bootloader](https://github.com/daniel-thompson/i2c-star/tree/master/src/bootloader),
so the usable flash starts 8k after its begining (hence 0x08002000 in dfu-util). See `memory.x`. The
bootloader was flashed with jlink/st-link.
