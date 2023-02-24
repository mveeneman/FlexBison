/* Reverse polish notation calculator. */

%{
#define YYSTYPE double
#include <stdio.h>
#include <math.h>

int yylex();
void yyerror(char *s);

%}

%token NUMBER
%token TOKHEAT
%token STATE
%token TOKTARGET
%token TOKTEMPERATURE

%% /* Grammar rules and actions follow */

commands: /* empty */
        | commands command
        ;

command:
        heat_switch
        |
        target_set
        ;

heat_switch:
        TOKHEAT STATE
        {
                printf("\tHeat turned on or off\n");
        }
        ;

target_set:
        TOKTARGET TOKTEMPERATURE NUMBER
        {
                printf("\tTemperature set\n");
        }
        ;
%%

int
main() {
  yyparse ();
}

void yyerror (s)  /* Called by yyparse on error */
     char *s;
{
  printf ("%s\n", s);
}