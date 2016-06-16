src=_start.s _lowstart.s
obj=$(src:.s=.o)
mbr.bin: $(obj) link.ld
	ld -T link.ld $(obj)

clean:
	-rm -f *.o
	-rm -f mbr.bin
