#include<algorithm>
#include<iostream>
#include<cstdio>
#define rep(i,x,y) for(register int i=(x);i<=(y);++i)
#define per(i,x,y) for(register int i=(x);i>=(y);--i)
const int maxn=1e6+10;
using namespace std;
inline int read(){int tmp=0;char c=getchar();while(c<'0'||c>'9')c=getchar();while(c>='0'&&c<='9')tmp=tmp*10+c-'0',c=getchar();return tmp;}
int n,pre[maxn][2],f[maxn][3];
struct Waiter{
	int h,p;
}a[maxn];
bool operator<(Waiter a,Waiter b){return a.h<b.h||a.h==b.h&&a.p<b.p;}
int find(int x,int y,int p){
	int l=x-1,r=y;
	while(l<r){
		int m=(l+r+1)>>1;
		if(a[m].p<p)l=m;else r=m-1;
	}
	if(l==x-1)return 0;return l;
}
int main(){
	freopen("code.in","r",stdin);freopen("code.out","w",stdout);
	n=read();
	rep(i,1,n)a[i].h=read(),a[i].p=i;
	sort(a+1,a+1+n);
	for(int i=0,j=1;j<=n;++i,++j){
		while(i<j-1)++i;
		pre[a[j].p][1]=i;
		while(j<n&&a[j].h==a[j+1].h)pre[a[j+1].p][0]=j,++j,pre[a[j].p][1]=i;
	}
	rep(i,1,n){
		if(pre[i][0]){
			f[i][0]=f[a[pre[i][0]].p][0]+1;
			f[i][1]=max(f[a[pre[i][0]].p][1]+1,f[i][0]);
			if(a[pre[i][1]].p<i)f[i][2]=max(f[a[pre[i][0]].p][2]+1,f[a[pre[i][1]].p][1]+1);
			else f[i][2]=max(f[a[pre[i][0]].p][2]+1,f[a[find(pre[a[pre[i][1]].p][1]+1,pre[i][1],i)].p][0]+1);
		}else{
			f[i][0]=1;
			if(a[pre[i][1]].p<i)f[i][1]=max(f[i][1],f[a[pre[i][1]].p][1]+1);
			else f[i][1]=max(f[i][1],f[a[find(pre[a[pre[i][1]].p][1]+1,pre[i][1],i)].p][0]+1);
			f[i][1]=max(f[i][0],f[i][1]);
		}
	}
	int ans=0;
	rep(i,1,n)ans=max(ans,max(f[i][0],max(f[i][1],f[i][2])));
	printf("%d",n-ans);
	return 0;
}
