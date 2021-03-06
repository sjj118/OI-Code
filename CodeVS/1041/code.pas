type
	point=record
		x,y:longint;
	end;
var
	p:array[1..400]of point;
	flag:array[1..400]of boolean;
	d:array[1..400]of real;
	w:array[1..400,1..400]of real;
        min:real;
	i,n,s,t,a,b,k,tt,j,testnum,minn:longint;
begin
	readln(n);
	for testnum:=1 to n do begin
		readln(s,t,a,b);
		for i:=1 to s do begin
			readln(p[4*i-3].x,p[4*i-3].y,p[4*i-2].x,p[4*i-2].y,p[4*i-1].x,p[4*i-1].y,tt);
			w[4*i-3,4*i-2]:=sqrt(sqr(p[4*i-3].x-p[4*i-2].x)+sqr(p[4*i-3].y-p[4*i-2].y))*tt;
			w[4*i-2,4*i-3]:=w[4*i-3,4*i-2];
			w[4*i-3,4*i-1]:=sqrt(sqr(p[4*i-3].x-p[4*i-1].x)+sqr(p[4*i-3].y-p[4*i-1].y))*tt;
			w[4*i-1,4*i-3]:=w[4*i-3,4*i-1];
			w[4*i-2,4*i-1]:=sqrt(sqr(p[4*i-2].x-p[4*i-1].x)+sqr(p[4*i-2].y-p[4*i-1].y))*tt;
			w[4*i-1,4*i-2]:=w[4*i-2,4*i-1];
			if w[4*i-3,4*i-2]>w[4*i-3,4*i-1] then begin
				if w[4*i-3,4*i-2]>w[4*i-2,4*i-1] then begin
					p[4*i].x:=p[4*i-3].x+p[4*i-2].x-p[4*i-1].x;
					p[4*i].y:=p[4*i-3].y+p[4*i-2].y-p[4*i-1].y;
				end else begin
					p[4*i].x:=p[4*i-1].x+p[4*i-2].x-p[4*i-3].x;
					p[4*i].y:=p[4*i-1].y+p[4*i-2].y-p[4*i-3].y;
				end;
			end else begin
				if w[4*i-1,4*i-3]>w[4*i-2,4*i-1] then begin
					p[4*i].x:=p[4*i-3].x+p[4*i-1].x-p[4*i-2].x;
					p[4*i].y:=p[4*i-3].y+p[4*i-1].y-p[4*i-2].y;
				end else begin
					p[4*i].x:=p[4*i-1].x+p[4*i-2].x-p[4*i-3].x;
					p[4*i].y:=p[4*i-1].y+p[4*i-2].y-p[4*i-3].y;
				end;
			end;
			w[4*i-1,4*i]:=sqrt(sqr(p[4*i-1].x-p[4*i].x)+sqr(p[4*i-1].y-p[4*i].y))*tt;
			w[4*i,4*i-1]:=w[4*i-1,4*i];
			w[4*i-2,4*i]:=sqrt(sqr(p[4*i-2].x-p[4*i].x)+sqr(p[4*i-2].y-p[4*i].y))*tt;
			w[4*i,4*i-2]:=w[4*i-2,4*i];
			w[4*i-3,4*i]:=sqrt(sqr(p[4*i-3].x-p[4*i].x)+sqr(p[4*i-3].y-p[4*i].y))*tt;
			w[4*i,4*i-3]:=w[4*i-3,4*i];
		end;
		for i:=1 to 4*s-4 do
			for j:=4*((i-1)div 4)+5 to 4*s do begin
				w[i,j]:=sqrt(sqr(p[i].x-p[j].x)+sqr(p[i].y-p[j].y))*t;
				w[j,i]:=w[i,j];
			end;
		min:=maxlongint;;
		for k:=4*a-3 to 4*a do begin
			fillchar(d,sizeof(d),127);
			fillchar(flag,sizeof(flag),0);
			d[k]:=0;
			for i:=1 to 4*s-1 do begin
				minn:=1;
				for j:=2 to 4*s do if (flag[minn])or((not flag[j])and(d[j]<d[minn])) then minn:=j;
				flag[minn]:=true;
				for j:=1 to 4*s do if d[minn]+w[minn,j]<d[j] then d[j]:=d[minn]+w[minn,j];
			end;
			for j:=4*b-3 to 4*b do if d[j]<min then min:=d[j];
		end;
		writeln(min:0:1); 
	end;
end.
