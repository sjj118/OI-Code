var
  n,i,top:longint;
  t:array[1..10000,1..10000]of char;
  l,r,len:array[1..10000]of longint;

  function get(k:longint):char;
  var
    i:longint;
  begin
    for i:=1 to len[k] do begin
	  if t[k,i]='0' then begin
	    if get='I' then exit('F') else get:='B';
	  end else begin
	    if get='B' then exit('F') else get:='I';
	  end;
	end;
  end;

  procedure go(k:longint);
  begin
    if l[k]>0 then begin
	  go(l[k]);
	  go(r[k]);
	end;
	write(get(k));
  end;

  function length(s:longint):longint;
  var
    i:longint;
  begin
    i:=0;
    while ord(t[s,i+1])>0 do inc(i);
    exit(i);
  end;
begin
  readln(n);
  readln(t[1]);
  i:=0;
  top:=1;
  n:=length(1);
  len[1]:=n;
  while n>1 do begin
    inc(i);
    n:=len[i];
    if n>1 then begin
	  inc(top);
	  l[i]:=top;
          len[top]:=n div 2;
	  t[top]:=copy(t[i],1,n div 2);
	  inc(top);
          len[top]:=n div 2;
	  r[i]:=top;
	  t[top]:=copy(t[i],(n+1)div 2+1,n div 2);
	end;
  end;
  go(1);
end.
