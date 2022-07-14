TOOLCHAIN=C:\cygwin64\bin\
CC=$(TOOLCHAIN)gcc
BIN=HelloWorld
SRC=CI_HelloWorld.c
CFLAGS+= -I./include
LIBFLAGS=
OBJS := $(SRC:.c=.o)

all: $(BIN) install 

$(OBJS): %.o: %.c
	C:\cygwin64\bin\gcc.exe -c $(CFLAGS) $< -o $@

$(BIN): $(OBJS) 
	C:\cygwin64\bin\gcc.exe $^ $(LIBFLAGS) -o $@ 

clean: uninstall
	@rm -f $(BIN) *.o 

install:
	@install -D $(BIN) bin/$(BIN)

uninstall:
	@rm -f bin/$(BIN)


