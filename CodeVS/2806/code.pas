var
  w,h,i,j,x,y,p,e,k:longint;
  g,a:array[0..1000,0..1000]of boolean;
  q:array[1..400,1..2]of longint;
  ans:array[1..10000]of longint;
  t:string;
begin
  k:=0;
  repeat
    inc(k);
    readln(w,h);
    fillchar(a,sizeof(a),true);
    fillchar(g,sizeof(g),false);
    if (w=0) and (h=0) then break;
    for i:=1 to h do begin
      readln(t);
      for j:=1 to w do begin
        if t[j]='.' then g[i,j]:=true;
        if t[j]='#' then g[i,j]:=false;
        if t[j]='@' then begin g[i,j]:=true; x:=j; y:=i; end;
      end;
    end;
    a[y,x]:=false;
    p:=1;
    e:=1;
    q[p,1]:=y;q[p,2]:=x;
    inc(e);
    while p<e do begin
      x:=q[p,1];
      y:=q[p,2];
      if g[x-1,y] and a[x-1,y] then begin q[e,1]:=x-1;q[e,2]:=y;a[x-1,y]:=false;inc(e);end;
      if g[x+1,y] and a[x+1,y] then begin q[e,1]:=x+1;q[e,2]:=y;a[x+1,y]:=false;inc(e);end;
      if g[x,y-1] and a[x,y-1] then begin q[e,1]:=x;q[e,2]:=y-1;a[x,y-1]:=false;inc(e);end;
      if g[x,y+1] and a[x,y+1] then begin q[e,1]:=x;q[e,2]:=y+1;a[x,y+1]:=false;inc(e);end;
      inc(p);
    end;
    ans[k]:=e-1;
  until false;
  for i:=1 to k-1 do writeln(ans[i]);
end.