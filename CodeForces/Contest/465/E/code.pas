var
  s,k,t:ansistring;
  //f:array[1..100000]of char;
  //t:array[1..100000]of ansistring;
  f:char;
  n,i,j:longint;

  procedure replace(var s:ansistring;f:char;t:ansistring);
  var
    i,j,m,l:longint;
	k:ansistring;
  begin
    k:=s;
  i:=0;
    for j:=1 to length(s) do begin
    inc(i);
	  s[i]:=k[j];
	  if s[i]=f then begin
	    m:=1;
      l:=i;
	    while i<=l+length(t) do begin inc(i); s[i]:=t[m]; inc(m); end;
	  end;
	end;
  end;
begin
  readln(s);
  readln(n);
  for i:=1 to n do begin
    readln(k);
	f:=k[1];
  t:='';
	for j:=4 to length(k) do t:=t+k[j];
	replace(s,f,t);
  end;
  writeln(s);
end.
