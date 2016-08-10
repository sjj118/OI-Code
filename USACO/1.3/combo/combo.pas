{
ID: sjj22451
LANG: PASCAL
PROB: combo
}
var
  n,i,i1,i2,i3,ans:longint;
  a,b:array[1..3]of longint;

  function nearby(a,b:longint):boolean;
  begin
	if abs(a-b)<=2 then exit(true);
	if abs(a-b)>=n-2 then exit(true);
        exit(false);
  end;

  function close_enough(a,b,c,x,y,z:longint):boolean;
  begin
    exit(nearby(a,x) and nearby(b,y) and nearby(c,z));
  end;

begin
  assign(input,'combo.in');reset(input);assign(output,'combo.out');rewrite(output);
  readln(n);
  for i:=1 to 3 do read(a[i]);
  for i:=1 to 3 do read(b[i]);
  ans:=0;
  for i1:=1 to n do begin
    for i2:=1 to n do begin
	  for i3:=1 to n do begin
	    if close_enough(i1,i2,i3,a[1],a[2],a[3])or close_enough(i1,i2,i3,b[1],b[2],b[3]) then inc(ans);
	  end;
	end;
  end;
  writeln(ans);
  close(input);close(output);
end.
