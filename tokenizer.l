%{

#include <stdio.h>
#include "parser.tab.h"

%}

%%
[0-9]+                  yylval.intValue=atoi(yytext); return NUMBER;
heat                    return TOKHEAT;
on|off                  yylval.strValue=strdup(yytext); return STATE;
target                  return TOKTARGET;
temperature             return TOKTEMPERATURE;
\n                      /* ignore end of line */;
[ \t]+                  /* ignore whitespace */;
%%