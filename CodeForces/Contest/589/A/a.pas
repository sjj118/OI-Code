var
	n,i,j,t,cnt,hcnt,k:longint;
	a:array[1..100000]of string;
	s:string;
	htail,hnext,hdata2:array[0..100000]of longint;
	hdata:array[0..100000]of string;
	data,tail,next,head,num:array[0..100000]of longint;
	
	function h(x:string):longint;
	var
		i,ans:longint;
	begin
		ans:=0;
		for i:=1 to length(x) do ans:=(ans+ord(x[i])*i)mod 100001;
		exit(ans);
	end;
	
	procedure put(x:string;y:longint);
	var
		k:longint;
	begin
		k:=h(x);
		if hdata2[k]=0 then begin
			hdata[k]:=x;
			hdata2[k]:=y;
		end else if hnext[k]=0 then begin
			if hdata[k]<>x then begin
				inc(hcnt);
				hnext[k]:=hcnt;
				hdata[hcnt]:=x;
				hdata2[hcnt]:=y;
			end;
		end else begin
			if hdata[k]<>x then begin
				while (hnext[k]>0) do begin
					k:=hnext[k];
					if hdata[k]=x then exit;
				end;
				inc(hcnt);
				hnext[k]:=hcnt;
				hdata[hcnt]:=x;
				hdata2[hcnt]:=y;
			end;
		end;
	end;
	
	function get(x:string):longint;
	var
		k:longint;
	begin
        k:=h(x);
		if hdata2[k]=0 then exit(0)
		else begin
			while k>0 do begin
				if hdata[k]=x then exit(hdata2[k]);
				k:=hnext[k];
			end;
			exit(0);
		end;
	end;

begin
	readln(n);
	cnt:=0;
	hcnt:=0;
	k:=0;
	fillchar(num,sizeof(num),0);
	fillchar(tail,sizeof(tail),0);
	for i:=1 to n do begin
		readln(s);
		a[i]:=s;
		for j:=1 to length(s) do if (s[j]>='A')and(s[j]<='Z') then s[j]:=chr(ord(s[j])-ord('A')+ord('a'));
		t:=pos('@',s);
		if copy(s,t+1,length(s)-t)='bmail.com' then begin
			j:=1;
			while (s[j]<>'+')and(s[j]<>'@') do begin
				if s[j]='.' then delete(s,j,1)
				else inc(j);
			end;
			if s[j]='+' then begin
				t:=pos('@',s);
				delete(s,j,t-j);
			end;
		end;
		t:=get(s);
		if t<>0 then begin
			inc(cnt);
			data[cnt]:=i;
			next[tail[t]]:=cnt;
			tail[t]:=cnt;
			inc(num[t]);
		end else begin
			inc(k);
			inc(cnt);
			inc(num[cnt]);
			head[k]:=cnt;
			put(s,cnt);
			data[cnt]:=i;
			tail[cnt]:=cnt;
		end;
	end;
	writeln(k);
	for i:=1 to k do begin
		t:=head[i];
		write(num[t],' ');
		while t<>0 do begin
			write(a[data[t]],' ');
			t:=next[t];
		end;
		writeln;
	end;
end.
	
