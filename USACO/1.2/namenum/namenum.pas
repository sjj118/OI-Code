{
ID: sjj22451
LANG: PASCAL
PROB: namenum
}
const
  b:array[1..26]of char=('2','2','2','3','3','3','4','4','4','5','5','5','6','6','6','7','0','7','7','8','8','8','9','9','9','0');
var
  i,l:longint;
  n:string;
  s:string;
  flag,f2:boolean;
begin
  assign(input,'namenum.in');reset(input);assign(output,'namenum.out');rewrite(output);
  readln(n);
  l:=length(n);
  close(input);
  assign(input,'dict.txt');reset(input);
  f2:=true;
  while not eof do begin
    readln(s);
	if length(s)=l then begin
      flag:=true;
	  for i:=1 to l do if b[ord(s[i])-ord('A')+1]<>n[i] then begin flag:=false; break; end;
	  if flag then begin
	    f2:=false;
        writeln(s);
      end;
	end;
  end;
  if f2 then writeln('NONE');
  close(input);
  close(output);
end.
