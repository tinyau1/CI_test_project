CC=gcc
BIN=HelloWorld
SRC=CI_HelloWorld.c
CFLAGS+= -I./include
LIBFLAGS=
OBJS := $(SRC:.c=.o)

all: $(BIN) install 

$(OBJS): %.o: %.c
	$(CC) -c $(CFLAGS) $< -o $@

$(BIN): $(OBJS) 
	$(CC) $^ $(LIBFLAGS) -o $@ 

clean: uninstall
	@rm -f $(BIN) *.o 

install:
	@install -D $(BIN) bin/$(BIN)

uninstall:
	@rm -f bin/$(BIN)


