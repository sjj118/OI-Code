var
	n,m,i,j,k,ans:longint;
	v,w,q1:array[1..60]of longint;
	q:array[1..60,0..2]of longint;
	f:array[0..60,0..32000]of longint;
	
	function max(a,b:longint):longint;
	begin
		if a>b then exit(a) else exit(b);
	end;
begin
	readln(n,m);
	for i:=1 to m do begin
		readln(v[i],w[i],q1[i]);
		if q1[i]=0 then continue;
		inc(q[q1[i],0]);
		q[q1[i],q[q1[i],0]]:=i;
	end;
	for i:=1 to m do begin
		for j:=0 to n do f[i,j]:=f[i-1,j];
		if q1[i]=0 then begin
			for j:=n downto v[i] do f[i,j]:=max(f[i,j],f[i-1,j-v[i]]+v[i]*w[i]);
			if q[i,0]>=1 then for j:=n downto v[i]+v[q[i,1]] do f[i,j]:=max(f[i,j],f[i-1,j-v[i]-v[q[i,1]]]+v[i]*w[i]+v[q[i,1]]*w[q[i,1]]);
			if q[i,0]>=2 then for j:=n downto v[i]+v[q[i,2]] do f[i,j]:=max(f[i,j],f[i-1,j-v[i]-v[q[i,2]]]+v[i]*w[i]+v[q[i,2]]*w[q[i,2]]);
			if q[i,0]>=2 then for j:=n downto v[i]+v[q[i,1]]+v[q[i,2]] do f[i,j]:=max(f[i,j],f[i-1,j-v[i]-v[q[i,1]]-v[q[i,2]]]+v[i]*w[i]+v[q[i,2]]*w[q[i,2]]+v[q[i,1]]*w[q[i,1]]);
		end;
	end;
	for i:=0 to n do ans:=max(ans,f[m,i]);
	writeln(ans);
end.
