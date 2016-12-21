PSVITAIP=$(VITAIP)

TITLE_ID = VSDK00001
TITLE_ID = MYLEGNOOB
TARGET   = HappyLand
OBJS     = main.o

LIBS = -lvita2d -lSceKernel_stub -lSceDisplay_stub -lSceGxm_stub \
	-lSceSysmodule_stub -lSceCtrl_stub -lScePgf_stub \
	-lSceCommonDialog_stub -lSceAudio_stub -lSceTouch_stub -lfreetype -lpng -ljpeg -lz -lm -lc -llua

PREFIX  = arm-vita-eabi
CC      = $(PREFIX)-gcc
CXX = $(PREFIX)-g++
CFLAGS  = -Wl,-q -Wall -O3
CXXFLAGS = $(CFLAGS)
ASFLAGS = $(CFLAGS)




all: $(TARGET).vpk

%.vpk: eboot.bin
	vita-mksfoex -s TITLE_ID=$(TITLE_ID) "$(TARGET)" param.sfo
	vita-pack-vpk -s param.sfo -b eboot.bin $@

eboot.bin: $(TARGET).velf
	vita-make-fself $< $@

%.velf: %.elf
	vita-elf-create $< $@

$(TARGET).elf: $(OBJS)
	$(CC) $(CFLAGS) $^ $(LIBS) -o $@

%.o: %.png
	$(PREFIX)-ld -r -b binary -o $@ $^

clean:
	@rm -rf $(TARGET).vpk $(TARGET).velf $(TARGET).elf $(OBJS) \
		eboot.bin param.sfo

vpksend: $(TARGET).vpk
	curl -T $(TARGET).vpk ftp://$(PSVITAIP):1337/ux0:/_stuffz/
	@echo "Sent."

send: eboot.bin
	@echo "The environment variable for the IP is VITAIP. Make sure to set it."
	curl -T eboot.bin ftp://$(PSVITAIP):1337/ux0:/app/$(TITLE_ID)/
	@echo "Sent."