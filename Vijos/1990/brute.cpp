#include<iostream>
#include<cstdio>
#include<cstring>
#define rep(i,x,y) for(register int i=(x);i<=(y);++i)
#define per(i,x,y) for(register int i=(x);i>=(y);--i)
const int maxn=5e5+10,mo=1e9+9;
using namespace std;
int n,f[maxn];
char s[maxn];
int main(){
	freopen("code.in","r",stdin);freopen("brute.out","w",stdout);
	scanf("%s",s+1);n=strlen(s+1);
	f[0]=1;
	rep(i,1,n){
		rep(j,0,i-1)if(((i-j)&1)==0){
			bool flag=1;
			for(int k=j+1;k<=((i+j)>>1)&&flag;++k)if(s[k]=='W')flag=0;
			for(int k=((i+j)>>1)+1;k<=i&&flag;++k)if(s[k]=='B')flag=0;
			if(flag)f[i]=(f[i]+f[j])%mo;
		}
	}
	printf("%d",f[n]);
	return 0;
}
