{
ID:sjj22451
LANG:PASCAL
PROB:gift1
}
var
  n,i,j,k,f,q:longint;
  a:string;
  name:array[1..10]of string;
  m,l:array[1..10]of longint;
begin
  assign(input,'gift1.in');reset(input);
  assign(output,'gift1.out');rewrite(output);
  readln(n);
  fillchar(l,sizeof(l),0);
  for i:=1 to n do readln(name[i]);
  for i:=1 to n do begin
    readln(a);
	k:=1;
	while a<>name[k] do inc(k);
	readln(m[k],j);
        if j=0 then continue;
	f:=m[k] div j;
	m[k]:=m[k]-(m[k] mod j);
	for k:=1 to j do begin
	  readln(a);
	  q:=1;
	  while a<>name[q] do inc(q);
	  l[q]:=l[q]+f;
	end;
  end;
  for i:=1 to n do writeln(name[i],' ',l[i]-m[i]);
  close(input);
  close(output);
end.
