var
	n,i,j,k,t:longint;
	a:array[1..20]of longint;
	f:boolean;
	
	function min(a,b:longint):longint;
	begin
		if a<b then exit(a) else exit(b);
	end;

	function biger(a,b:longint):boolean;
	var
		i,j,la,lb:longint;
		sa,sb:string;
	begin
		str(a,sa);
		str(b,sb);
		while (length(sa)>0)and(length(sb)>0) do begin
			if length(sa)>length(sb) then begin
				for i:=1 to length(sb) do begin
					if sa[i]>sb[i] then exit(true);
					if sa[i]<sb[i] then exit(false);
				end;
				delete(sa,1,length(sb));
			end else begin
				for i:=1 to length(sa) do begin
					if sa[i]>sb[i] then exit(true);
					if sa[i]<sb[i] then exit(false);
				end;
				delete(sb,1,length(sa));
			end;
		end;
	end;
begin
	readln(n);
	for i:=1 to n do read(a[i]);
	for i:=1 to n-1 do begin
		for j:=1 to n-1 do begin
			if biger(a[j+1],a[j]) then begin
				t:=a[j];
				a[j]:=a[j+1];
				a[j+1]:=t;
			end;
		end;
	end;
	for i:=1 to n do write(a[i]);
end.
