begin
  var i:=2;
  var i_ptr:=i;
  var ukazatelb: ^integer;
  new(ukazatelb);
  ukazatelb^ := i_ptr;
  writeln(ukazatelb);
end.