CC=cc
CFLAGS=-O2 -lc -ll

all: parser

tokenizer.c: tokenizer.l parser.tab.c
	flex -o $@ $<

parser.tab.c: parser.y
	bison -d $<

parser: tokenizer.c parser.tab.c
	 $(CC) parser.tab.c tokenizer.c -o parser $(CFLAGS)

clean:
	rm -f parser parser.tab.c parser.tab.h tokenizer.c
