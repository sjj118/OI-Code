var
	g,w:array[1..52,0..52]of longint;
	d:array[1..52]of longint;
	done:array[1..52]of boolean;
	p,i,j,k,q,min:longint;
	c1,c2:char;
        s:string;
	
	function int(c:char):longint;
	begin
		if c>='a' then exit(ord(c)-ord('a')+1);
		exit(ord(c)-ord('A')+27);
	end;
begin
	readln(p);
	for i:=1 to p do begin
		readln(s);
		c1:=s[1];
		c2:=s[3];
		if c1=c2 then continue;
		val(copy(s,5,length(s)-4),k);
		j:=int(c1);
		q:=int(c2);
		if (w[j,q]>0)and(k>w[j,q]) then continue;
		inc(g[j,0]);
		inc(g[q,0]);
		g[j,g[j,0]]:=q;
		g[q,g[q,0]]:=j;
		w[j,q]:=k;
		w[q,j]:=k;
	end;
	fillchar(d,sizeof(d),$7f);
	d[52]:=0;
	k:=1;
	while k<=52 do begin
		min:=1;
		while done[min] do inc(min);
		for i:=min+1 to 52 do if (not done[i])and(d[i]<d[min]) then min:=i;
		for i:=1 to g[min,0] do if d[min]+w[min,g[min,i]]<d[g[min,i]] then d[g[min,i]]:=d[min]+w[min,g[min,i]];
		done[min]:=true;
		inc(k);
	end;
	min:=27;
	for i:=28 to 51 do if d[i]<d[min] then min:=i;
	writeln(chr(min-27+ord('A')),' ',d[min]);
end.
