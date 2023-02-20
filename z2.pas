type
  // Класс представляет ячейку списка
  Each = class
    Next: Each;
    Value: string;
    Count: integer := 1;
    
    constructor Create(name: string; insertNext: Each := nil);
    begin
      Value := name;
      Next := insertNext
    end;
  end;


type
  // Класс представляет собой список
  Analytic = class
  private 
    First: Each;
    
    // Метод ищет ящейку
    function Find(name: string): Each;
    begin
      result := First;
      while result <> nil do
      begin
        if result.Value = name then exit;
        result := result.Next;
      end
    end;
    
    // Попытка вставить
    function TryInsert(curr: Each; name: string): boolean;
    begin
      result := false;
      if (curr <> nil) and (curr.Next <> nil) and (curr.Next.Value >= name) then
      begin 
        // Вставляем элемент
        curr.Next := new Each(name, curr.Next);
        result := true
      end
    end;
  
  public 
    // Напечатать список в файл
    procedure PrintToFile(filename: string);
    begin
      var output := System.IO.File.CreateText(filename);
      var i := First;
      while i <> nil do
      begin
        output.WriteLine(i.Value + ' ' + i.Count);
        i := i.Next
      end;
      output.Close
    end;
    
    // Обновить счётчик слова
    procedure Update(name: string);
    begin
      // Если нашли элемент
      var fix := Find(name);
      if fix <> nil then
      begin
        // То обновляем его счётчик и выходим
        fix.Count += 1;
        exit
      end;
      // Если список пуст или его первый элемент больше нового слова
      // Вставляем слово в начало списка
      if (First = nil) or (First.Value >= name) then
      begin
        First := new Each(name, First);
        exit
      end;
      // Идем по списку
      var i := First;
      while true do
      begin
        // Пока не находим место для вставки
        if TryInsert(i, name) then exit;
        // Если подошли к концу
        if i.Next = nil then
        begin 
          // Значит место для вставки в конце
          i.Next := new Each(name);
          exit
        end;
        i := i.Next
      end;
    end;
  end;


begin
  var test := new Analytic();
  foreach var i in System.IO.File.ReadAllLines('filein.txt') do
    test.Update(i);
  test.PrintToFile('output.txt')
end.