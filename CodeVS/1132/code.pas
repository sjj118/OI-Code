var
  n,r,q,i,j,k,win,lost:longint;
  s,w,h:array[1..220000]of int64;
  wins,winw,winh,losts,lostw,losth:array[1..120000]of int64;
  procedure qsort();

    procedure sort(l,r: longint);
      var
         i,j,x,y,t: longint;
      begin
         i:=l;
         j:=r;
         x:=s[(l+r) div 2];
         t:=h[(l+r) div 2];
         repeat
           while (s[i]>x)or((s[i]=x)and(h[i]<t)) do
            inc(i);
           while (x>s[j])or((s[j]=x)and(h[j]>t)) do
            dec(j);
           if not(i>j) then
             begin
                y:=s[i];
                s[i]:=s[j];
                s[j]:=y;
				y:=w[i];
                w[i]:=w[j];
                w[j]:=y;
				y:=h[i];
                h[i]:=h[j];
                h[j]:=y;
                inc(i);
                j:=j-1;
             end;
         until i>j;
         if l<j then
           sort(l,j);
         if i<r then
           sort(i,r);
      end;

    begin
       sort(1,n*2);
    end;
	
	procedure gb();
	var
	  i,j,k:longint;
	begin
	  i:=1;j:=1;
	  while (i<=n)and(j<=n) do begin
	    if (wins[i]>losts[j])or((wins[i]=losts[j])and(winh[i]<losth[j]))then begin
		  s[i+j-1]:=wins[i];
		  w[i+j-1]:=winw[i];
		  h[i+j-1]:=winh[i];
		  inc(i);
		end else begin
		  s[i+j-1]:=losts[j];
		  w[i+j-1]:=lostw[j];
		  h[i+j-1]:=losth[j];
		  inc(j);
		end;
	  end;
	  while i<=n do begin
	    s[i+j-1]:=wins[i];
		w[i+j-1]:=winw[i];
		h[i+j-1]:=winh[i];
		inc(i);
	  end;
	  while j<=n do begin
	    s[i+j-1]:=losts[j];
		w[i+j-1]:=lostw[j];
		h[i+j-1]:=losth[j];
		inc(j);
	  end;
	end;

begin
  readln(n,r,q);
  for i:=1 to n*2 do read(s[i]);
  for i:=1 to n*2 do read(w[i]);
  for i:=1 to n*2 do h[i]:=i;
  qsort;
  while r>0 do begin
    dec(r);
	for i:=1 to n do begin
	  if w[2*i-1]>w[2*i] then begin
        win:=2*i-1;
		lost:=2*i;
	  end else begin
	    lost:=2*i-1;
		win:=2*i;
	  end;
	  wins[i]:=s[win]+1;
	  winw[i]:=w[win];
	  winh[i]:=h[win];
	  losts[i]:=s[lost];
	  lostw[i]:=w[lost];
	  losth[i]:=h[lost];
	end;
	gb;
  end;
  writeln(h[q]);
end.
