type 
    Node = record 
        value: Integer; 
        next: ^Node; 
    end; 
    List = ^Node; 
 
var 
    head: List; 
    minValue, maxValue: Integer; 
 
procedure CreateList(var head: List); 
var 
    inputValue: Integer; 
    lastNode, newNode: List; 
begin 
    head := nil; 
    lastNode := nil; 
    write('Enter values for the list (0 to stop): '); 
    read(inputValue); 
    while (inputValue <> 0) do begin 
        new(newNode); 
        newNode^.value := inputValue; 
        newNode^.next := nil; 
        if (head = nil) then 
            head := newNode; 
        else begin 
            lastNode^.next := newNode; 
        end; 
        lastNode := newNode; 
        read(inputValue); 
    end; 
end; 
 
procedure FindMinMax(head: List; var minValue: Integer; var maxValue: Integer); 
var 
    current: List; 
begin 
    current := head; 
    minValue := current^.value; 
    maxValue := current^.value; 
    current := current^.next; 
    while (current <> nil) do begin 
        if (current^.value < minValue) then begin 
            minValue := current^.value; 
        end; 
        if (current^.value > maxValue) then begin 
            maxValue := current^.value; 
        end; 
        current := current^.next; 
    end; 
end; 
 
begin 
    CreateList(head); 
    FindMinMax(head, minValue, maxValue); 
    writeln('Minimum value: ', minValue); 
    writeln('Maximum value: ', maxValue); 
end.