%{
//定义段
#include<stdio.h>
#include<stdlib.h>
#include<ctype.h>
#ifndef YYSTYPE
#define YYSTYPE double
#endif
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
%left ADD SUB
%left MUL DIV
%right UMINUS

%%

lines : lines expr ';' {printf("%f\n",$2);}
    |lines ';'
    |
    ;
//规则段
// 上下文无关文法中自动忽略空格
expr:expr ADD expr {$$=$1+$3;}
    | expr  SUB expr {$$=$1-$3;}
    |expr MUL expr {$$=$1*$3;}
    |expr DIV expr {$$=$1/$3;}
    |'('expr')' {$$=$2;}
    |SUB expr%prec UMINUS{$$=-$2;}
    | NUMBER
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
            yylval=0;
            while(isdigit(t)){
                yylval=yylval*10+t-'0';
                t=getchar();
            }
            ungetc(t,stdin);
            return NUMBER;
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