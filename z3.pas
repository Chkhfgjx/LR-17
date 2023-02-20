begin
  var spisok: array of integer;
  var spisok_chetnyh: array of integer;
  SetLength(spisok, 11);
  SetLength(spisok_chetnyh, 11);
  var t:=1;
  
  for var i:=1 to 10 do begin
    spisok[i]:=random(-100,100);
    print(spisok[i]);
    
    if spisok[i] mod 2 = 0 then begin
      spisok_chetnyh[t]:=spisok[i];
      t += 1;
    end;
    
  end;
  println();
  for var i:=1 to t-1 do
    print(spisok_chetnyh[i]);
end.