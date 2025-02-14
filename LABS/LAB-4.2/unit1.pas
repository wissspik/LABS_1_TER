unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Image1: TImage;
    LegendImage: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
  public
  end;

var
  Form1: TForm1;

implementation

var
  LangColor: array[1..10] of TColor = (clGreen, clBlue, clFuchsia, clRed, clNavy, clMaroon, clTeal, clOlive, clPurple, clBlack);
  Languages: array[1..10] of string = ('C', 'Java', 'Python', 'C++', 'C#', 'Visual Studio', 'JavaScript', 'PHP', 'R', 'SQL');
  Rating: array[1..10] of real = (16.95, 12.56, 11.28, 6.94, 4.16, 3.97, 2.14, 2.09, 1.99, 1.57);
  iBeg, jBeg, iEnd, jEnd: integer;

{$R *.lfm}

procedure Draw;
var
  kollang, Border, xt, yt, step, rad, irad, jrad, i: integer;
  x1, xr, start: real;
begin
  Border := 20;
  iBeg := Border;
  jBeg := Border;


  with Form1.Image1.Canvas do
  begin
    Brush.Color := clWhite;
    FillRect(0, 0, Form1.Image1.Width, Form1.Image1.Height);

    kollang := StrToInt(Form1.ComboBox1.Text);


    if (Form1.Image1.Width - 2 * iBeg) > (Form1.Image1.Height - 2 * jBeg) then
      rad := Form1.Image1.Height - 2 * jBeg
    else
      rad := Form1.Image1.Width - 2 * iBeg;

    rad := rad div 2;
    iEnd := iBeg + 2 * rad;
    jEnd := jBeg + 2 * rad;
    irad := iBeg + rad;
    jrad := jBeg + rad;

    start := pi / 2;
    x1 := start;


    for i := 1 to kollang do
    begin
      xr := x1 - 2 * pi * Rating[i] / 100;
      Brush.Color := LangColor[i];
      Pie(iBeg, jBeg, iEnd, jEnd,
          irad + round(rad * cos(xr)), jrad - round(rad * sin(xr)),
          irad + round(rad * cos(x1)), jrad - round(rad * sin(x1)));
      x1 := xr;
    end;


    Brush.Color := clGray;
    xr := start;
    Pie(iBeg, jBeg, iEnd, jEnd,
        irad + round(rad * cos(xr)), jrad - round(rad * sin(xr)),
        irad + round(rad * cos(x1)), jrad - round(rad * sin(x1)));
  end;



  with Form1.LegendImage.Canvas do
  begin
    Brush.Color := clWhite;
    FillRect(0, 0, Form1.LegendImage.Width, Form1.LegendImage.Height);

    step := round(Form1.LegendImage.Height / (kollang + 1));
    xt := Border;
    yt := Border div 2;

    Font.Style := [fsBold];
    for i := 1 to kollang do
    begin
      Font.Color := LangColor[i];
      TextOut(xt, yt, Languages[i]);
      yt := yt + step;
    end;

    Font.Color := clGray;
    TextOut(xt, yt, 'Другие');
  end;
end;


{ TForm1 }

procedure TForm1.Button2Click(Sender: TObject);
begin
  Draw;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Close;
end;

end.



