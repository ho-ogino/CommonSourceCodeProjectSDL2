# X1turbo emulator build Makefile
CXXFLAGS = -std=c++17 -Wall -g -D_X1 -D_WINDOWS -D_DEBUG -DNDEBUG -D_RGB565 -DOSD_SDL2 $(shell sdl2-config --cflags)
TARGET = x1

# Windows用リソース・ライブラリもそのまま記述
WIN_LIBS =
RC_FILE = src/res/x1turbo.rc

SRCS = \
src/common.cpp \
src/config.cpp \
src/debugger.cpp \
src/emu.cpp \
src/fifo.cpp \
src/fileio.cpp \
src/vm/ay_3_891x.cpp \
src/vm/datarec.cpp \
src/vm/disk.cpp \
src/vm/event.cpp \
src/vm/fmgen/fmgen.cpp \
src/vm/fmgen/fmtimer.cpp \
src/vm/fmgen/opm.cpp \
src/vm/fmgen/opna.cpp \
src/vm/fmgen/psg.cpp \
src/vm/harddisk.cpp \
src/vm/hd46505.cpp \
src/vm/i8255.cpp \
src/vm/io.cpp \
src/vm/mb8877.cpp \
src/vm/mcs48.cpp \
src/vm/mz1p17.cpp \
src/vm/noise.cpp \
src/vm/pcm8bit.cpp \
src/vm/prnfile.cpp \
src/vm/scsi_dev.cpp \
src/vm/scsi_hdd.cpp \
src/vm/scsi_host.cpp \
src/vm/upd1990a.cpp \
src/vm/x1/cz8rb.cpp \
src/vm/x1/display.cpp \
src/vm/x1/emm.cpp \
src/vm/x1/floppy.cpp \
src/vm/x1/iobus.cpp \
src/vm/x1/joystick.cpp \
src/vm/x1/keyboard.cpp \
src/vm/x1/memory.cpp \
src/vm/x1/mouse.cpp \
src/vm/x1/psub.cpp \
src/vm/x1/sasi.cpp \
src/vm/x1/sub.cpp \
src/vm/x1/x1.cpp \
src/vm/ym2151.cpp \
src/vm/z80.cpp \
src/vm/z80ctc.cpp \
src/vm/z80sio.cpp \
src/sdl2/osd.cpp \
src/sdl2/osd_console.cpp \
src/sdl2/osd_input.cpp \
src/sdl2/osd_screen.cpp \
src/sdl2/osd_sound.cpp \
src/sdl2/sdl2main.cpp

OBJS = $(SRCS:.cpp=.o)


all: $(TARGET)

$(TARGET): $(OBJS) $(RC_FILE)
	$(CXX) $(CXXFLAGS) -o $@ $(OBJS) $(WIN_LIBS) $(shell sdl2-config --libs)

src/%.o: src/%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

src/vm/%.o: src/vm/%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

src/vm/fmgen/%.o: src/vm/fmgen/%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

src/vm/x1/%.o: src/vm/x1/%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

src/win32/%.o: src/win32/%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Windowsリソースファイルもそのまま記述（Macでは無視される）
$(RC_FILE):
	echo "Resource file: $@ (not processed on Mac)"

clean:
	rm -f $(OBJS) $(TARGET)

.PHONY: all clean