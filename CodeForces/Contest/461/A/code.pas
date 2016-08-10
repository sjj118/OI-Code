type
  tlist=array[1..300000]of longint;
var
  n,i:longint;
  a:tlist;
  sum,ans:int64;

  procedure qsort(var a : tlist);

    procedure sort(l,r: longint);
      var
         i,j,x,y: longint;
      begin
         i:=l;
         j:=r;
         x:=a[(l+r) div 2];
         repeat
           while a[i]>x do
            inc(i);
           while x>a[j] do
            dec(j);
           if not(i>j) then
             begin
                y:=a[i];
                a[i]:=a[j];
                a[j]:=y;
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
       sort(1,n);
    end;
begin
  //assign(input,'code.in');reset(input);assign(output,'code.out');rewrite(output);
  readln(n);
  for i:=1 to n do read(a[i]);
  sum:=0;
  for i:=1 to n do sum:=sum+a[i];
  ans:=sum;
  qsort(a);
  while n>1 do begin
    ans:=ans+sum;
	sum:=sum-a[n];
	dec(n);
  end;
  writeln(ans);
  //close(input);close(output);
end.
