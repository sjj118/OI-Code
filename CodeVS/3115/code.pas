var
  i,j,lena,lenb:longint;
  s,sa,sb:ansistring;
  a,b,c:array[1..500]of longint;
begin
  readln(s);
  lena:=pos(s,' ')-1;
  lenb:=length(s)-lena-1;
  sa:=copy(s,1,lena);
  sb:=copy(s,lena+2,lenb);
  writeln(sa);
  writeln(sb);
end.
