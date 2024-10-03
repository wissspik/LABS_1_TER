program z3;
uses Math;
var
  HUMSTER_1, HUMSTER_2, f_values, formula, pupper_bound: double;
  ARRAY_RESULT: array[0..100000] of double;
  i, iteration, k, l: integer;
  SIGMA_TRUE_PAPA: TextFile;
begin
  AssignFile(SIGMA_TRUE_PAPA, 'COOL_PERETS.txt');
  ReWrite(SIGMA_TRUE_PAPA);
  readln(HUMSTER_1);
  readln(HUMSTER_2);
  ARRAY_RESULT[0] := HUMSTER_2;




  for l := 1 to 10 do
  begin
    ARRAY_RESULT[l] := ARRAY_RESULT[l - 1] + (HUMSTER_1 - HUMSTER_2) / 10;

    for i := 1 to 6 do
    begin
      pupper_bound := 1;
      for k := 1 to i do
      begin
        pupper_bound := pupper_bound * 0.1;
      end;

      f_values := ARRAY_RESULT[l];                                                           �
      formula := f_values; {�������������� ��������� �������� �������}
      iteration := 1;

      while abs(formula) >= pupper_bound do
      begin
        formula := ((i + 1) * Power(formula, i)) / i;
        f_values := f_values - formula;
        iteration := iteration + 1;
      end;



      Writeln(SIGMA_TRUE_PAPA, ARRAY_RESULT[l]:10:2, '      ', pupper_bound:10:5, '        ', f_values:40:10, '      ', iteration, '      ', formula:10:5);
      Writeln(SIGMA_TRUE_PAPA);
    end;
  end;

  CloseFile(SIGMA_TRUE_PAPA);
  Readln();
end.

