var
  n,maxx,ii:longint;
  a:array[1..20]of string;
  s:string;

  function time(p,sub:string):longint;
  var
    w:longint;
  begin
    time:=0;
	w:=pos(sub,p);
	while w<>0 do begin
	  inc(time);
	  p:=copy(p,w+1,length(p)-w);
	  w:=pos(sub,p);
	end;
  end;

  function startwith(p,sub:string):boolean;
  begin
    if (length(p)>length(sub))and(pos(sub,p)=1) then startwith:=true else startwith:=false;
  end;

  function max(a,b:longint):longint;
  begin
    if a>b then max:=a else max:=b;
  end;

  function go(l:string;b:longint):longint;
  var
    i,j,ans,len:longint;
	t,t2:string;
  begin
	ans:=b;
    i:=b;
    while i>1 do begin
	  t:=copy(l,i,length(l)-i+1);
	  for j:=1 to n do if (startwith(a[j],t)) and (time(l,a[j])<2) then begin
	    t2:=copy(a[j],length(l)-i+2,length(a[j])-(length(l)-i+1));
		t2:=l+t2;
		ans:=max(ans,go(t2,length(t2)));
	  end;
          dec(i);
	end;
    exit(ans);
  end;
begin
  readln(n);
  for ii:=1 to n do readln(a[ii]);
  readln(s);
  for ii:=1 to n do if startwith(a[ii],s) then maxx:=max(maxx,go(a[ii],length(a[ii])));
  writeln(maxx);
end.
