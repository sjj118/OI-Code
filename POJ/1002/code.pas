var
  a:array[0..9999999]of longint;
  i,n:longint;
  k:string;
  b:boolean;

  function change(s:string):longint;
  var
    i,m:longint;
  begin
    change:=0;
    for i:=1 to length(s) do begin
	  if (s[i]<>'-')and(s[i]<>'Q')and(s[i]<>'Z') then begin
	    case s[i] of
		  'A':m:=2;
		  'B':m:=2;
		  'C':m:=2;
		  'D':m:=3;
		  'E':m:=3;
		  'F':m:=3;
		  'G':m:=4;
		  'H':m:=4;
		  'I':m:=4;
		  'J':m:=5;
		  'K':m:=5;
		  'L':m:=5;
		  'M':m:=6;
		  'N':m:=6;
		  'O':m:=6;
		  'P':m:=7;
		  'R':m:=7;
		  'S':m:=7;
		  'T':m:=8;
		  'U':m:=8;
		  'V':m:=8;
		  'W':m:=9;
		  'X':m:=9;
		  'Y':m:=9;
		  else val(s[i],m);
		end;
		change:=change*10+m;
	  end;
	end;
  end;
begin
  b:=false;
  readln(n);
  for i:=1 to n do begin readln(k); inc(a[change(k)]); end;
  for i:=0 to 9999999 do if a[i]>1 then begin
    b:=true;
    str(i,k);
	while length(k)<7 do insert('0',k,1);
    for n:=1 to 3 do write(k[n]);write('-');for n:=4 to 7 do write(k[n]);write(' ');writeln(a[i]);
  end;
  if not b then writeln('No duplicates.');
end.
