program ex1; {1 ���������}
uses Math;

var
  i, g, step_ten, x,k: integer;
  formula, step: Double;
  x_start, x_end: real;
  outpite_file: TextFile;

begin
  k := 0;
  {����}
  AssignFile(outpite_file, 'RESULT.txt'); {�������� ����}
  Rewrite(outpite_file); {����������� ����}
  {2 �窨}
  Writeln(outpite_file, '�������� x      eps                f(x)             iteration');
  writeln('�������� -0.7 <= x <= 0.25');
  readln(x_start, x_end);

  {����}
  if (((x_start > 0.25) or (x_start < -0.7)) or ((x_end > 0.25) or (x_end < -0.7))) then {����, ����� ���� ��� �����}
  begin
    writeln('�������� ������ x');
    Halt(1);
    Readln();
  end;

  step := (x_start - x_end) / 10; {��� � ������� ����� ����}

  for i := 1 to 10 do
  begin
    step_ten := 1;
    g := 1;
    formula := (1 / Power(1 - x_start, 2));
    for x := 1 to 6 do {������� ��� x}
    begin
      // ������� ������ ������ ��� ������� �������
      while k <= 6 do
      begin
        formula := k * Power(x_start,k);
        Writeln(outpite_file, x_start:6:2, '     ', '10 ** -', step_ten:2, '             ', formula:12:step_ten, '             ', g:4);
        k := k + 1;
        step_ten := step_ten + 1;
        g := g + 1;
      end;
      step_ten := step_ten + 1;
      inc(g);
    end;
    x_start := x_start - step;
    step_ten := step_ten + 1;
    Writeln(outpite_file, ' ');
    Writeln(outpite_file, ' ');
    k := 1
  end;
  CloseFile(outpite_file); {�������� ����}
end.
// ��������� ������
// ��� ������� ��� �������� k k * x ** k

