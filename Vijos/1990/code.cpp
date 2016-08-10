#include<iostream>
#include<cstdio>
#include<cstring>
#define rep(i,x,y) for(register int i=(x);i<=(y);++i)
#define per(i,x,y) for(register int i=(x);i>=(y);--i)
const int maxn=5e5+10,mo=1e9+9;
typedef long long LL;
using namespace std;
inline int lowbit(int x){return x&(-x);}
inline void ck(int&x){if(x<mo)x+=mo;if(x>=mo)x-=mo;}
inline void ad(int&x,int y){x+=y;ck(x);}
int n,f[maxn];
char s[maxn];
int sum,q;
struct LinkMap{
	int tot,head[maxn],to[maxn],next[maxn];
	void ins(int a,int b){if(a>n)return;to[++tot]=b;next[tot]=head[a];head[a]=tot;}
	void work(int k){
		for(int p=head[k];p;p=next[p]){if(to[p]>=q)ad(sum,-f[to[p]]);f[to[p]]=0;}
	}
}lp;
int next[maxn];
int main(){
	freopen("code.in","r",stdin);freopen("code.out","w",stdout);
	char c=getchar();
	while(c=='B'||c=='W'||c=='?')s[++n]=c,c=getchar();
	if(n&1){puts("0");return 0;}
	next[n]=n+1;per(i,n-1,0)if(s[i+1]=='W')next[i]=i+1;else next[i]=next[i+1];
	for(int i=0;i<=n;i+=2)lp.ins(next[i]+next[i]-i,i);
	f[0]=1;sum=1;
	for(int i=2,j=0;i<=n;i+=2){
		lp.work(i-1);lp.work(i);
		if(s[i]=='B')j=i,q=i,sum=0;
		else if(s[i-1]=='B')j=i-1,q=i-2,sum=f[i-1]+f[i-2],ck(sum);
		else ad(sum,(q-1>=0)?f[q-1]:0),ad(sum,(q-2>=0)?f[q-2]:0),q=max(0,q-2);
		f[i]=sum;
		ad(sum,f[i]);
	}
	printf("%d",f[n]);
	return 0;
}
