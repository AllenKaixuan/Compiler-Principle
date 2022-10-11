%{
//定义段
#include<iostream>
#include<vector>
#include<cstring>
#include<cctype>
using namespace std;
struct AT{
    double value=0;
    int index=0;
};

#ifndef YYSTYPE
#define YYSTYPE AT
#endif
int yylex();
extern int yyparse();
extern YYSTYPE yylval;
FILE* yyin;

char lexbuf[200];
int length=0;

struct symtable_descriptor{
    char* lexptr;
    double attributes;
};

char idStr[50];


vector<symtable_descriptor> symtable;

void yyerror(const char* s);
%}

%token ID
%token ADD
%token SUB
%token MUL
%token DIV
%token EQ
%token NUMBER
%right EQ
%left ADD SUB
%left MUL DIV
%right UMINUS

%%

lines : lines expr ';' {cout<<$2.value<<endl;}
    |lines ';'
    |
    ;
//规则段
// 上下文无关文法中自动忽略空格
expr:expr ADD expr {$$.value=$1.value+$3.value;}
    | expr  SUB expr {$$.value=$1.value-$3.value;}
    |expr MUL expr {$$.value=$1.value*$3.value;}
    |expr DIV expr {$$.value=$1.value/$3.value;}
    |ID EQ expr{$$.value=$3.value;symtable[$1.index].attributes=$3.value;}
    |'('expr')' {$$.value=$2.value;}
    |SUB expr%prec UMINUS{$$.value=-$2.value;}
    | NUMBER{$$.value=$1.value;}
    | ID{$$.value=symtable[$1.index].attributes;}
    ;


%%

//子代码段
void insertIntoSYMT(char*s){
    
    symtable_descriptor d;
    d.lexptr=s;
    d.attributes=0;
    symtable.push_back(d);
    
}

//找到返回索引,找不到就返回-1
int find(char*s){
    for(int i=0;i<symtable.size();i++){
        if(strcmp(symtable[i].lexptr,s)==0)
        {
            return i;
        }
    }
    return -1;
}

int yylex(){
    int t;
    
    while(1){
        t=getchar();
        if(t==' '|| t=='\t' || t=='\n')
            ;
        else if(isdigit(t)){
            yylval.value=0;
            while(isdigit(t)){
                yylval.value=yylval.value*10+t-'0';
                t=getchar();
            }
            ungetc(t,stdin);
            return NUMBER;
        }
         else if((t>='a'&&t<='z')||(t>='A'&&t<='Z')||t=='_'){
            int ti=0;
            while( (t>='a'&&t<='z') || (t>='A'&&t<='Z') || (t=='_') ||
            (t>='0' && t<='9')){
                    idStr[ti]=t;
                    ti++;
                    t=getchar();
            }
            idStr[ti]='\0';
            if(find(idStr)==-1){
                strcpy(lexbuf+length,idStr);
                char* s=lexbuf+length;
                length+=strlen(idStr)+1;
                insertIntoSYMT(s);
            }
            yylval.index=find(idStr);
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
                case '=':
                    return EQ;
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