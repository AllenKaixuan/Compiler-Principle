%{
//定义段
#include<iostream>
#include<vector>
#include<cstring>
#include<cctype>
using namespace std;

#ifndef YYSTYPE
#define YYSTYPE double
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

lines : lines expr ';' {cout<<$2<<endl;}
    |lines ';'
    |
    ;
//规则段
// 上下文无关文法中自动忽略空格
expr:expr ADD expr {$$=$1+$3;}
    | expr  SUB expr {$$=$1-$3;}
    |expr MUL expr {$$=$1*$3;}
    |expr DIV expr {$$=$1/$3;}
    |ID EQ NUMBER{$$=$3;}
    |'('expr')' {$$=$2;}
    |SUB expr%prec UMINUS{$$=-$2;}
    | NUMBER{$$=$1;}
    | ID{$$=$1;}
    ;


%%

//子代码段
void insertIntoSYMT(char*s,double attributes){
    
    symtable_descriptor d;
    d.lexptr=s;
    d.attributes=attributes;
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
            yylval=0;
            while(isdigit(t)){
                yylval=yylval*10+t-'0';
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

            //如果在符号表中没找到
            
            if(find(idStr)==-1){
                
                if(t=='='){
                    t=getchar();

                    if(isdigit(t)){
                        char num[100];
                        int count=0;
                        YYSTYPE sum=0;
                          while(isdigit(t)){
                              num[count++]=t;
                              sum=sum*10+t-'0';
                              t=getchar();
                          }

                        ungetc(t,stdin);

                        for(int i=count-1;i>=0;i--){
                            ungetc(num[i],stdin);
                        }

                    t='=';
                strcpy(lexbuf+length,idStr);
                char* s=lexbuf+length;
                length+=strlen(idStr)+1;
                insertIntoSYMT(s,sum);
                yylval=sum;
        }
                }
            }
            //如果在符号表中找到了
            else{
                if(t=='='){
                    t=getchar();
                    if(isdigit(t)){
                    char num[100];
                    int count=0;
                    YYSTYPE sum=0;
                while(isdigit(t)){
                    num[count++]=t;
                    sum=sum*10+t-'0';
                    t=getchar();
                }
                ungetc(t,stdin);
                for(int i=count-1;i>=0;i--){
                    ungetc(num[i],stdin);
                }
                t='=';
                symtable[find(idStr)].attributes=sum;
                }
                }
                yylval=symtable[find(idStr)].attributes;
            }
            
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