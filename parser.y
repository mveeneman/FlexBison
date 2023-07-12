%{

#include <stdio.h>
#include <math.h>

int yylex();
void yyerror(char *s);

%}

%union {
        int intValue;              /* Constant integer value */
        float floatValue;           /* Constant floating point value */
        char *strValue;             /* Ptr to constant string (strings are malloc'd) */
};

%token NUMBER
%token TOKHEAT
%token STATE
%token TOKTARGET
%token TOKTEMPERATURE

%type <strValue> STATE
%type <intValue> NUMBER

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
        TOKHEAT STATE { printf("\tHeat turned %s\n",$2); };

target_set:
        TOKTARGET TOKTEMPERATURE NUMBER { printf("\tTemperature set to %d Fahrenheit\n", $3); };
%%

int
main() {
  yyparse ();
}

void yyerror(char *s) {
    fprintf(stderr, "%s\n", s);
}