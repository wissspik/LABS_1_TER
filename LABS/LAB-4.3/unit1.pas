unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Image1: TImage;
    Image2: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

const
  ymin = 0.0;
var
  LangColor: array[1..10] of TColor = (clGreen, clBlue, clFuchsia, clRed, clNavy, clMaroon, clTeal, clOlive, clPurple, clBlack);
  Languages: array[1..10] of string = ('C', 'Java', 'Python', 'C++', 'C#', 'Visual Studio', 'JavaScript', 'PHP', 'R', 'SQL');
  Rating: array[1..10] of real = (16.95, 12.56, 11.28, 6.94, 4.16, 3.97, 2.14, 2.09, 1.99, 1.57);
var
  jBeg, jEnd: integer;
  ymax: real;

{$R *.lfm}

function jy(y: real): integer;
begin
   Result := round(((y - ymin) * (jEnd - jBeg)) / (ymin - ymax)) + jEnd;
end;

procedure Draw;
var
  kollang, step, Border, xl, xr,yl, i: integer;
  sum: real;
begin
   Border := 10;
   jBeg := Border;
   jEnd := Form1.Image1.Height - Border;

   with Form1.Image1.Canvas do
   begin
     Brush.Color := clForm;
     FillRect(0, 0, Form1.Image1.Width,
                    Form1.Image1.Height);
     kollang := StrToInt(Form1.ComboBox1.Text);
     sum := 0;

     for i := 1 to kollang do
       sum := sum + Rating[i];

     ymax := 100 - sum;
     step := round((Form1.Image1.Width - 3 * Border) / (kollang + 1));
     xl := 3 * Border;

     for i := 1 to kollang do
     begin
          xr := xl + step;
          Brush.Color := LangColor[i];
          FillRect(Xl, jy(ymin), xr, jy(Rating[i]));
          xl := xl + step;
     end;

     xr := xl + step;
     Brush.Color := clGray;
     FillRect(xl, jy(ymin), xr, jy(100 - sum));
     Brush.Color := clForm;
     Line(2 * Border, jy(0), 2 * Border, jy(ymax));
     TextOut(0, jy(ymax / 2), FloatToStr(round(ymax / 2)) + '%');
     TextOut(0, jy(0) - 4, '0%');
     TextOut(0, jy(ymax), FloatToStr(round(ymax)) + '%');
     with Form1.Image2.Canvas do begin
       Brush.Color := clForm;
       FillRect(0,0,Form1.Image2.Width,
                    Form1.Image2.Height);
       step := round(Form1.Image2.Height / (kollang+1));
       xl := Border; yl := Border div 2;
       Font.Style:=[fsBold];
       for i := 1 to kollang do begin
         Font.Color := LangColor[i];
         TextOut(xl,yl,Languages[i]);
         yl := yl + step;
       end;
       Font.Color := clGray; Font.Style:=[fsBold];
       TextOut(xl,yl,'Другие');


   end;
end;
end;
{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  Draw
end;



end.

