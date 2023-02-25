# Example Flex and Bison

A quick example to get yourself started with Flex and Bison.
If you want to start creating a quick parser out of the box, it may take too long to get a basic setup working.
This repo is meant to get you started.

Flex and Bison are the GNU based succesors for Lex and Yacc.
Flex builds a tokenizer and together with Bison creates a parser.

Build flow to create the parser
```mermaid
graph TD;
    A[parser.c]-->B[parser.tab.h];
    A-->C[parser.tab.c];
    B-->D[tokenizer.c];
    E[tokenizer.l]-->D;
    C-->F[parser]
    B-->F
    D-->F
```

## Mac OSX

```
brew install flex bison
```

## Linux

```
sudo apt install flex bison
```

