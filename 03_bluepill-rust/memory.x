MEMORY
{
  /* Bluepill STM32F103C8T6 with a DFU bootloader
   * 128K flash (8K taken for DFU bootloader), 20K RAM. */
  FLASH : ORIGIN = 0x08002000, LENGTH = 120K
  RAM : ORIGIN = 0x20000000, LENGTH = 20K
}
