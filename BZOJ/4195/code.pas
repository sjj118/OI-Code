var
	t,n,i,test,tot,cnt,a,b,c:longint;
	pa,rank,head,next,key,q1,q2:array[0..2000006]of longint;
	flag:boolean;
	
	procedure init;
	var
		i:longint;
	begin
		fillchar(rank,sizeof(rank),0);
		fillchar(key,sizeof(key),0);
		fillchar(head,sizeof(head),0);
		fillchar(next,sizeof(next),0);
		for i:=1 to n*2 do pa[i]:=i;
	end;
	
	function find(x:longint):longint;
	begin
		if pa[x]=x then exit(x);
		find:=find(pa[x]);
		pa[x]:=find;
	end;
	
	function judge(a,b:longint):boolean;
	begin
		a:=find(a);
		b:=find(b);
		exit(a=b);
	end;

	procedure union(a,b:longint);
	begin
		a:=find(a);
		b:=find(b);
		if a=b then exit;
		if rank[a]>rank[b] then begin
			pa[b]:=a;
		end else begin
			pa[a]:=b;
			if rank[a]=rank[b] then inc(rank[b]);
		end;
	end;
	
	function h(x:longint):longint;
	begin
		exit(x mod 2000007);
	end;
	
	function get(k:longint):longint;
	var
		p,t:longint;
	begin
		t:=h(k);
		p:=head[t];
		while p>0 do begin
			if key[p]=k then exit(p);
			p:=next[p];
		end;
		inc(cnt);
		key[cnt]:=k;
		next[cnt]:=head[t];
		head[t]:=cnt;
		exit(cnt);
	end;
begin
	readln(t);
	for test:=1 to t do begin
		readln(n);
		init;
		cnt:=0;
		tot:=0;
		for i:=1 to n do begin
			readln(a,b,c);
			if c=0 then begin
				inc(tot);
				q1[tot]:=get(a);
				q2[tot]:=get(b);
			end else begin
				union(get(a),get(b));
			end;
		end;
		flag:=false;
		for i:=1 to tot do if judge(q1[i],q2[i]) then begin
			flag:=true;
			break;
		end;
		if flag then writeln('NO') else writeln('YES');
	end;
end.
