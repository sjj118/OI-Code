var
  n,k,i,j,l,m,w:longint;
  a:array[1..40]of longint;
  f:array[0..40,1..40,1..40]of int64;
  s:string;

  function min(a,b:int64):int64;
  begin
    if a>b then min:=b else min:=a;
  end;

  function max(a,b:int64):int64;
  begin
    if a<b then max:=b else max:=a;
  end;

begin
  readln(n,k);
  readln(s);
  fillchar(f,sizeof(f),0);
  for i:=1 to n do val(s[i],a[i]);
  for i:=1 to n do begin
    f[0,i,i]:=a[i];
    for l:=i+1 to n do f[0,i,l]:=f[0,i,l-1]*10+a[l];
  end;
  for l:=1 to k do begin
    for i:=2 to n do begin
	  for j:=i-1 downto 1 do begin
	    for m:=1 to l do begin
		  for w:=j to i-1 do begin
		    f[l,j,i]:=max(f[l-m,j,w]*f[m-1,w+1,i],f[l,j,i]);
		  end;
		end;
	  end;
	end;
  end;
  writeln(f[k,1,n]);
end.
