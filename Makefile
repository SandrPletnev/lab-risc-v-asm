.PHONY: clean

dump_name=MatrixPosNeg.dump
executable_name=MatrixPosNeg.elf

default: $(dump_name) $(executable_name)

%.elf : %.c
	@riscv64-unknown-elf-gcc -march=rv32i -O3 -mabi=ilp32 $< -o $@

%.dump: %.elf
	@riscv64-unknown-elf-objdump -D $< > $@

clean:
	@rm -f $(dump_name)
	@rm -f $(executable_name)
