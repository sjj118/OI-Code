var
  a:array[1..30]of 0..9;
  b:array[0..9]of boolean;
  g:array[0..9,1..9]of longint;
  l,x:array[0..9]of longint;
  q:array[1..9]of longint;
  s:string;
  k,n,i,j,f,t,head,tail:longint;
  ans:int64;
begin
  readln(s);
  i:=1;
  while s[i]<>' ' do begin
    a[i]:=ord(s[i])-48;
	inc(i);
  end;
  n:=i-1;
  inc(i);
  s:=copy(s,i,length(s)-i+1);
  val(s,k);
  for i:=1 to k do begin
    readln(f,t);
	inc(l[f]);
	g[f,l[f]]:=t;
  end;
  for i:=0 to 9 do begin
    fillchar(b,sizeof(b),true);
	fillchar(q,sizeof(q),0);
	head:=0;
	tail:=0;
        b[i]:=false;
	for j:=1 to l[i] do begin
	  inc(tail);
	  q[tail]:=g[i,j];
	  b[g[i,j]]:=false;
	end;
	while head<tail do begin
	  inc(head);
	  for j:=1 to l[q[head]] do begin
	    if b[g[q[head],j]] then begin
		  inc(tail);
	      q[tail]:=g[q[head],j];
	      b[g[q[head],j]]:=false;
		end;
	  end;
	end;
	x[i]:=tail+1;
  end;
  ans:=1;
  for i:=1 to n do ans:=ans*x[a[i]];
  writeln(ans);
end.
