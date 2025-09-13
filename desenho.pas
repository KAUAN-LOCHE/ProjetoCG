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
    Edit3: TEdit;
    Edit4: TEdit;
    Image1: TImage;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    procedure FormCreate(Sender: TObject);
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
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure MenuItem8Click(Sender: TObject);
    procedure MenuItem9Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  op : integer;
  desenhar : boolean;
  x1,xa, ya, xb, yb, x2,y2:integer;
  y1:integer;
  contador:integer;

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

  if (op = 2) or (op = 3) or (op = 4) or (op=5) or (op = 7) then
  begin
     desenhar := true;
     x1:= X;
     y1:=Y;
  end;

end;

procedure TForm1.Image1Click(Sender: TObject);
begin

end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;
procedure LinhaJanelaVisualizacao();
var
  m, x3, y3, xi, yi, p1, p2, p3, p4, q1, q2, q3, q4, delx, dely, i:integer;
  r1, r2, r3, r4, maxx, minn: real;
  us : array [0 .. 4] of Real;
begin
  delx := (x2-x1);
  dely := (y2-y1);
  p1 := -delx;
  p2 := delx;
  p3 := -dely;
  p4:=dely;;
  q1 := x1-min(xa,xb);
  q2 := max(xa,xb) - x1;
  q3 := y1 - min(ya,yb);
  q4 := max(ya,yb) - y1;

  r1 := q1/p1;
  r2 := q2/p2;
  r3 := q3/p3;
  r4 := q4/p4;
  i:=1;
  us[0] := 0;

  if (p1 < 0) then
  begin
     us[i] := r1;
     i := i + 1;
  end;

  if (p2 < 0) then
  begin
     us[i] := r2;
     i := i+1;
  end;

  if (p3 < 0) then
  begin
     us[i]:= r3;
     i := i + 1;
  end;

  if(p4 < 0) then
  begin
     us[i] := r4;
     i := i + 1;
  end;
  maxx:=-99999;
  for m := 0 to (i-1) do
  begin
    if(us[m] > maxx) then maxx := us[m];
  end;

   us[0] := 1;
   i:=1;

  if (p1 > 0) then
  begin
     us[i] := r1;
     i := i + 1;
  end;

  if (p2 > 0) then
  begin
     us[i] := r2;
     i := i+1;
  end;

  if (p3 > 0) then
  begin
     us[i]:= r3;
     i := i + 1;
  end;

  if(p4 > 0) then
  begin
     us[i] := r4;
     i := i + 1;
  end;
  minn:=99999;
  for m := 0 to (i-1) do
  begin
    if(us[m] > minn) then minn := us[m];
  end;

  xi := round(x1 + maxx*delx);
  yi := round (y1 + maxx * dely);

  x3 := round(x1 + delx*minn);
  y3 := round(y1 + minn*dely);





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
  x3, y3, xi, yi, R: Integer;
  i, cos1, sin1: Double;
  n:integer;
  p1, p2, p3, p4, q1, q2, q3, q4, delx, dely,s:integer;
  r1, r2, r3, r4, maxx, minn: real;
  us : array [0 .. 4] of Real;
  janelas : Byte;



begin
  if (op = 1) then
    desenhar := False
  else if (op = 2) then
  begin

    x3 := X;

    if (Y = y1) then
    begin
      // reta horizontal
      for xi := Min(x1, x3) to Max(x1, x3) do
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


      for xi := Min(x1, x3) to Max(x1, x3) do
      begin
        yi := Round(y1 - m * (xi - x1));
        Image1.Canvas.Pixels[xi, yi] := clRed;
      end;
    end;

    desenhar := False;
  end
  else if(op = 3) then
  begin
    x3:= X;
    y3:= Y;
    R:= round(sqrt((x3-x1)*(x3-x1)+(y3-y1)*(y3-y1)));
    i:= -R;
    while (i <= R) do
    begin
      yi:=round(sqrt(R*R-i*i));
      xi:= round(i);
      Image1.Canvas.Pixels[x1+xi,y1+yi]:= clRed;
      Image1.Canvas.Pixels[x1+xi,y1-yi] := clRed;
      i:= i + 0.009;
    end;
  end
  else if (op = 4) then
  begin
    x3:= X;
    y3:= Y;
    R:= round(sqrt((x3-x1)*(x3-x1)+(y3-y1)*(y3-y1)));
    i := 0;
    while(i < 6.28) do
    begin
      xi:= round(R * cos(i));
      yi:= round(R * Sin(i));
      Image1.Canvas.Pixels[x1+xi, y1+yi] := clRed;
      if(R>0)then
      begin
        i:= i+1/R;
      end
      else  i:= i+1;
    end;
  end
  else if(op = 5) then
  begin
    x3:=X;
    y3:=Y;
    R:= round(sqrt((x3-x1)*(x3-x1)+(y3-y1)*(y3-y1)));
    xi := R;
    yi := 0;
    cos1 := cos(1);
    sin1 := sin(1);
    i:=1;

    while (i <= 360) do
    begin
      m:= (xi*cos1-yi*sin1);
      yi:= round(xi*sin1+yi*cos1);
      xi:= round(m);
      Image1.Canvas.Pixels[x1+xi, y1+yi] := clRed;
      i:= i+1;
    end;
  end
  else if(op = 6) then
  begin
    if (contador = 0 ) then
    begin
      xa := X;
      ya := Y;
      Edit3.Text := IntToStr(xi);
      Edit4.Text := IntToStr(yi);
      contador := contador + 1;
    end
    else
    begin
      xb := X;
      yb := Y;
      contador := 0;
      for n:= (min(xa,xb)) to max(xa,xb) do
      begin
         Image1.Canvas.Pixels[n,min(ya,yb)] := clred;
         Image1.Canvas.Pixels[n,max(ya,yb)] := clred;
      end;

      for n:=min(ya,yb) to max(ya,yb) do
      begin
          Image1.Canvas.Pixels[min(xa,xb),n] := clred;
          Image1.Canvas.Pixels[max(xa,xb),n] := clred;
      end;
      op:=7;
    end;
  end
  else if(op = 7) then
  begin
    janelas := 0;
    x2:=X;
    y2:=Y;



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

procedure TForm1.MenuItem6Click(Sender: TObject);
begin
  op:=3;
end;

procedure TForm1.MenuItem7Click(Sender: TObject);
begin
  op:=4;
end;

procedure TForm1.MenuItem8Click(Sender: TObject);
begin
  op:=5;
end;

procedure TForm1.MenuItem9Click(Sender: TObject);
begin
  op:=6;
end;


end.

