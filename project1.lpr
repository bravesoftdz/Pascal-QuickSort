program project1;

uses SysUtils, DateUtils;

const FIX_SIZE=10000;
                                              //1000 = 0 ms
                                              //10000 = 1 ms
                                              //100000 = 12 ms
                                              //1000000 = 140 ms
                                              //10000000 = 1610 ms
                                              //100000000 = 18370 ms
                                              //Intel Core i5-7500 @3.40GHz - 8GB RAM
var t:array[1..FIX_SIZE] of int32;
    n,i:integer;
    timeBefore, timeAfter:TDateTime;


procedure csere(left, right:int32);
var temp:int32;
begin
  temp:=t[left];
  t[left]:=t[right];
  t[right]:=temp;
end;


//------------------------------------------------------------------------------------------------------------------------------------------
procedure quicksort(left, right:int32);       // >< = ascending,   <> = descending
var lo, hi, pivot:int32;
begin
  lo:=left;                                   //low pointer
  hi:=right;                                  //high pointer
  pivot:=t[(left + right) div 2];             //pivot is the middle one
  repeat
    while pivot > t[lo] do inc(lo);           //increment low while it's less than pivot = finding a greater one
    while pivot < t[hi] do dec(hi);           //decrementing high while it's greater than pivot = finding a smaller one

    if lo <= hi then begin                    //if not crossed each other swap them
      csere(lo, hi);
      dec(hi);
      inc(lo);
    end;
  until lo > hi;                              //repeat the whole process until the pointers cross

  if left < hi then quicksort(left, hi);      //do quicksort on the left partition
  if lo < right then quicksort(lo, right);    //do quicksort on the right partition
end;
//------------------------------------------------------------------------------------------------------------------------------------------


begin

  write('Hany szam lesz (0 = tomb automatikusan feltoltve): ');
  readln(n);

  if n<>0 then begin

    for i:=1 to n do begin
      readln(t[i]);
    end;

  end else begin

    randomize;

    n:=FIX_SIZE;

    for i:=1 to n do begin
      t[i]:=random(n);
    end;

  end;


  timeBefore:=Now;

  quicksort(1, n);

  timeAfter:=Now;


  writeln;
  writeln('Rendezve!');
  writeln('Ennyi idobe telt (millisec): ', milliSecondsBetween(timeAfter, timeBefore));

  {
  for i:=1 to n do begin
    write(t[i], ' ');
  end;
  writeln;
  }

  readln;

end.
















