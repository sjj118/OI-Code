var
	n,i,j:longint;
	shi:array[0..2,1..26]of char;
	used:array[1..26]of boolean;
	jin,ans:array[0..26]of longint;
	
	function h(c:char):longint;
	begin
		exit(ord(c)-ord('A')+1);
	end;
	
	function sum(m:longint):longint;
	begin
		exit(ans[h(shi[0,m])]+ans[h(shi[1,m])]+jin[m]);
	end;
	
	function go(k,m:longint):boolean;
	begin
		if m=0 then begin
			if jin[0]>0 then exit(false) else begin
				for i:=1 to n do write(ans[i],' ');
				exit(true);
			end;
		end;
		if k=2 then begin
			if ans[h(shi[k,m])]<>0 then begin
				if sum(m) mod n=ans[h(shi[k,m])] then begin
					jin[k-1]:=sum(m)div n;
					exit(go(0,m-1));
				end else exit(false);
			end else begin
				for i:=1 to n do if (not used[i]) and (sum(m)mod n=i) then begin
					used[i]:=true;
					ans[h(shi[2,m])]:=i;
					jin[k-1]:=sum(m)div n;
					if go(0,m-1) then exit(true);
					used[i]:=false;
					ans[h(shi[2,m])]:=0;
					exit(false);
				end;
				exit(false);
			end;
		end else begin
			if ans[h(shi[k,m])]=0 then begin
				for i:=1 to n do if not used[i] then begin
					used[i]:=true;
					ans[h(shi[k,m])]:=i;
					if go(k+1,m) then exit(true);
					used[i]:=false;
					ans[h(shi[k,m])]:=0;
				end;
				exit(false);
			end else exit(go(k+1,m));
		end;
	end;
begin
	readln(n);
	for i:=0 to 2 do readln(shi[i]);
	go(0,n);
end.
