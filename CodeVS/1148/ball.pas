var
  n,m,i,j,k:longint;
  f:array[0..30,1..30]of longint;
begin
  readln(n,m);
  fillchar(f,sizeof(f),0);
  f[0,1]:=1;
  for i:=1 to m do begin
    j:=1;
    f[i,j]:=f[i-1,n]+f[i-1,j+1];
    for j:=2 to n-1 do
      f[i,j]:=f[i-1,j+1]+f[i-1,j-1];
    j:=n;
    f[i,j]:=f[i-1,j-1]+f[i-1,1];
  end;
  writeln(f[m,1]);
end.