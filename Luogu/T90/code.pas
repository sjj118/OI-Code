var
  n,i,k,t:longint;
  m:int64;
  p:longint;

  function f(a:longint):longint;
  begin
    exit(a*a+1);
  end;

  function gcd(a,b:longint):longint;
  begin
    if b=0 then exit(a);
	exit(gcd(b,a mod b));
  end;

  function fact(n:longint):longint;
  var
    x,y,p:longint;
  begin
    x:=2;
	y:=2;
	p:=1;
	while p=1 do begin
	  x:=f(x) mod n;
	  y:=f(f(y)mod n)mod n;
	  p:=gcd(y-x,n);
	end;
	exit(p);
  end;
begin
  readln(t);
  for k:=1 to t do begin
    readln(n);
	{m:=n mod 23333;
	i:=fact(n);
	while i<>n do begin
	  p:=0;
	  while n mod i=0 do begin
	    inc(p);
		n:=n div i;
	  end;
	  if p mod 2=1 then m:=m*i mod 23333;
	  i:=fact(n);
	end;
	m:=m*i mod 23333;
	writeln(m);      }
  end;
end.
