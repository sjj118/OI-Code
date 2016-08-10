type
	bignum=array[0..1000]of longint;
var
	n,a,b,i:longint;
	t,max:bignum;
	l,r,mul:array[1..1000]of longint;
	s:array[0..1000]of bignum;

	function tobignum(a:longint):bignum;
	begin
		fillchar(tobignum,sizeof(tobignum),0);
		while a>0 do begin
			inc(tobignum[0]);
			tobignum[tobignum[0]]:=a mod 100000;
			a:=a div 100000;
		end;
	end;
	
	function multi(a:bignum;b:longint):bignum;
	var
		i,j:longint;
	begin
		fillchar(multi,sizeof(multi),0);
		multi[0]:=a[0];
		for i:=1 to a[0] do begin
			multi[i]:=multi[i]+a[i]*b;
		end;
		for i:=1 to multi[0] do begin
			multi[i+1]:=multi[i+1]+multi[i] div 100000;
			multi[i]:=multi[i] mod 100000;
		end;
		while multi[multi[0]+1]>0 do inc(multi[0]);
	end;
	
	function divide(a:bignum;b:longint):bignum;
	var
		i:longint;
	begin
		fillchar(divide,sizeof(divide),0);
		divide[0]:=a[0];
		for i:=a[0] downto 2 do begin
			a[i-1]:=a[i] mod b*100000+a[i-1];
			divide[i]:=a[i]div b;
		end;
		divide[1]:=a[1]div b;
		while divide[divide[0]]=0 do dec(divide[0]);
	end;
	
	function biger(a,b:bignum):boolean;
	var
		i:longint;
	begin
		if a[0]>b[0] then exit(true);
		if a[0]<b[0] then exit(false);
		for i:=a[0] downto 1 do begin
			if a[i]>b[i] then exit(true);
			if a[i]<b[i] then exit(false);
		end;
	end;
	
	procedure output(a:bignum);
	var
		i,j:longint;
	begin
                write(a[a[0]]);
		for i:=a[0]-1 downto 1 do begin
                if a[i]=0 then write('00000') else begin

                        for j:=1 to 4-trunc(ln(a[i])/ln(10)) do write(0);
                        write(a[i]);
                end;
        end;
	end;
	
procedure qsort;

    procedure sort(ll,rr: longint);
      var
         i,j,x,y: longint;
      begin
         i:=ll;
         j:=rr;
         x:=mul[(ll+rr) div 2];
         repeat
           while mul[i]<x do
            inc(i);
           while x<mul[j] do
            dec(j);
           if not(i>j) then
             begin
                y:=mul[i];
                mul[i]:=mul[j];
                mul[j]:=y;
				y:=l[i];
                l[i]:=l[j];
                l[j]:=y;
				y:=r[i];
                r[i]:=r[j];
                r[j]:=y;
                inc(i);
                j:=j-1;
             end;
         until i>j;
         if ll<j then
           sort(ll,j);
         if i<rr then
           sort(i,rr);
      end;

    begin
       sort(1,n);
    end;
begin
	readln(n);
	readln(a,b);
	for i:=1 to n do readln(l[i],r[i]);
	for i:=1 to n do mul[i]:=l[i]*r[i];
	qsort;
	s[0]:=tobignum(a);
	for i:=1 to n do s[i]:=multi(s[i-1],l[i]);
	for i:=1 to n do begin t:=divide(s[i-1],r[i]); if biger(t,max) then max:=t;end;
	output(max);
end.
