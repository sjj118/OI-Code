var
  n,i,j:longint;
  p,ss:array[0..100000]of longint;
  c:array[0..100000]of 0..1;
  f0,f1:array[0..100000]of int64;

  procedure de(x:longint);
  var
    i,pa:longint;
  begin
    if c[x]=1 then f1[x]:=f0[x] else f0[x]:=(f0[x]+f1[x])mod 1000000007;
    if x>0 then begin
      pa:=p[x];
      dec(ss[pa]);
	  f1[pa]:=(f1[pa]*f0[x]) mod 1000000007;
	  f1[pa]:=(f1[pa]+f0[pa]*f1[x]) mod 1000000007;
	  f0[pa]:=(f0[pa]*f0[x]) mod 1000000007;
      if(ss[pa]=0)then de(pa);
    end;
  end;

begin
  readln(n);
  for i:=1 to n-1 do read(p[i]);
  for i:=0 to n-1 do read(c[i]);
  for i:=1 to n-1 do inc(ss[p[i]]);
  for i:=0 to n-1 do f0[i]:=1;
  for i:=0 to n-1 do f1[i]:=0;
  for i:=0 to n-1 do if ss[i]=0 then de(i);
  writeln(f1[0]);
end.
