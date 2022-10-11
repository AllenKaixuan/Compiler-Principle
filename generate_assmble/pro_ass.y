%{
//定义段
#include<iostream>
#include<vector>
#include<cstring>
#include<cctype>
using namespace std;
struct AT{
    char* addr;
    string addr_s;
    string code;
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
    string addr_s;
};

char idStr[50];
char numStr[50];


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

lines : lines expr ';' {cout<<$2.code<<endl;}
    |lines ';'
    |
    ;
//规则段
// 上下文无关文法中自动忽略空格
expr:expr ADD expr {$$.addr=new char();
$$.addr_s=to_string(reinterpret_cast<long long>($$.addr));
                $$.code=$1.code+$3.code+"ldr r0 "+($1.addr_s)+"\n"
                +"ldr r1 "+($3.addr_s)+"\n"
                +"add r0 r0 r1\n"
                +"str r0 "+$$.addr_s+"\n";}
    | expr  SUB expr {$$.addr=new char();
                $$.addr_s=to_string(reinterpret_cast<long long>($$.addr));
                $$.code=$1.code+$3.code+"ldr r0 "+($1.addr_s)+"\n"
                +"ldr r1 "+($3.addr_s)+"\n"
                +"sub r0 r0 r1\n"
                +"str r0 "+$$.addr_s+"\n";}
    |expr MUL expr {$$.addr=new char();
                $$.addr_s=to_string(reinterpret_cast<long long>($$.addr));
                $$.code=$1.code+$3.code+"ldr r0 "+($1.addr_s)+"\n"
                +"ldr r1 "+$3.addr_s+"\n"
                +"mul r0 r0 r1\n"
                +"str r0 "+$$.addr_s+"\n";}
    |expr DIV expr {$$.addr=new char();
                $$.addr_s=to_string(reinterpret_cast<long long>($$.addr));
                $$.code=$1.code+$3.code+"ldr r0 "+($1.addr_s)+"\n"
                +"ldr r1 "+$3.addr_s+"\n"
                +"div r0 r0 r1\n"
                +"str r0 "+$$.addr_s+"\n";}
    |ID EQ expr{$$.addr=new char();
                $$.addr_s=to_string(reinterpret_cast<long long>($$.addr));
                $$.code=$3.code+"ldr r0 "+($3.addr_s)+"\n"+
                "str r0 "+symtable[$1.index].addr_s+"\n"
                "str r0 "+($$.addr_s)+"\n";}
    |'('expr')' {$$.code=$2.code;}
    |SUB expr%prec UMINUS{;}
    | NUMBER{$$.code=$1.code;$$.addr_s=$1.addr_s;}
    | ID{$$.addr_s=symtable[$1.index].addr_s; 
        $$.code=$1.code;
        cout<<"address:"<<($$.addr_s)<<endl;
       }
    ;

%%

//子代码段
void insertIntoSYMT(char*s,string addr_s=""){
    
    symtable_descriptor d;
    d.lexptr=s;
    d.addr_s=addr_s;
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
          int ti=0;
          while(t>='0' && t<='9'){
            numStr[ti]=t;
            t=getchar();
            ti++;
          }
          numStr[ti]='\0';
          yylval.addr_s=(string)"="+numStr;
          yylval.code="";
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

                yylval.addr=new char();
                yylval.addr_s=to_string(reinterpret_cast<long long>(yylval.addr));
                yylval.code="";

                insertIntoSYMT(s,yylval.addr_s);
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