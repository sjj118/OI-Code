var
  n,i:longint;
  x,y,l,r:real;

  function roundup(a:real):longint;
  begin
    if a-trunc(a)=0 then roundup:=trunc(a) else roundup:=trunc(a)+1;
  end;
begin
  readln(n);
  for i:=1 to n do begin
    readln(x,y);
	l:=sqrt(x*x+y*y);
	writeln('Property ',i,': This property will begin eroding in year ',roundup(l*l*pi/2/50),'.');
  end;
  write('END OF OUTPUT.');
end.
