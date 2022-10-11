%{
//定义段
#include<stdio.h>
#include<stdlib.h>
#include<ctype.h>
#include<string.h>
#ifndef YYSTYPE
#define YYSTYPE char*
#endif
char idStr[50];
char numStr[50];
int yylex();
extern int yyparse();
extern YYSTYPE yylval;
FILE* yyin;
void yyerror(const char* s);
%}

%token ADD
%token SUB
%token MUL
%token DIV
%token NUMBER
%token ID
%left ADD SUB
%left MUL DIV
%right UMINUS

%%

lines : lines expr ';' {printf("%s\n",$2);}
    |lines ';'
    |
    ;
//规则段
// 上下文无关文法中自动忽略空格
expr:expr ADD expr {$$=(char*)malloc(50*sizeof(char));strcpy($$,$1);
strcat($$,$3);strcat($$,"+ ");}
    | expr  SUB expr {$$=(char*)malloc(50*sizeof(char));strcpy($$,$1);
strcat($$,$3);strcat($$,"- ");}
    |expr MUL expr {$$=(char*)malloc(50*sizeof(char));strcpy($$,$1);
strcat($$,$3);strcat($$,"* ");}
    |expr DIV expr {$$=(char*)malloc(50*sizeof(char));strcpy($$,$1);
strcat($$,$3);strcat($$,"/ ");}
    |'('expr')' {$$=(char*)malloc(50*sizeof(char));strcpy($$,$2);
}
    |SUB expr%prec UMINUS{$$=(char*)malloc(50*sizeof(char));strcpy($$,$1);
strcat($$,"- ");}
    | NUMBER{$$=(char*)malloc(50*sizeof(char));strcpy($$,$1);
        strcat($$," ");}
    | ID{$$=(char*)malloc(50*sizeof(char));strcpy($$,$1);
        strcat($$," ");}
    ;


%%

//子代码段
int yylex(){
    int t;
    
    while(1){
        t=getchar();
        if(t==' '|| t=='\t' || t=='\n')
            ;
        else if(isdigit(t)){
          int ti=0;
          while(t>='0' && t<='9'){
            numStr[ti]=t;
            t=getchar();
            ti++;
          }
          numStr[ti]='\0';
          yylval=numStr;
          ungetc(t,stdin);
          return NUMBER;
        }
        else if((t>='a' && t<='z') || (t>='A' && t<='Z') || (t=='_')){
            int ti=0;
            while((t>='a' && t<='z') ||(t>='A' && t<='Z')||(t=='_')||(t>='0'&&t<='9')){
                idStr[ti]=t;
                ti++;
                t=getchar();
            }
            idStr[ti]='\0';
            yylval=idStr;
            ungetc(t,stdin);
            return ID;
        }
        else{
        switch(t){
            case '+':
                return ADD;
            case '-':
                return SUB;
            case '*':
                return MUL;
            case '/':
                return DIV;
            default:
                return t;
            }
    }

    }
   
}

int main(void){
    yyin=stdin;
    do{
        yyparse();
    }while(!feof(yyin));
    return 0;
}

void yyerror(const char* s){
    fprintf(stderr,"Parse error:%s\n",s);
    exit(1);
}