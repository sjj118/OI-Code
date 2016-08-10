#include<iostream>
#include<cstdio>
#define rep(i,x,y) for(register int i=(x);i<=(y);++i)
#define per(i,x,y) for(register int i=(x);i>=(y);--i)
const int maxn=1e8;
typedef long long LL;
using namespace std;
int tot,prime[maxn],s[maxn];
void pre(){
	rep(i,2,maxn-1){
		if(!s[i])prime[++tot]=i;
		for(int j=1;j<=tot&&i*prime[j]<maxn;++j){
			s[i*prime[j]]=1;
			if(i%prime[j]==0)break;
		}
	}
}
int pp[5];
LL merge(LL a,LL b){
	LL t=b;
	while(t)t/=10,a*=10;
	return a+b;
}
void dfs(int k,int last){
	if(k==6){
		printf("%d\n",pp[1]+pp[2]+pp[3]+pp[4]+pp[5]);
		return;
	}
	rep(i,last+1,tot){
		bool flag=1;rep(j,1,k-1){
			LL t1=merge(pp[j],prime[i]),t2=merge(prime[i],pp[j]);
			if(t1>=maxn||t2>=maxn)return;
			if(s[t1]||s[t2])flag=0;
		}
		if(flag)pp[k]=prime[i],dfs(k+1,i);
	}
}
int main(){
	pre();
	dfs(1,0);
	system("pause");
	return 0;
}
