unit desenho;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Menus,
  StdCtrls, Math;

type

  { TForm1 }

  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Image1: TImage;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    CircunferenciasAula07: TMenuItem;
    Circunferencia1: TMenuItem;
    CircunferenciaParametrica2: TMenuItem;
    Circunferencia3: TMenuItem;
    MenuItem6: TMenuItem;
    procedure Circunferencia1Click(Sender: TObject);
    procedure Circunferencia3Click(Sender: TObject);
    procedure CircunferenciaParametrica2Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer
      );
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure CircunferenciasAula07Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  op : integer;
  desenhar : boolean;
  x1:integer;
  y1:integer;
  Xc, Yc, X2, Y2: Integer;
  Raio: double;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.MenuItem1Click(Sender: TObject);
begin

end;

procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if(op = 1) then
  begin
     desenhar := true;
  end;

  if (op = 2) then
  begin
     desenhar := true;
     x1:= X;
     y1:=Y;
  end;

  if ((op = 3) or (op = 4) or (op = 5) or (op = 6)) then
  begin
     desenhar := true;
     Xc := X;
     Yc := Y;
  end;
end;

procedure TForm1.Image1Click(Sender: TObject);
begin

end;

procedure TForm1.Circunferencia1Click(Sender: TObject);
begin
  op := 3;
end;

procedure TForm1.Circunferencia3Click(Sender: TObject);
begin
  op := 5;
end;

procedure TForm1.CircunferenciaParametrica2Click(Sender: TObject);
begin
  op := 4;
end;

procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if(op = 1) and (desenhar) then Image1.Canvas.Pixels[X,Y] := clred;
  Edit1.Text := IntToStr(X);
  Edit2.Text := IntToStr(Y);
end;

procedure TForm1.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  m: Double;
  x2, xi, yi, i: Integer;
  val, xii, yii, xn: Double;
  a, cos1, sen1: Double;
  dx, dy, incX, incY, err, e2 : Integer;
begin
  if (op = 1) then
    desenhar := False;

  if (op = 2) then
  begin
    x2 := X;

    if (Y = y1) then
    begin
      // reta horizontal
      for xi := Min(x1, x2) to Max(x1, x2) do
        Image1.Canvas.Pixels[xi, y1] := clRed;
    end
    else if (Abs(X - x1) < Abs(Y - y1)) then
    begin
      // reta mais vertical que horizontal
      m := (X - x1) / (Y - y1);
      for yi := Min(y1, Y) to Max(y1, Y) do
      begin
        xi := Round(x1 + m * (yi - y1));
        Image1.Canvas.Pixels[xi, yi] := clRed;
      end;
    end
    else
    begin
      // cálculo da inclinação (em double)
      m := -(Y - y1) / (X - x1);


      for xi := Min(x1, x2) to Max(x1, x2) do
      begin
        yi := Round(y1 - m * (xi - x1));
        Image1.Canvas.Pixels[xi, yi] := clRed;
      end;
    end;

    desenhar := False;
  end;

  if (op = 3) then
  begin
    X2 := X;
    Y2 := Y;

    Raio := sqrt((Xc - X2)*(Xc - X2) + (Yc - Y2)*(Yc - Y2));

    xii := -Raio;
    while xii <= Raio do
    begin
      val := Raio*Raio - xii*xii;
      if val < 0 then
        val := 0;
      yii := sqrt(val);

      Image1.Canvas.Pixels[Xc + Round(xii), Yc + Round(yii)] := clRed;
      Image1.Canvas.Pixels[Xc + Round(xii), Yc - Round(yii)] := clRed;

      xii := xii + 0.01;
    end;
  end;

  if (op = 4) then
  begin
    X2 := X;
    Y2 := Y;
    a := 0;
    Raio := sqrt((Xc-X2)*(Xc-X2)+(Yc-Y2)*(Yc-Y2));
    while a < 6.28 do
    begin
      xi := Round(Raio * cos(a));
      yi := Round(Raio * sin(a));
      Image1.Canvas.Pixels[Xc+xi,Yc+yi] := clRed;
      a := a + 0.01;
    end;
  end;

  if (op = 5) then
  begin
    X2 := X;
    Y2 := Y;
    Raio := sqrt((Xc - X2)*(Xc - X2) + (Yc - Y2)*(Yc - Y2));

    xii := Raio;
    yii := 0;
    cos1 := cos(Pi / 180);
    sen1 := sin(Pi / 180);

    for i := 1 to 360 do
    begin
      xn := xii * cos1 - yii * sen1;
      yii := xii * sen1 + yii * cos1;
      xii := xn;
      Image1.Canvas.Pixels[Xc+Round(xii),Yc+Round(yii)] := clRed;
    end;
  end;

  if (op = 6) then
  begin
    X2 := X;
    Y2 := Y;

    dx := Abs(X2 - Xc);
    dy := Abs(Y2 - Yc);

    if Xc < X2 then incX := 1 else incX := -1;
    if Yc < Y2 then incY := 1 else incY := -1;

    err := dx - dy;

    while True do
    begin
      Image1.Canvas.Pixels[Xc, Yc] := clRed;

      if (xC = X2) and (Yc = Y2) then Break;

      e2 := 2 * err;
      if e2 > -dy then
      begin
        err := err - dy;
        xC := xC + incX;
      end;

      if e2 < dx then
      begin
        err := err + dx;
        yC := yC + incY;
      end;
    end;
  end;

end;


procedure TForm1.MenuItem3Click(Sender: TObject);
begin
  op := 1; //desenhar pixels na imagem
end;

procedure TForm1.MenuItem4Click(Sender: TObject);
begin
  op:= 2;
end;

procedure TForm1.MenuItem5Click(Sender: TObject);
begin
  // Preenche toda a imagem de preto de forma eficiente
  Image1.Canvas.Brush.Color := clBlack;
  Image1.Canvas.FillRect(0, 0, Image1.Width, Image1.Height);
end;

procedure TForm1.CircunferenciasAula07Click(Sender: TObject);
begin

end;

procedure TForm1.MenuItem6Click(Sender: TObject);
begin
     op := 6;
end;


end.

