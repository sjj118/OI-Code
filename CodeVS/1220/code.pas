var
  n,i,j:longint;
  a,f:array[1..100,1..101]of longint;
  function max(a,b:longint):longint;
  begin
    if a>b then max:=a else max:=b;
  end;
begin
  readln(n);
  for i:=1 to n do begin
    for j:=1 to i do read(a[i,j]);
    readln;
  end;
  for i:=1 to n do f[n,i]:=a[n,i];
  for i:=n-1 downto 1 do begin
    for j:=1 to i do begin
      f[i,j]:=max(f[i+1,j],f[i+1,j+1])+a[i,j];
    end;
  end;
  writeln(f[1,1]);
end.
