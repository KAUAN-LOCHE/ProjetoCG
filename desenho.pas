unit desenho;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Menus,
  StdCtrls, ExtDlgs, Math;

type
  TMatriz = array of array of Double;

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    Edit18: TEdit;
    Edit19: TEdit;
    Edit2: TEdit;
    Edit20: TEdit;
    Edit21: TEdit;
    Edit22: TEdit;
    Edit23: TEdit;
    Edit24: TEdit;
    Edit25: TEdit;
    Edit26: TEdit;
    Edit27: TEdit;
    Edit28: TEdit;
    Edit29: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem17: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    OpenPictureDialog1: TOpenPictureDialog;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    procedure Button1Click(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
    procedure Edit6Change(Sender: TObject);
    procedure Edit7Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer
      );
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Label1Click(Sender: TObject);
    procedure MenuItem10Click(Sender: TObject);
    procedure MenuItem12Click(Sender: TObject);
    procedure MenuItem13Click(Sender: TObject);
    procedure MenuItem14Click(Sender: TObject);
    procedure MenuItem15Click(Sender: TObject);
    procedure MenuItem16Click(Sender: TObject);
    procedure MenuItem16MeasureItem(Sender: TObject; ACanvas: TCanvas;
      var AWidth, AHeight: Integer);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure MenuItem8Click(Sender: TObject);
    procedure MenuItem9Click(Sender: TObject);
    procedure RadioButton1Change(Sender: TObject);
    procedure RadioButton2Change(Sender: TObject);
    procedure MultiplicarMatrizes(const Matriz1, Matriz2: TMatriz; var MResultado: TMatriz);
    procedure ProjecaoOrtografica(const MC, MH: TMatriz; const canvasCenterX, CanvasCenterY: Integer);
    procedure RadioButton6Change(Sender: TObject);
    procedure EdgeFill(Bitmap: TBitmap; Scale: Integer);
    procedure seed_fill(x, y: Integer; Cor: TColor);
    procedure seed_fillN8(x, y: Integer; Cor: TColor);
    procedure SortIntArray(var Arr: array of Integer);
    procedure desenhoAula16();
    procedure desenhoAula16B();
    function InverterCor(Cor: TColor): TColor;
  private

  public

  end;


var
  Form1: TForm1;
  op : integer;
  desenhar : boolean;
  x1,xa, ya, xb, yb, x2,y2:integer;
  y1:integer;
  contador, contador2:integer;
  flagOpcao8 : boolean;
  xSeed, ySeed: integer;

implementation


{$R *.lfm}

{ TForm1 }
procedure TForm1.FormCreate(Sender: TObject);
begin
  op := 0;
  x1 := -1;
  y1 := -1;
end;


procedure TForm1.MenuItem1Click(Sender: TObject);
begin

end;

procedure TForm1.MenuItem2Click(Sender: TObject);
begin
end;

procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if(op = 1) then
  begin
     desenhar := true;
  end;

  if (op = 2) or (op = 3) or (op = 4) or (op=5) or (op = 7) or (op = 11) then
  begin
     desenhar := true;
     x1:= X;
     y1:=Y;
     contador2:=0;
  end;

  if(op = 6) then contador2 := 0;

  if (op = 9) or (op =10)  then
  begin
     xSeed := X;
     ySeed := Y;
  end;
end;

procedure TForm1.Image1Click(Sender: TObject);
begin

end;

procedure TForm1.Edit6Change(Sender: TObject);
begin

end;

procedure TForm1.Edit7Change(Sender: TObject);
begin

end;

procedure TForm1.MultiplicarMatrizes(const Matriz1, Matriz2: TMatriz; var MResultado: TMatriz);
var b, c : Integer;
begin
  for b := 0 to 3 do
  begin
       MResultado[0,b] := 0;
       for c := 0 to 3 do
       begin
            MResultado[0,b] := MResultado[0,b] + Matriz1[0,c] * Matriz2[c,b];
       end;
  end;
end;

procedure TForm1.ProjecaoOrtografica(const MC, MH: TMatriz; const canvasCenterX, CanvasCenterY: Integer);
var a, b, c: Integer;
var MResultado: TMatriz;
begin
      SetLength(MResultado, 1, 4);
      //Parte baixo (0,0,0)-(100,0,0)
      MC[0,0] := 0;
      MC[0,1] := 0;
      MC[0,2] := 0;
      MC[0,3] := 1;
      for a := 0 to 100 do
      begin
        MC[0,0] := a;
        MultiplicarMatrizes(MC, MH, MResultado);
        Image1.Canvas.Pixels[canvasCenterX + Round(MResultado[0,0]), canvasCenterY - Round(MResultado[0,1])] := clred;
      end;

      //Parte baixo (100,0,0)-(100,0,100)
      MC[0,0] := 100;
      MC[0,1] := 0;
      MC[0,2] := 0;
      MC[0,3] := 1;
      for a := 0 to 100 do
      begin
        MC[0,2] := a;
        MultiplicarMatrizes(MC, MH, MResultado);
        Image1.Canvas.Pixels[canvasCenterX + Round(MResultado[0,0]), canvasCenterY - Round(MResultado[0,1])] := clred;
      end;

      //Parte baixo (0,0,100)-(100,0,100)
      MC[0,0] := 0;
      MC[0,1] := 0;
      MC[0,2] := 100;
      MC[0,3] := 1;
      for a := 0 to 100 do
      begin
        MC[0,0] := a;
        MultiplicarMatrizes(MC, MH, MResultado);
        Image1.Canvas.Pixels[canvasCenterX + Round(MResultado[0,0]), canvasCenterY - Round(MResultado[0,1])] := clred;
      end;

      //Parte baixo (0,0,0)-(0,0,100)
      MC[0,0] := 0;
      MC[0,1] := 0;
      MC[0,2] := 0;
      MC[0,3] := 1;
      for a := 0 to 100 do
      begin
        MC[0,2] := a;
        MultiplicarMatrizes(MC, MH, MResultado);
        Image1.Canvas.Pixels[canvasCenterX + Round(MResultado[0,0]), canvasCenterY - Round(MResultado[0,1])] := clred;
      end;

      //Parte vertical (0,0,0)-(0,100,0)
      MC[0,0] := 0;
      MC[0,1] := 0;
      MC[0,2] := 0;
      MC[0,3] := 1;
      for a := 0 to 100 do
      begin
        MC[0,1] := a;
        MultiplicarMatrizes(MC, MH, MResultado);
        Image1.Canvas.Pixels[canvasCenterX + Round(MResultado[0,0]), canvasCenterY - Round(MResultado[0,1])] := clred;
      end;

      //Parte vertical (0,0,100)-(0,100,100)
      MC[0,0] := 0;
      MC[0,1] := 0;
      MC[0,2] := 0;
      MC[0,3] := 1;
      for a := 0 to 100 do
      begin
        MC[0,1] := a;
        MultiplicarMatrizes(MC, MH, MResultado);
        Image1.Canvas.Pixels[canvasCenterX + Round(MResultado[0,0]), canvasCenterY - Round(MResultado[0,1])] := clred;
      end;

      //Parte vertical (100,0,0)-(100,100,0)
      MC[0,0] := 100;
      MC[0,1] := 0;
      MC[0,2] := 0;
      MC[0,3] := 1;
      for a := 0 to 100 do
      begin
        MC[0,1] := a;
        MultiplicarMatrizes(MC, MH, MResultado);
        Image1.Canvas.Pixels[canvasCenterX + Round(MResultado[0,0]), canvasCenterY - Round(MResultado[0,1])] := clred;
      end;

      //Parte vertical (100,0,100)-(100,100,100)
      MC[0,0] := 100;
      MC[0,1] := 0;
      MC[0,2] := 100;
      MC[0,3] := 1;
      for a := 0 to 100 do
      begin
        MC[0,1] := a;
        MultiplicarMatrizes(MC, MH, MResultado);
        Image1.Canvas.Pixels[canvasCenterX + Round(MResultado[0,0]), canvasCenterY - Round(MResultado[0,1])] := clred;
      end;

      //Parte superior (0,100,0)-(0,100,100)
      MC[0,0] := 0;
      MC[0,1] := 100;
      MC[0,2] := 0;
      MC[0,3] := 1;
      for a := 0 to 100 do
      begin
        MC[0,2] := a;
        MultiplicarMatrizes(MC, MH, MResultado);
        Image1.Canvas.Pixels[canvasCenterX + Round(MResultado[0,0]), canvasCenterY - Round(MResultado[0,1])] := clred;
      end;

      //Parte superior (100,100,0)-(100,100,100)
      MC[0,0] := 100;
      MC[0,1] := 100;
      MC[0,2] := 0;
      MC[0,3] := 1;
      for a := 0 to 100 do
      begin
        MC[0,2] := a;
        MultiplicarMatrizes(MC, MH, MResultado);
        Image1.Canvas.Pixels[canvasCenterX + Round(MResultado[0,0]), canvasCenterY - Round(MResultado[0,1])] := clred;
      end;

      //Parte superior (50,150,0)-(50,150,100)
      MC[0,0] := 50;
      MC[0,1] := 150;
      MC[0,2] := 0;
      MC[0,3] := 1;
      for a := 0 to 100 do
      begin
        MC[0,2] := a;
        MultiplicarMatrizes(MC, MH, MResultado);
        Image1.Canvas.Pixels[canvasCenterX + Round(MResultado[0,0]), canvasCenterY - Round(MResultado[0,1])] := clred;
      end;

      //Parte superior diagonal (0,100,0)-(50,150,0)
      MC[0,0] := 0;
      MC[0,1] := 100;
      MC[0,2] := 0;
      MC[0,3] := 1;
      for a := 0 to 50 do
      begin
        MC[0,0] := a;
        MC[0,1] := 100 + a;
        MultiplicarMatrizes(MC, MH, MResultado);
        Image1.Canvas.Pixels[canvasCenterX + Round(MResultado[0,0]), canvasCenterY - Round(MResultado[0,1])] := clred;
      end;

      //Parte superior diagonal (0,100,100)-(50,150,100)
      MC[0,0] := 0;
      MC[0,1] := 100;
      MC[0,2] := 100;
      MC[0,3] := 1;
      for a := 0 to 50 do
      begin
        MC[0,0] := a;
        MC[0,1] := 100 + a;
        MultiplicarMatrizes(MC, MH, MResultado);
        Image1.Canvas.Pixels[canvasCenterX + Round(MResultado[0,0]), canvasCenterY - Round(MResultado[0,1])] := clred;
      end;

      //Parte superior diagonal (50,150,0)-(100,100,0)
      MC[0,0] := 50;
      MC[0,1] := 150;
      MC[0,2] := 0;
      MC[0,3] := 1;
      for a := 0 to 50 do
      begin
        MC[0,0] := 50 + a;
        MC[0,1] := 150 - a;
        MultiplicarMatrizes(MC, MH, MResultado);
        Image1.Canvas.Pixels[canvasCenterX + Round(MResultado[0,0]), canvasCenterY - Round(MResultado[0,1])] := clred;
      end;

      //Parte superior diagonal (50,150,100)-(100,100,100)
      MC[0,0] := 50;
      MC[0,1] := 150;
      MC[0,2] := 100;
      MC[0,3] := 1;
      for a := 0 to 50 do
      begin
        MC[0,0] := 50 + a;
        MC[0,1] := 150 - a;
        MultiplicarMatrizes(MC, MH, MResultado);
        Image1.Canvas.Pixels[canvasCenterX + Round(MResultado[0,0]), canvasCenterY - Round(MResultado[0,1])] := clred;
      end;

end;

procedure TForm1.RadioButton6Change(Sender: TObject);
begin

end;

procedure TForm1.Button1Click(Sender: TObject);
var
  a, b, c, cx, cy, cz : Integer;
  MC, MH, MHO, MHTPos, MHTNeg, MResultado, MResultadoO, MResultadoT : array of array of Double;
  canvasCenterX, canvasCenterY : Integer;
  aa, bb, cc, dd, ee, ff, gg, hh, ii, jj, kk, ll, mm, nn, oo, pp : Double;
begin
  // Escala Local
  if RadioButton1.Checked and FlagOpcao8 then
  begin
    aa := StrToFloat(Edit5.Text);
    bb := StrToFloat(Edit6.Text);
    cc := StrToFloat(Edit7.Text);
    canvasCenterX := Image1.Width div 2;
    canvasCenterY := Image1.Height div 2;

    SetLength(MC, 1, 4);
    SetLength(MH, 4, 4);
    for a := 0 to 3 do
    begin
         for b := 0 to 3 do
         begin
              MH[a,b] := 0;
         end;
    end;
    MH[0,0] := 1 * aa;
    MH[1,1] := 1 * bb;
    MH[2,2] := 1 * cc;
    MH[3,3] := 1;

    ProjecaoOrtografica(MC, MH, canvasCenterX, canvasCenterY);
  end;

  // Escala Global
  if RadioButton2.Checked and flagOpcao8 then
  begin
    aa := StrToFloat(Edit8.Text);

    canvasCenterX := Image1.Width div 2;
    canvasCenterY := Image1.Height div 2;

      SetLength(MC, 1, 4);
      SetLength(MH, 4, 4);

      for a := 0 to 3 do
      begin
        for b := 0 to 3 do
        begin
          MH[a,b] := 0;
        end;
      end;
      MH[0,0] := 1 / aa;
      MH[1,1] := 1 / aa;
      MH[2,2] := 1 / aa;
      MH[3,3] := 1;

    ProjecaoOrtografica(MC, MH, canvasCenterX, canvasCenterY);

  end;

  // Translação
  if RadioButton3.Checked and flagOpcao8 then
  begin
    aa := StrToFloat(Edit9.Text);
    bb := StrToFloat(Edit10.Text);
    cc := StrToFloat(Edit11.Text);

    canvasCenterX := Image1.Width div 2;
    canvasCenterY := Image1.Height div 2;


      SetLength(MC, 1, 4);
      SetLength(MH, 4, 4);
      for a := 0 to 3 do
      begin
        for b := 0 to 3 do
        begin
          MH[a,b] := 0;
        end;
      end;
      MH[0,0] := 1;
      MH[1,1] := 1;
      MH[2,2] := 1;
      MH[3,3] := 1;
      MH[3,0] := aa;
      MH[3,1] := bb;
      MH[3,2] := cc;

      ProjecaoOrtografica(MC, MH, canvasCenterX, canvasCenterY);
    end;

  // Rotação em torno eixos na origem
  if RadioButton4.Checked and flagOpcao8 then
  begin
    aa := StrToFloat(Edit13.Text) * Pi / 180;

    canvasCenterX := Image1.Width div 2;
    canvasCenterY := Image1.Height div 2;

    begin
      SetLength(MC, 1, 4);
      SetLength(MH, 4, 4);
      SetLength(MHO, 4, 4);
      SetLength(MResultado, 1, 4);
      SetLength(MResultadoO, 1, 4);
      for a := 0 to 3 do
      begin
        for b := 0 to 3 do
        begin
          MH[a,b] := 0;
          MHO[a,b] := 0;
        end;
      end;
      MH[0,0] := 1;
      MH[1,1] := 1;
      MH[2,2] := 1;
      MH[3,3] := 1;

      MHO[0,0] := 1;
      MHO[1,1] := 1;
      MHO[2,2] := 1;
      MHO[3,3] := 1;
      if (Edit12.Text = 'X') or (Edit12.Text = 'x') then
      begin
        MHO[1,1] := cos(aa);
        MHO[1,2] := sin(aa);
        MHO[2,1] := -sin(aa);
        MHO[2,2] := cos(aa);
      end;

      if (Edit12.Text = 'Y') or (Edit12.Text = 'y') then
      begin
        MHO[0,0] := cos(aa);
        MHO[0,2] := -sin(aa);
        MHO[2,0] := sin(aa);
        MHO[2,2] := cos(aa);
      end;

      if (Edit12.Text = 'Z') or (Edit12.Text = 'z') then
      begin
        MHO[0,0] := cos(aa);
        MHO[0,1] := sin(aa);
        MHO[1,0] := -sin(aa);
        MHO[1,1] := cos(aa);
      end;

      //Parte baixo (0,0,0)-(100,0,0)
      MC[0,0] := 0;
      MC[0,1] := 0;
      MC[0,2] := 0;
      MC[0,3] := 1;
      for a := 0 to 100 do
      begin
        MC[0,0] := a;
        for b := 0 to 3 do
        begin
          MResultadoO[0,b] := 0;
          MResultado[0,b] := 0;
        end;
        MultiplicarMatrizes(MC, MHO, MResultadoO);
        MultiplicarMatrizes(MResultadoO, MH, MResultado);
        Image1.Canvas.Pixels[canvasCenterX + Round(MResultado[0,0]), canvasCenterY - Round(MResultado[0,1])] := clred;
      end;

      //Parte baixo (100,0,0)-(100,0,100)
      MC[0,0] := 100;
      MC[0,1] := 0;
      MC[0,2] := 0;
      MC[0,3] := 1;
      for a := 0 to 100 do
      begin
        MC[0,2] := a;
        for b := 0 to 3 do
        begin
          MResultadoO[0,b] := 0;
          MResultado[0,b] := 0;
        end;
        MultiplicarMatrizes(MC, MHO, MResultadoO);
        MultiplicarMatrizes(MResultadoO, MH, MResultado);
        Image1.Canvas.Pixels[canvasCenterX + Round(MResultado[0,0]), canvasCenterY - Round(MResultado[0,1])] := clred;
      end;

      //Parte baixo (0,0,100)-(100,0,100)
      MC[0,0] := 0;
      MC[0,1] := 0;
      MC[0,2] := 100;
      MC[0,3] := 1;
      for a := 0 to 100 do
      begin
        MC[0,0] := a;
        for b := 0 to 3 do
        begin
          MResultadoO[0,b] := 0;
          MResultado[0,b] := 0;
        end;
        MultiplicarMatrizes(MC, MHO, MResultadoO);
        MultiplicarMatrizes(MResultadoO, MH, MResultado);
        Image1.Canvas.Pixels[canvasCenterX + Round(MResultado[0,0]), canvasCenterY - Round(MResultado[0,1])] := clred;
      end;

      //Parte baixo (0,0,0)-(0,0,100)
      MC[0,0] := 0;
      MC[0,1] := 0;
      MC[0,2] := 0;
      MC[0,3] := 1;
      for a := 0 to 100 do
      begin
        MC[0,2] := a;
        for b := 0 to 3 do
        begin
          MResultadoO[0,b] := 0;
          MResultado[0,b] := 0;
        end;
        MultiplicarMatrizes(MC, MHO, MResultadoO);
        MultiplicarMatrizes(MResultadoO, MH, MResultado);
        Image1.Canvas.Pixels[canvasCenterX + Round(MResultado[0,0]), canvasCenterY - Round(MResultado[0,1])] := clred;
      end;

      //Parte vertical (0,0,0)-(0,100,0)
      MC[0,0] := 0;
      MC[0,1] := 0;
      MC[0,2] := 0;
      MC[0,3] := 1;
      for a := 0 to 100 do
      begin
        MC[0,1] := a;
        for b := 0 to 3 do
        begin
          MResultadoO[0,b] := 0;
          MResultado[0,b] := 0;
        end;
        MultiplicarMatrizes(MC, MHO, MResultadoO);
        MultiplicarMatrizes(MResultadoO, MH, MResultado);
        Image1.Canvas.Pixels[canvasCenterX + Round(MResultado[0,0]), canvasCenterY - Round(MResultado[0,1])] := clred;
      end;

      //Parte vertical (0,0,100)-(0,100,100)
      MC[0,0] := 0;
      MC[0,1] := 0;
      MC[0,2] := 0;
      MC[0,3] := 1;
      for a := 0 to 100 do
      begin
        MC[0,1] := a;
        for b := 0 to 3 do
        begin
          MResultadoO[0,b] := 0;
          MResultado[0,b] := 0;
        end;
        MultiplicarMatrizes(MC, MHO, MResultadoO);
        MultiplicarMatrizes(MResultadoO, MH, MResultado);
        Image1.Canvas.Pixels[canvasCenterX + Round(MResultado[0,0]), canvasCenterY - Round(MResultado[0,1])] := clred;
      end;

      //Parte vertical (100,0,0)-(100,100,0)
      MC[0,0] := 100;
      MC[0,1] := 0;
      MC[0,2] := 0;
      MC[0,3] := 1;
      for a := 0 to 100 do
      begin
        MC[0,1] := a;
        for b := 0 to 3 do
        begin
          MResultadoO[0,b] := 0;
          MResultado[0,b] := 0;
        end;
        MultiplicarMatrizes(MC, MHO, MResultadoO);
        MultiplicarMatrizes(MResultadoO, MH, MResultado);
        Image1.Canvas.Pixels[canvasCenterX + Round(MResultado[0,0]), canvasCenterY - Round(MResultado[0,1])] := clred;
      end;

      //Parte vertical (100,0,100)-(100,100,100)
      MC[0,0] := 100;
      MC[0,1] := 0;
      MC[0,2] := 100;
      MC[0,3] := 1;
      for a := 0 to 100 do
      begin
        MC[0,1] := a;
        for b := 0 to 3 do
        begin
          MResultadoO[0,b] := 0;
          MResultado[0,b] := 0;
        end;
        MultiplicarMatrizes(MC, MHO, MResultadoO);
        MultiplicarMatrizes(MResultadoO, MH, MResultado);
        Image1.Canvas.Pixels[canvasCenterX + Round(MResultado[0,0]), canvasCenterY - Round(MResultado[0,1])] := clred;
      end;

      //Parte superior (0,100,0)-(0,100,100)
      MC[0,0] := 0;
      MC[0,1] := 100;
      MC[0,2] := 0;
      MC[0,3] := 1;
      for a := 0 to 100 do
      begin
        MC[0,2] := a;
        for b := 0 to 3 do
        begin
          MResultadoO[0,b] := 0;
          MResultado[0,b] := 0;
        end;
        MultiplicarMatrizes(MC, MHO, MResultadoO);
        MultiplicarMatrizes(MResultadoO, MH, MResultado);
        Image1.Canvas.Pixels[canvasCenterX + Round(MResultado[0,0]), canvasCenterY - Round(MResultado[0,1])] := clred;
      end;

      //Parte superior (100,100,0)-(100,100,100)
      MC[0,0] := 100;
      MC[0,1] := 100;
      MC[0,2] := 0;
      MC[0,3] := 1;
      for a := 0 to 100 do
      begin
        MC[0,2] := a;
        for b := 0 to 3 do
        begin
          MResultadoO[0,b] := 0;
          MResultado[0,b] := 0;
        end;
        MultiplicarMatrizes(MC, MHO, MResultadoO);
        MultiplicarMatrizes(MResultadoO, MH, MResultado);
        Image1.Canvas.Pixels[canvasCenterX + Round(MResultado[0,0]), canvasCenterY - Round(MResultado[0,1])] := clred;
      end;

      //Parte superior (50,150,0)-(50,150,100)
      MC[0,0] := 50;
      MC[0,1] := 150;
      MC[0,2] := 0;
      MC[0,3] := 1;
      for a := 0 to 100 do
      begin
        MC[0,2] := a;
        for b := 0 to 3 do
        begin
          MResultadoO[0,b] := 0;
          MResultado[0,b] := 0;
        end;
        MultiplicarMatrizes(MC, MHO, MResultadoO);
        MultiplicarMatrizes(MResultadoO, MH, MResultado);
        Image1.Canvas.Pixels[canvasCenterX + Round(MResultado[0,0]), canvasCenterY - Round(MResultado[0,1])] := clred;
      end;

      //Parte superior diagonal (0,100,0)-(50,150,0)
      MC[0,0] := 0;
      MC[0,1] := 100;
      MC[0,2] := 0;
      MC[0,3] := 1;
      for a := 0 to 50 do
      begin
        MC[0,0] := a;
        MC[0,1] := 100 + a;
        for b := 0 to 3 do
        begin
          MResultadoO[0,b] := 0;
          MResultado[0,b] := 0;
        end;
        MultiplicarMatrizes(MC, MHO, MResultadoO);
        MultiplicarMatrizes(MResultadoO, MH, MResultado);
        Image1.Canvas.Pixels[canvasCenterX + Round(MResultado[0,0]), canvasCenterY - Round(MResultado[0,1])] := clred;
      end;

      //Parte superior diagonal (0,100,100)-(50,150,100)
      MC[0,0] := 0;
      MC[0,1] := 100;
      MC[0,2] := 100;
      MC[0,3] := 1;
      for a := 0 to 50 do
      begin
        MC[0,0] := a;
        MC[0,1] := 100 + a;
        for b := 0 to 3 do
        begin
          MResultadoO[0,b] := 0;
          MResultado[0,b] := 0;
        end;
        MultiplicarMatrizes(MC, MHO, MResultadoO);
        MultiplicarMatrizes(MResultadoO, MH, MResultado);
        Image1.Canvas.Pixels[canvasCenterX + Round(MResultado[0,0]), canvasCenterY - Round(MResultado[0,1])] := clred;
      end;

      //Parte superior diagonal (50,150,0)-(100,100,0)
      MC[0,0] := 50;
      MC[0,1] := 150;
      MC[0,2] := 0;
      MC[0,3] := 1;
      for a := 0 to 50 do
      begin
        MC[0,0] := 50 + a;
        MC[0,1] := 150 - a;
        for b := 0 to 3 do
        begin
          MResultadoO[0,b] := 0;
          MResultado[0,b] := 0;
        end;
        MultiplicarMatrizes(MC, MHO, MResultadoO);
        MultiplicarMatrizes(MResultadoO, MH, MResultado);
        Image1.Canvas.Pixels[canvasCenterX + Round(MResultado[0,0]), canvasCenterY - Round(MResultado[0,1])] := clred;
      end;

      //Parte superior diagonal (50,150,100)-(100,100,100)
      MC[0,0] := 50;
      MC[0,1] := 150;
      MC[0,2] := 100;
      MC[0,3] := 1;
      for a := 0 to 50 do
      begin
        MC[0,0] := 50 + a;
        MC[0,1] := 150 - a;
        for b := 0 to 3 do
        begin
          MResultadoO[0,b] := 0;
          MResultado[0,b] := 0;
        end;
        MultiplicarMatrizes(MC, MHO, MResultadoO);
        MultiplicarMatrizes(MResultadoO, MH, MResultado);
        Image1.Canvas.Pixels[canvasCenterX + Round(MResultado[0,0]), canvasCenterY - Round(MResultado[0,1])] := clred;
      end;

      end;
    end;

  // Rotação em torno eixos no centro objeto
  if RadioButton5.Checked and flagOpcao8 then
  begin
    cx := 50;
    cy := 70;
    cz := 50;
    aa := StrToFloat(Edit13.Text) * Pi / 180;

    canvasCenterX := Image1.Width div 2;
    canvasCenterY := Image1.Height div 2;

    begin
      SetLength(MC, 1, 4);
      SetLength(MH, 4, 4);
      SetLength(MHO, 4, 4);
      SetLength(MHTPos, 4, 4);
      SetLength(MHTNeg, 4, 4);
      SetLength(MResultado, 1, 4);
      SetLength(MResultadoO, 1, 4);
      SetLength(MResultadoT, 1, 4);
      for a := 0 to 3 do
      begin
        for b := 0 to 3 do
        begin
          MH[a,b] := 0;
          MHO[a,b] := 0;
          MHTPos[a,b] := 0;
          MHTNeg[a,b] := 0;
        end;
      end;
      MH[0,0] := 1;
      MH[1,1] := 1;
      MH[2,2] := 1;
      MH[3,3] := 1;

      MHO[0,0] := 1;
      MHO[1,1] := 1;
      MHO[2,2] := 1;
      MHO[3,3] := 1;

      MHTPos[0,0] := 1;
      MHTPos[1,1] := 1;
      MHTPos[2,2] := 1;
      MHTPos[3,3] := 1;

      MHTNeg[0,0] := 1;
      MHTNeg[1,1] := 1;
      MHTNeg[2,2] := 1;
      MHTNeg[3,3] := 1;

      if (Edit12.Text = 'X') or (Edit12.Text = 'x') then
      begin
        MHO[1,1] := cos(aa);
        MHO[1,2] := sin(aa);
        MHO[2,1] := -sin(aa);
        MHO[2,2] := cos(aa);
      end;

      if (Edit12.Text = 'Y') or (Edit12.Text = 'y') then
      begin
        MHO[0,0] := cos(aa);
        MHO[0,2] := -sin(aa);
        MHO[2,0] := sin(aa);
        MHO[2,2] := cos(aa);
      end;

      if (Edit12.Text = 'Z') or (Edit12.Text = 'z') then
      begin
        MHO[0,0] := cos(aa);
        MHO[0,1] := sin(aa);
        MHO[1,0] := -sin(aa);
        MHO[1,1] := cos(aa);
      end;

      MHTPos[3,0] := cx;
      MHTPos[3,1] := cy;
      MHTPos[3,2] := cz;

      MHTNeg[3,0] := -cx;
      MHTNeg[3,1] := -cy;
      MHTNeg[3,2] := -cz;

      //Parte baixo (0,0,0)-(100,0,0)
      MC[0,0] := 0;
      MC[0,1] := 0;
      MC[0,2] := 0;
      MC[0,3] := 1;
      for a := 0 to 100 do
      begin
        MC[0,0] := a;
        for b := 0 to 3 do
        begin
          MResultadoT[0,b] := 0;
          MResultadoO[0,b] := 0;
          MResultado[0,b] := 0;
        end;
        MultiplicarMatrizes(MC, MHTNeg, MResultadoT);
        MultiplicarMatrizes(MResultadoT, MHO, MResultadoO);
        for b := 0 to 3 do
        begin
            MResultadoT[0,b] := 0;
        end;
        MultiplicarMatrizes(MResultadoO, MHTPos, MResultadoT);
        MultiplicarMatrizes(MResultadoT, MH, MResultado);
        Image1.Canvas.Pixels[canvasCenterX + Round(MResultado[0,0]), canvasCenterY - Round(MResultado[0,1])] := clred;
      end;

      //Parte baixo (100,0,0)-(100,0,100)
      MC[0,0] := 100;
      MC[0,1] := 0;
      MC[0,2] := 0;
      MC[0,3] := 1;
      for a := 0 to 100 do
      begin
        MC[0,2] := a;
        for b := 0 to 3 do
        begin
          MResultadoT[0,b] := 0;
          MResultadoO[0,b] := 0;
          MResultado[0,b] := 0;

        end;
        MultiplicarMatrizes(MC, MHTNeg, MResultadoT);
        MultiplicarMatrizes(MResultadoT, MHO, MResultadoO);
        for b := 0 to 3 do
        begin
            MResultadoT[0,b] := 0;
        end;
        MultiplicarMatrizes(MResultadoO, MHTPos, MResultadoT);
        MultiplicarMatrizes(MResultadoT, MH, MResultado);
        Image1.Canvas.Pixels[canvasCenterX + Round(MResultado[0,0]), canvasCenterY - Round(MResultado[0,1])] := clred;
      end;

      //Parte baixo (0,0,100)-(100,0,100)
      MC[0,0] := 0;
      MC[0,1] := 0;
      MC[0,2] := 100;
      MC[0,3] := 1;
      for a := 0 to 100 do
      begin
        MC[0,0] := a;
        for b := 0 to 3 do
        begin
          MResultadoT[0,b] := 0;
          MResultadoO[0,b] := 0;
          MResultado[0,b] := 0;

        end;
        MultiplicarMatrizes(MC, MHTNeg, MResultadoT);
        MultiplicarMatrizes(MResultadoT, MHO, MResultadoO);
        for b := 0 to 3 do
        begin
            MResultadoT[0,b] := 0;
        end;
        MultiplicarMatrizes(MResultadoO, MHTPos, MResultadoT);
        MultiplicarMatrizes(MResultadoT, MH, MResultado);
        Image1.Canvas.Pixels[canvasCenterX + Round(MResultado[0,0]), canvasCenterY - Round(MResultado[0,1])] := clred;
      end;

      //Parte baixo (0,0,0)-(0,0,100)
      MC[0,0] := 0;
      MC[0,1] := 0;
      MC[0,2] := 0;
      MC[0,3] := 1;
      for a := 0 to 100 do
      begin
        MC[0,2] := a;
        for b := 0 to 3 do
        begin
          MResultadoT[0,b] := 0;
          MResultadoO[0,b] := 0;
          MResultado[0,b] := 0;

        end;
        MultiplicarMatrizes(MC, MHTNeg, MResultadoT);
        MultiplicarMatrizes(MResultadoT, MHO, MResultadoO);
        for b := 0 to 3 do
        begin
            MResultadoT[0,b] := 0;
        end;
        MultiplicarMatrizes(MResultadoO, MHTPos, MResultadoT);
        MultiplicarMatrizes(MResultadoT, MH, MResultado);
        Image1.Canvas.Pixels[canvasCenterX + Round(MResultado[0,0]), canvasCenterY - Round(MResultado[0,1])] := clred;
      end;

      //Parte vertical (0,0,0)-(0,100,0)
      MC[0,0] := 0;
      MC[0,1] := 0;
      MC[0,2] := 0;
      MC[0,3] := 1;
      for a := 0 to 100 do
      begin
        MC[0,1] := a;
        for b := 0 to 3 do
        begin
          MResultadoT[0,b] := 0;
          MResultadoO[0,b] := 0;
          MResultado[0,b] := 0;

        end;
        MultiplicarMatrizes(MC, MHTNeg, MResultadoT);
        MultiplicarMatrizes(MResultadoT, MHO, MResultadoO);
        for b := 0 to 3 do
        begin
            MResultadoT[0,b] := 0;
        end;
        MultiplicarMatrizes(MResultadoO, MHTPos, MResultadoT);
        MultiplicarMatrizes(MResultadoT, MH, MResultado);
        Image1.Canvas.Pixels[canvasCenterX + Round(MResultado[0,0]), canvasCenterY - Round(MResultado[0,1])] := clred;
      end;

      //Parte vertical (0,0,100)-(0,100,100)
      MC[0,0] := 0;
      MC[0,1] := 0;
      MC[0,2] := 0;
      MC[0,3] := 1;
      for a := 0 to 100 do
      begin
        MC[0,1] := a;
        for b := 0 to 3 do
        begin
          MResultadoT[0,b] := 0;
          MResultadoO[0,b] := 0;
          MResultado[0,b] := 0;

        end;
        MultiplicarMatrizes(MC, MHTNeg, MResultadoT);
        MultiplicarMatrizes(MResultadoT, MHO, MResultadoO);
        for b := 0 to 3 do
        begin
            MResultadoT[0,b] := 0;
        end;
        MultiplicarMatrizes(MResultadoO, MHTPos, MResultadoT);
        MultiplicarMatrizes(MResultadoT, MH, MResultado);
        Image1.Canvas.Pixels[canvasCenterX + Round(MResultado[0,0]), canvasCenterY - Round(MResultado[0,1])] := clred;
      end;

      //Parte vertical (100,0,0)-(100,100,0)
      MC[0,0] := 100;
      MC[0,1] := 0;
      MC[0,2] := 0;
      MC[0,3] := 1;
      for a := 0 to 100 do
      begin
        MC[0,1] := a;
        for b := 0 to 3 do
        begin
          MResultadoT[0,b] := 0;
          MResultadoO[0,b] := 0;
          MResultado[0,b] := 0;

        end;
        MultiplicarMatrizes(MC, MHTNeg, MResultadoT);
        MultiplicarMatrizes(MResultadoT, MHO, MResultadoO);
        for b := 0 to 3 do
        begin
            MResultadoT[0,b] := 0;
        end;
        MultiplicarMatrizes(MResultadoO, MHTPos, MResultadoT);
        MultiplicarMatrizes(MResultadoT, MH, MResultado);
        Image1.Canvas.Pixels[canvasCenterX + Round(MResultado[0,0]), canvasCenterY - Round(MResultado[0,1])] := clred;
      end;

      //Parte vertical (100,0,100)-(100,100,100)
      MC[0,0] := 100;
      MC[0,1] := 0;
      MC[0,2] := 100;
      MC[0,3] := 1;
      for a := 0 to 100 do
      begin
        MC[0,1] := a;
        for b := 0 to 3 do
        begin
          MResultadoT[0,b] := 0;
          MResultadoO[0,b] := 0;
          MResultado[0,b] := 0;

        end;
        MultiplicarMatrizes(MC, MHTNeg, MResultadoT);
        MultiplicarMatrizes(MResultadoT, MHO, MResultadoO);
        for b := 0 to 3 do
        begin
            MResultadoT[0,b] := 0;
        end;
        MultiplicarMatrizes(MResultadoO, MHTPos, MResultadoT);
        MultiplicarMatrizes(MResultadoT, MH, MResultado);
        Image1.Canvas.Pixels[canvasCenterX + Round(MResultado[0,0]), canvasCenterY - Round(MResultado[0,1])] := clred;
      end;

      //Parte superior (0,100,0)-(0,100,100)
      MC[0,0] := 0;
      MC[0,1] := 100;
      MC[0,2] := 0;
      MC[0,3] := 1;
      for a := 0 to 100 do
      begin
        MC[0,2] := a;
        for b := 0 to 3 do
        begin
          MResultadoT[0,b] := 0;
          MResultadoO[0,b] := 0;
          MResultado[0,b] := 0;

        end;
        MultiplicarMatrizes(MC, MHTNeg, MResultadoT);
        MultiplicarMatrizes(MResultadoT, MHO, MResultadoO);
        for b := 0 to 3 do
        begin
            MResultadoT[0,b] := 0;
        end;
        MultiplicarMatrizes(MResultadoO, MHTPos, MResultadoT);
        MultiplicarMatrizes(MResultadoT, MH, MResultado);
        Image1.Canvas.Pixels[canvasCenterX + Round(MResultado[0,0]), canvasCenterY - Round(MResultado[0,1])] := clred;
      end;

      //Parte superior (100,100,0)-(100,100,100)
      MC[0,0] := 100;
      MC[0,1] := 100;
      MC[0,2] := 0;
      MC[0,3] := 1;
      for a := 0 to 100 do
      begin
        MC[0,2] := a;
        for b := 0 to 3 do
        begin
          MResultadoT[0,b] := 0;
          MResultadoO[0,b] := 0;
          MResultado[0,b] := 0;

        end;
        MultiplicarMatrizes(MC, MHTNeg, MResultadoT);
        MultiplicarMatrizes(MResultadoT, MHO, MResultadoO);
        for b := 0 to 3 do
        begin
            MResultadoT[0,b] := 0;
        end;
        MultiplicarMatrizes(MResultadoO, MHTPos, MResultadoT);
        MultiplicarMatrizes(MResultadoT, MH, MResultado);
        Image1.Canvas.Pixels[canvasCenterX + Round(MResultado[0,0]), canvasCenterY - Round(MResultado[0,1])] := clred;
      end;

      //Parte superior (50,150,0)-(50,150,100)
      MC[0,0] := 50;
      MC[0,1] := 150;
      MC[0,2] := 0;
      MC[0,3] := 1;
      for a := 0 to 100 do
      begin
        MC[0,2] := a;
        for b := 0 to 3 do
        begin
          MResultadoT[0,b] := 0;
          MResultadoO[0,b] := 0;
          MResultado[0,b] := 0;

        end;
        MultiplicarMatrizes(MC, MHTNeg, MResultadoT);
        MultiplicarMatrizes(MResultadoT, MHO, MResultadoO);
        for b := 0 to 3 do
        begin
            MResultadoT[0,b] := 0;
        end;
        MultiplicarMatrizes(MResultadoO, MHTPos, MResultadoT);
        MultiplicarMatrizes(MResultadoT, MH, MResultado);
        Image1.Canvas.Pixels[canvasCenterX + Round(MResultado[0,0]), canvasCenterY - Round(MResultado[0,1])] := clred;
      end;

      //Parte superior diagonal (0,100,0)-(50,150,0)
      MC[0,0] := 0;
      MC[0,1] := 100;
      MC[0,2] := 0;
      MC[0,3] := 1;
      for a := 0 to 50 do
      begin
        MC[0,0] := a;
        MC[0,1] := 100 + a;
        for b := 0 to 3 do
        begin
          MResultadoT[0,b] := 0;
          MResultadoO[0,b] := 0;
          MResultado[0,b] := 0;

        end;
        MultiplicarMatrizes(MC, MHTNeg, MResultadoT);
        MultiplicarMatrizes(MResultadoT, MHO, MResultadoO);
        for b := 0 to 3 do
        begin
            MResultadoT[0,b] := 0;
        end;
        MultiplicarMatrizes(MResultadoO, MHTPos, MResultadoT);
        MultiplicarMatrizes(MResultadoT, MH, MResultado);
        Image1.Canvas.Pixels[canvasCenterX + Round(MResultado[0,0]), canvasCenterY - Round(MResultado[0,1])] := clred;
      end;

      //Parte superior diagonal (0,100,100)-(50,150,100)
      MC[0,0] := 0;
      MC[0,1] := 100;
      MC[0,2] := 100;
      MC[0,3] := 1;
      for a := 0 to 50 do
      begin
        MC[0,0] := a;
        MC[0,1] := 100 + a;
        for b := 0 to 3 do
        begin
          MResultadoT[0,b] := 0;
          MResultadoO[0,b] := 0;
          MResultado[0,b] := 0;

        end;
        MultiplicarMatrizes(MC, MHTNeg, MResultadoT);
        MultiplicarMatrizes(MResultadoT, MHO, MResultadoO);
        for b := 0 to 3 do
        begin
            MResultadoT[0,b] := 0;
        end;
        MultiplicarMatrizes(MResultadoO, MHTPos, MResultadoT);
        MultiplicarMatrizes(MResultadoT, MH, MResultado);
        Image1.Canvas.Pixels[canvasCenterX + Round(MResultado[0,0]), canvasCenterY - Round(MResultado[0,1])] := clred;
      end;

      //Parte superior diagonal (50,150,0)-(100,100,0)
      MC[0,0] := 50;
      MC[0,1] := 150;
      MC[0,2] := 0;
      MC[0,3] := 1;
      for a := 0 to 50 do
      begin
        MC[0,0] := 50 + a;
        MC[0,1] := 150 - a;
        for b := 0 to 3 do
        begin
          MResultadoT[0,b] := 0;
          MResultadoO[0,b] := 0;
          MResultado[0,b] := 0;

        end;
        MultiplicarMatrizes(MC, MHTNeg, MResultadoT);
        MultiplicarMatrizes(MResultadoT, MHO, MResultadoO);
        for b := 0 to 3 do
        begin
            MResultadoT[0,b] := 0;
        end;
        MultiplicarMatrizes(MResultadoO, MHTPos, MResultadoT);
        MultiplicarMatrizes(MResultadoT, MH, MResultado);
        Image1.Canvas.Pixels[canvasCenterX + Round(MResultado[0,0]), canvasCenterY - Round(MResultado[0,1])] := clred;
      end;

      //Parte superior diagonal (50,150,100)-(100,100,100)
      MC[0,0] := 50;
      MC[0,1] := 150;
      MC[0,2] := 100;
      MC[0,3] := 1;
      for a := 0 to 50 do
      begin
        MC[0,0] := 50 + a;
        MC[0,1] := 150 - a;
        for b := 0 to 3 do
        begin
          MResultadoT[0,b] := 0;
          MResultadoO[0,b] := 0;
          MResultado[0,b] := 0;

        end;
        MultiplicarMatrizes(MC, MHTNeg, MResultadoT);
        MultiplicarMatrizes(MResultadoT, MHO, MResultadoO);
        for b := 0 to 3 do
        begin
            MResultadoT[0,b] := 0;
        end;
        MultiplicarMatrizes(MResultadoO, MHTPos, MResultadoT);
        MultiplicarMatrizes(MResultadoT, MH, MResultado);
        Image1.Canvas.Pixels[canvasCenterX + Round(MResultado[0,0]), canvasCenterY - Round(MResultado[0,1])] := clred;
      end;

      end;
    end;

  // Shearing
  if RadioButton6.Checked and FlagOpcao8 then
  begin
    aa := StrToFloat(Edit14.Text);
    bb := StrToFloat(Edit15.Text);
    cc := StrToFloat(Edit16.Text);
    dd := StrToFloat(Edit17.Text);
    ee := StrToFloat(Edit18.Text);
    ff := StrToFloat(Edit19.Text);
    gg := StrToFloat(Edit20.Text);
    hh := StrToFloat(Edit21.Text);
    ii := StrToFloat(Edit22.Text);
    jj := StrToFloat(Edit23.Text);
    kk := StrToFloat(Edit24.Text);
    ll := StrToFloat(Edit25.Text);
    mm := StrToFloat(Edit26.Text);
    nn := StrToFloat(Edit27.Text);
    oo := StrToFloat(Edit28.Text);
    pp := StrToFloat(Edit29.Text);

    canvasCenterX := Image1.Width div 2;
    canvasCenterY := Image1.Height div 2;

    SetLength(MC, 1, 4);
    SetLength(MH, 4, 4);
    for a := 0 to 3 do
    begin
         for b := 0 to 3 do
         begin
              MH[a,b] := 0;
         end;
    end;
    MH[0,0] := 1 * aa;
    MH[0,1] := 1 * bb;
    MH[0,2] := 1 * cc;
    MH[0,3] := 1 * dd;

    MH[1,0] := 1 * ee;
    MH[1,1] := 1 * ff;
    MH[1,2] := 1 * gg;
    MH[1,3] := 1 * hh;

    MH[2,0] := 1 * ii;
    MH[2,1] := 1 * jj;
    MH[2,2] := 1 * kk;
    MH[2,3] := 1 * ll;

    MH[3,0] := 1 * mm;
    MH[3,1] := 1 * nn;
    MH[3,2] := 1 * oo;
    MH[3,3] := 1 / pp;


    ProjecaoOrtografica(MC, MH, canvasCenterX, canvasCenterY);
  end;

end;

procedure TForm1.Edit5Change(Sender: TObject);
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
function ByteToStr(c: Byte): string;
var
  i: Integer;
begin
  Result := '';
  for i := 3 downto 0 do  // 4 bits, do mais significativo ao menos
  begin
    if (c and (1 shl i)) <> 0 then
      Result := Result + '1'
    else
      Result := Result + '0';
  end;
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
  cod1, cod2: Byte;
  cor : TColor;
  t:real;
  ydir, yesq, xcima, xbaixo: integer;


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
    if (contador2 = 1) then
    begin
      op:= 7;
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
  contador2 := 0;
  x2 := X;
  y2 := Y;

  cod1 := 0;
  cod2 := 0;

  // codificação do ponto 1
  if y1 > max(ya,yb) then cod1 := cod1 or 8;   // acima
  if y1 < min(ya,yb) then cod1 := cod1 or 4;   // abaixo
  if x1 > max(xa,xb) then cod1 := cod1 or 2;   // direita
  if x1 < min(xa,xb) then cod1 := cod1 or 1;   // esquerda

  // codificação do ponto 2
  if y2 > max(ya,yb) then cod2 := cod2 or 8;
  if y2 < min(ya,yb) then cod2 := cod2 or 4;
  if x2 > max(xa,xb) then cod2 := cod2 or 2;
  if x2 < min(xa,xb) then cod2 := cod2 or 1;


  // coeficiente angular (com tratamento para linha vertical)
  if (x2 - x1) <> 0 then
    m := (y2 - y1) / (x2 - x1)
  else
    m := 1e10; // valor grande para linha vertical

  // Passo 2 - totalmente visível
  if (cod1 = 0) and (cod2 = 0) then
  begin
    t := 0;
    while (t < 1) do
    begin
      x3 := round(x1 + (x2 - x1) * t);
      y3 := round(y1 + (y2 - y1) * t);
      Image1.Canvas.Pixels[x3, y3] := clRed;
      t := t + 0.001;
    end;
  end
  // Passo 3 - totalmente invisível
  else if (cod1 and cod2) <> 0 then
  begin
    // Não desenha nada
  end
  // Passo 4 - parcialmente visível, calcular interseções
  else
  begin
    // calcula candidatos às interseções
    if (x2 - x1) <> 0 then
    begin
      yesq   := round(m * (min(xa,xb) - x1) + y1);
      ydir   := round(m * (max(xa,xb) - x1) + y1);
    end
    else
    begin
      yesq := y1;
      ydir := y1;
    end;

    if m <> 0 then
    begin
      xcima  := round((max(ya,yb) - y1) / m + x1);
      xbaixo := round((min(ya,yb) - y1) / m + x1);
    end
    else
    begin
      xcima := x1;
      xbaixo := x1;
    end;

    contador2 := 0;
    xi := 0; yi := 0; x3 := 0; y3 := 0;

    // caso 1: ponto inicial dentro
    if cod1 = 0 then
    begin
      xi := x1;
      yi := y1;

      // Encontra a interseção válida (que conecta ao ponto externo)
      if (cod2 and 1) <> 0 then // ponto 2 está à esquerda
      begin
        x3 := min(xa,xb);
        y3 := yesq;
      end
      else if (cod2 and 2) <> 0 then // ponto 2 está à direita
      begin
        x3 := max(xa,xb);
        y3 := ydir;
      end
      else if (cod2 and 4) <> 0 then // ponto 2 está abaixo
      begin
        x3 := xbaixo;
        y3 := min(ya,yb);
      end
      else if (cod2 and 8) <> 0 then // ponto 2 está acima
      begin
        x3 := xcima;
        y3 := max(ya,yb);
      end;

      // Verifica se a interseção está dentro dos limites da janela
      if (x3 >= min(xa,xb)) and (x3 <= max(xa,xb)) and
         (y3 >= min(ya,yb)) and (y3 <= max(ya,yb)) then
      begin
        contador2 := 2;
      end;
    end
    // caso 2: ponto final dentro
    else if cod2 = 0 then
    begin
      x3 := x2;
      y3 := y2;

      // Encontra a interseção válida (que conecta ao ponto externo)
      if (cod1 and 1) <> 0 then // ponto 1 está à esquerda
      begin
        xi := min(xa,xb);
        yi := yesq;
      end
      else if (cod1 and 2) <> 0 then // ponto 1 está à direita
      begin
        xi := max(xa,xb);
        yi := ydir;
      end
      else if (cod1 and 4) <> 0 then // ponto 1 está abaixo
      begin
        xi := xbaixo;
        yi := min(ya,yb);
      end
      else if (cod1 and 8) <> 0 then // ponto 1 está acima
      begin
        xi := xcima;
        yi := max(ya,yb);
      end;

      // Verifica se a interseção está dentro dos limites da janela
      if (xi >= min(xa,xb)) and (xi <= max(xa,xb)) and
         (yi >= min(ya,yb)) and (yi <= max(ya,yb)) then
      begin
        contador2 := 2;
      end;
    end
    // caso 3: ambos fora mas segmento cruza janela (duas interseções)
    else
    begin
      if (yesq >= min(ya,yb)) and (yesq <= max(ya,yb)) then
      begin
        if contador2 = 0 then
        begin
          xi := min(xa,xb); yi := yesq; contador2 := 1;
        end
        else
        begin
          x3 := min(xa,xb); y3 := yesq; contador2 := 2;
        end;
      end;

      if (ydir >= min(ya,yb)) and (ydir <= max(ya,yb)) and (contador2 <> 2) then
      begin
        if contador2 = 0 then
        begin
          xi := max(xa,xb); yi := ydir; contador2 := 1;
        end
        else
        begin
          x3 := max(xa,xb); y3 := ydir; contador2 := 2;
        end;
      end;

      if (xcima >= min(xa,xb)) and (xcima <= max(xa,xb)) and (contador2 <> 2) then
      begin
        if contador2 = 0 then
        begin
          xi := xcima; yi := max(ya,yb); contador2 := 1;
        end
        else
        begin
          x3 := xcima; y3 := max(ya,yb); contador2 := 2;
        end;
      end;

      if (xbaixo >= min(xa,xb)) and (xbaixo <= max(xa,xb)) and (contador2 <> 2) then
      begin
        if contador2 = 0 then
        begin
          xi := xbaixo; yi := min(ya,yb); contador2 := 1;
        end
        else
        begin
          x3 := xbaixo; y3 := min(ya,yb); contador2 := 2;
        end;
      end;
    end;

    // desenha segmento apenas se encontrou duas interseções válidas
    if contador2 = 2 then
    begin
      t := 0;
      while t < 1 do
      begin
        x2 := round(xi + (x3 - xi) * t);
        y2 := round(yi + (y3 - yi) * t);
        Image1.Canvas.Pixels[x2, y2] := clRed;
        t := t + 0.001;
      end;
    end;
  end;
end
  else if(op = 9) then
  begin
      Cor := Image1.Canvas.Pixels[X, Y];

      if (Cor <> clGreen) and (Cor <> clRed) then
        seed_fill(X, Y, Cor);
      Image1.Refresh;
  end

  else if(op = 10) then
  begin
      Cor := Image1.Canvas.Pixels[X, Y];

      if (Cor <> clGreen) and (Cor <> clRed) then
        seed_fillN8(X, Y, Cor);
      Image1.Refresh;
  end

  else if (op = 11) then
  begin
    t:=0;
    x2:=X;
    y2:= Y;
    while (t < 1) do
    begin
      x3:= round(x1 + (x2-x1) * t);
      y3:= round(y1 + (y2-y1) * t);
      Image1.Canvas.Pixels[x3,y3] := clred;
      t := t + 0.001;
    end;


  end;

end;

procedure TForm1.Label1Click(Sender: TObject);
begin

end;

procedure TForm1.MenuItem10Click(Sender: TObject);
var
  a, aa, b, c : Integer;
  MC, MH, MResultado : array of array of Double;
  canvasCenterX, canvasCenterY : Integer;
begin
  canvasCenterX := Image1.Width div 2;
  canvasCenterY := Image1.Height div 2;

  op := 8;
  flagOpcao8 := True;
  begin
    SetLength(MC, 1, 4);
    SetLength(MH, 4, 4);
    SetLength(MResultado, 1, 4);
    for a := 0 to 3 do
    begin
      for b := 0 to 3 do
      begin
        MH[a,b] := 0;
      end;
    end;
    MH[0,0] := 1;
    MH[1,1] := 1;
    MH[3,3] := 1;

    //Parte baixo (0,0,0)-(100,0,0)
    MC[0,0] := 0;
    MC[0,1] := 0;
    MC[0,2] := 0;
    MC[0,3] := 1;
    for a := 0 to 100 do
    begin
      MC[0,0] := a;
      MultiplicarMatrizes(MC, MH, MResultado);
      Image1.Canvas.Pixels[canvasCenterX + Round(MResultado[0,0]), canvasCenterY - Round(MResultado[0,1])] := clred;
    end;

    //Parte baixo (100,0,0)-(100,0,100)
    MC[0,0] := 100;
    MC[0,1] := 0;
    MC[0,2] := 0;
    MC[0,3] := 1;
    for a := 0 to 100 do
    begin
      MC[0,2] := a;
      MultiplicarMatrizes(MC, MH, MResultado);
      Image1.Canvas.Pixels[canvasCenterX + Round(MResultado[0,0]), canvasCenterY - Round(MResultado[0,1])] := clred;
    end;

    //Parte baixo (0,0,100)-(100,0,100)
    MC[0,0] := 0;
    MC[0,1] := 0;
    MC[0,2] := 100;
    MC[0,3] := 1;
    for a := 0 to 100 do
    begin
      MC[0,0] := a;
      MultiplicarMatrizes(MC, MH, MResultado);
      Image1.Canvas.Pixels[canvasCenterX + Round(MResultado[0,0]), canvasCenterY - Round(MResultado[0,1])] := clred;
    end;

    //Parte baixo (0,0,0)-(0,0,100)
    MC[0,0] := 0;
    MC[0,1] := 0;
    MC[0,2] := 0;
    MC[0,3] := 1;
    for a := 0 to 100 do
    begin
      MC[0,2] := a;
      MultiplicarMatrizes(MC, MH, MResultado);
      Image1.Canvas.Pixels[canvasCenterX + Round(MResultado[0,0]), canvasCenterY - Round(MResultado[0,1])] := clred;
    end;

    //Parte vertical (0,0,0)-(0,100,0)
    MC[0,0] := 0;
    MC[0,1] := 0;
    MC[0,2] := 0;
    MC[0,3] := 1;
    for a := 0 to 100 do
    begin
      MC[0,1] := a;
      MultiplicarMatrizes(MC, MH, MResultado);
      Image1.Canvas.Pixels[canvasCenterX + Round(MResultado[0,0]), canvasCenterY - Round(MResultado[0,1])] := clred;
    end;

    //Parte vertical (0,0,100)-(0,100,100)
    MC[0,0] := 0;
    MC[0,1] := 0;
    MC[0,2] := 0;
    MC[0,3] := 1;
    for a := 0 to 100 do
    begin
      MC[0,1] := a;
      MultiplicarMatrizes(MC, MH, MResultado);
      Image1.Canvas.Pixels[canvasCenterX + Round(MResultado[0,0]), canvasCenterY - Round(MResultado[0,1])] := clred;
    end;

    //Parte vertical (100,0,0)-(100,100,0)
    MC[0,0] := 100;
    MC[0,1] := 0;
    MC[0,2] := 0;
    MC[0,3] := 1;
    for a := 0 to 100 do
    begin
      MC[0,1] := a;
      MultiplicarMatrizes(MC, MH, MResultado);
      Image1.Canvas.Pixels[canvasCenterX + Round(MResultado[0,0]), canvasCenterY - Round(MResultado[0,1])] := clred;
    end;

    //Parte vertical (100,0,100)-(100,100,100)
    MC[0,0] := 100;
    MC[0,1] := 0;
    MC[0,2] := 100;
    MC[0,3] := 1;
    for a := 0 to 100 do
    begin
      MC[0,1] := a;
      MultiplicarMatrizes(MC, MH, MResultado);
      Image1.Canvas.Pixels[canvasCenterX + Round(MResultado[0,0]), canvasCenterY - Round(MResultado[0,1])] := clred;
    end;

    //Parte superior (0,100,0)-(0,100,100)
    MC[0,0] := 0;
    MC[0,1] := 100;
    MC[0,2] := 0;
    MC[0,3] := 1;
    for a := 0 to 100 do
    begin
      MC[0,2] := a;
      MultiplicarMatrizes(MC, MH, MResultado);
      Image1.Canvas.Pixels[canvasCenterX + Round(MResultado[0,0]), canvasCenterY - Round(MResultado[0,1])] := clred;
    end;

    //Parte superior (100,100,0)-(100,100,100)
    MC[0,0] := 100;
    MC[0,1] := 100;
    MC[0,2] := 0;
    MC[0,3] := 1;
    for a := 0 to 100 do
    begin
      MC[0,2] := a;
      MultiplicarMatrizes(MC, MH, MResultado);
      Image1.Canvas.Pixels[canvasCenterX + Round(MResultado[0,0]), canvasCenterY - Round(MResultado[0,1])] := clred;
    end;

    //Parte superior (50,150,0)-(50,150,100)
    MC[0,0] := 50;
    MC[0,1] := 150;
    MC[0,2] := 0;
    MC[0,3] := 1;
    for a := 0 to 100 do
    begin
      MC[0,2] := a;
      MultiplicarMatrizes(MC, MH, MResultado);
      Image1.Canvas.Pixels[canvasCenterX + Round(MResultado[0,0]), canvasCenterY - Round(MResultado[0,1])] := clred;
    end;

    //Parte superior diagonal (0,100,0)-(50,150,0)
    MC[0,0] := 0;
    MC[0,1] := 100;
    MC[0,2] := 0;
    MC[0,3] := 1;
    for a := 0 to 50 do
    begin
      MC[0,0] := a;
      MC[0,1] := 100 + a;
      MultiplicarMatrizes(MC, MH, MResultado);
      Image1.Canvas.Pixels[canvasCenterX + Round(MResultado[0,0]), canvasCenterY - Round(MResultado[0,1])] := clred;
    end;

    //Parte superior diagonal (0,100,100)-(50,150,100)
    MC[0,0] := 0;
    MC[0,1] := 100;
    MC[0,2] := 100;
    MC[0,3] := 1;
    for a := 0 to 50 do
    begin
      MC[0,0] := a;
      MC[0,1] := 100 + a;
      MultiplicarMatrizes(MC, MH, MResultado);
      Image1.Canvas.Pixels[canvasCenterX + Round(MResultado[0,0]), canvasCenterY - Round(MResultado[0,1])] := clred;
    end;

    //Parte superior diagonal (50,150,0)-(100,100,0)
    MC[0,0] := 50;
    MC[0,1] := 150;
    MC[0,2] := 0;
    MC[0,3] := 1;
    for a := 0 to 50 do
    begin
      MC[0,0] := 50 + a;
      MC[0,1] := 150 - a;
      MultiplicarMatrizes(MC, MH, MResultado);
      Image1.Canvas.Pixels[canvasCenterX + Round(MResultado[0,0]), canvasCenterY - Round(MResultado[0,1])] := clred;
    end;

    //Parte superior diagonal (50,150,100)-(100,100,100)
    MC[0,0] := 50;
    MC[0,1] := 150;
    MC[0,2] := 100;
    MC[0,3] := 1;
    for a := 0 to 50 do
    begin
      MC[0,0] := 50 + a;
      MC[0,1] := 150 - a;
      MultiplicarMatrizes(MC, MH, MResultado);
      Image1.Canvas.Pixels[canvasCenterX + Round(MResultado[0,0]), canvasCenterY - Round(MResultado[0,1])] := clred;
    end;

  end;
end;

//Quando converti da imagem para desenho ficou bem pequeno, então usei uma llm para aumentar a escala
procedure TForm1.desenhoAula16();
var
  i, j, k, dx, dy: integer;
  scale: integer;
begin
  scale := 16;

  // Top horizontal line
  for i := 0 to 11 do
    for dx := 0 to scale - 1 do
      for dy := 0 to scale - 1 do
        Image1.Canvas.Pixels[i*scale + dx, 0*scale + dy] := clRed;

  // Pixel (11,1)
  for dx := 0 to scale - 1 do
    for dy := 0 to scale - 1 do
      Image1.Canvas.Pixels[11*scale + dx, 1*scale + dy] := clRed;

  // Line from (7,2) to (11,2)
  for i := 7 to 11 do
    for dx := 0 to scale - 1 do
      for dy := 0 to scale - 1 do
        Image1.Canvas.Pixels[i*scale + dx, 2*scale + dy] := clRed;

  // Single pixels
  for dx := 0 to scale - 1 do
    for dy := 0 to scale - 1 do
    begin
      Image1.Canvas.Pixels[7*scale + dx, 3*scale + dy] := clRed;
      Image1.Canvas.Pixels[8*scale + dx, 3*scale + dy] := clRed;
      Image1.Canvas.Pixels[8*scale + dx, 4*scale + dy] := clRed;
      Image1.Canvas.Pixels[9*scale + dx, 4*scale + dy] := clRed;
    end;

  // Vertical line (9,5) to (9,8)
  for i := 5 to 8 do
    for dx := 0 to scale - 1 do
      for dy := 0 to scale - 1 do
        Image1.Canvas.Pixels[9*scale + dx, i*scale + dy] := clRed;

  // Horizontal line (5,8) to (8,8)
  for i := 5 to 8 do
    for dx := 0 to scale - 1 do
      for dy := 0 to scale - 1 do
        Image1.Canvas.Pixels[i*scale + dx, 8*scale + dy] := clRed;

  // Pixels (5,7), (5,6), (6,5)
  for dx := 0 to scale - 1 do
    for dy := 0 to scale - 1 do
    begin
      Image1.Canvas.Pixels[5*scale + dx, 7*scale + dy] := clRed;
      Image1.Canvas.Pixels[5*scale + dx, 6*scale + dy] := clRed;
      Image1.Canvas.Pixels[5*scale + dx, 5*scale + dy] := clRed;
      Image1.Canvas.Pixels[6*scale + dx, 5*scale + dy] := clRed;
    end;

  // Horizontal line (4,4) to (6,4)
  for i := 4 to 6 do
    for dx := 0 to scale - 1 do
      for dy := 0 to scale - 1 do
        Image1.Canvas.Pixels[i*scale + dx, 4*scale + dy] := clRed;

  // Horizontal line (0,3) to (4,3)
  for i := 0 to 4 do
    for dx := 0 to scale - 1 do
      for dy := 0 to scale - 1 do
        Image1.Canvas.Pixels[i*scale + dx, 3*scale + dy] := clRed;

  // Vertical line (0,1) to (0,2)
  for i := 1 to 2 do
    for dx := 0 to scale - 1 do
      for dy := 0 to scale - 1 do
        Image1.Canvas.Pixels[0*scale + dx, i*scale + dy] := clRed;
end;

//Quando converti da imagem para desenho ficou bem pequeno, então usei uma llm para aumentar a escala
procedure TForm1.desenhoAula16B();
var
  i, j, k, dx, dy: integer;
  scale: integer;
begin
  scale := 16;

  // Top horizontal line
  for i := 0 to 11 do
    for dx := 0 to scale - 1 do
      for dy := 0 to scale - 1 do
        Image1.Canvas.Pixels[i*scale + dx, 0*scale + dy] := clRed;

  // Pixel (11,1)
  for dx := 0 to scale - 1 do
    for dy := 0 to scale - 1 do
      Image1.Canvas.Pixels[11*scale + dx, 1*scale + dy] := clRed;

  // Line from (7,2) to (11,2)
  for i := 7 to 11 do
    for dx := 0 to scale - 1 do
      for dy := 0 to scale - 1 do
        Image1.Canvas.Pixels[i*scale + dx, 2*scale + dy] := clRed;

  // Single pixels
  for dx := 0 to scale - 1 do
    for dy := 0 to scale - 1 do
    begin
      Image1.Canvas.Pixels[7*scale + dx, 3*scale + dy] := clRed;
      Image1.Canvas.Pixels[8*scale + dx, 4*scale + dy] := clRed;
    end;

  // Vertical line (9,5) to (9,8)
  for i := 5 to 8 do
    for dx := 0 to scale - 1 do
      for dy := 0 to scale - 1 do
        Image1.Canvas.Pixels[9*scale + dx, i*scale + dy] := clRed;

  // Horizontal line (5,8) to (8,8)
  for i := 5 to 8 do
    for dx := 0 to scale - 1 do
      for dy := 0 to scale - 1 do
        Image1.Canvas.Pixels[i*scale + dx, 8*scale + dy] := clRed;

  // Pixels (5,7), (5,6), (6,5)
  for dx := 0 to scale - 1 do
    for dy := 0 to scale - 1 do
    begin
      Image1.Canvas.Pixels[5*scale + dx, 7*scale + dy] := clRed;
      Image1.Canvas.Pixels[5*scale + dx, 6*scale + dy] := clRed;
      Image1.Canvas.Pixels[6*scale + dx, 5*scale + dy] := clRed;
    end;

  // Horizontal line (4,4) to (6,4)
  for i := 4 to 6 do
    for dx := 0 to scale - 1 do
      for dy := 0 to scale - 1 do
        Image1.Canvas.Pixels[i*scale + dx, 4*scale + dy] := clRed;

  // Horizontal line (0,3) to (4,3)
  for i := 0 to 4 do
    for dx := 0 to scale - 1 do
      for dy := 0 to scale - 1 do
        Image1.Canvas.Pixels[i*scale + dx, 3*scale + dy] := clRed;

  // Vertical line (0,1) to (0,2)
  for i := 1 to 2 do
    for dx := 0 to scale - 1 do
      for dy := 0 to scale - 1 do
        Image1.Canvas.Pixels[0*scale + dx, i*scale + dy] := clRed;
end;

procedure TForm1.SortIntArray(var Arr: array of Integer);
var
  i, j, temp: Integer;
begin
  for i := Low(Arr) to High(Arr) - 1 do
    for j := i + 1 to High(Arr) do
      if Arr[i] > Arr[j] then
      begin
        temp := Arr[i];
        Arr[i] := Arr[j];
        Arr[j] := temp;
      end;
end;

function TForm1.InverterCor(Cor: TColor): TColor;
begin
  if Cor = clBlack then
    Result := clGreen
  else if Cor = clGreen then
    Result := clBlack
  else
    Result := Cor;
end;

procedure TForm1.EdgeFill(Bitmap: TBitmap; Scale: Integer);
var
  gx, gy, x, y: Integer;
  MinGX, MaxGX, MinGY, MaxGY: Integer;
  RedPositions: array of Integer;
  rpCount, idx: Integer;
  IsHorizontal: Boolean;
  PixelColor: TColor;
begin
  //Criando Bounding-Box lógico sem escala
  MinGX := Bitmap.Width div Scale;
  MinGY := Bitmap.Height div Scale;
  MaxGX := -1;
  MaxGY := -1;

  for gy := 0 to (Bitmap.Height div Scale) - 1 do
    for gx := 0 to (Bitmap.Width div Scale) - 1 do
    begin
      if Bitmap.Canvas.Pixels[gx * Scale, gy * Scale] = clRed then
      begin
        if gx < MinGX then MinGX := gx;
        if gx > MaxGX then MaxGX := gx;
        if gy < MinGY then MinGY := gy;
        if gy > MaxGY then MaxGY := gy;
      end;
    end;

  if MaxGX = -1 then Exit;



  for gy := MinGY to MaxGY do
  begin
    rpCount := 0;
    SetLength(RedPositions, 0);

    // Contabilizando pixels vermelhos nessa linha lógica
    // OBS: Cada entrada representa a posição de um bloco lógico vermelho.
    for gx := MinGX to MaxGX do
      if Bitmap.Canvas.Pixels[gx * Scale, gy * Scale] = clRed then
      begin
        SetLength(RedPositions, rpCount + 1);
        RedPositions[rpCount] := gx;
        Inc(rpCount);
      end;

    // Precisa de pelo menos dois pixels vermelhos para formar um "par" delimitador
    if rpCount < 2 then
      Continue;


    //Verificação de linhas horizontais puras
    IsHorizontal := True;
    for idx := 1 to rpCount - 1 do
      if RedPositions[idx] <> RedPositions[idx - 1] + 1 then
      begin
        IsHorizontal := False;
        Break;
      end;

    // Verifica também se existe linha vermelha logo acima ou abaixo,
    // o que desqualifica como linha horizontal isolada.
    if IsHorizontal then
    begin
      for idx := 0 to rpCount - 1 do
      begin
        if ((gy > 0) and (Bitmap.Canvas.Pixels[RedPositions[idx] * Scale, (gy - 1) * Scale] = clRed)) or
           ((gy < (Bitmap.Height div Scale) - 1) and
            (Bitmap.Canvas.Pixels[RedPositions[idx] * Scale, (gy + 1) * Scale] = clRed)) then
        begin
          IsHorizontal := False;
          Break;
        end;
      end;
    end;

    if IsHorizontal then
      Continue;


    // Invertendo cores ENTRE pares de pixels vermelhos
    // OBS: A inversão ocorre entre pares consecutivos, tratando os pixels vermelhos
    // como limites de "dentro/fora". Sempre anda em passos de 2.
    idx := 0;
    while idx < rpCount - 1 do
    begin
      for gx := RedPositions[idx] + 1 to RedPositions[idx + 1] - 1 do
      begin
        for y := gy * Scale to (gy + 1) * Scale - 1 do
          for x := gx * Scale to (gx + 1) * Scale - 1 do
          begin
            PixelColor := Bitmap.Canvas.Pixels[x, y];
            if (PixelColor = clBlack) or (PixelColor = clGreen) then
              Bitmap.Canvas.Pixels[x, y] := InverterCor(PixelColor);
          end;
      end;
      Inc(idx, 2);
    end;

  end;

  Image1.Refresh;
end;

procedure TForm1.MenuItem12Click(Sender: TObject);
begin
  (*if OpenPictureDialog1.Execute then
  begin
    Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);

    Image1.Refresh;
  end;*)
  desenhoAula16B();
  EdgeFill(Image1.Picture.Bitmap, 16);
  Image1.Refresh;
end;

procedure TForm1.seed_fill(x, y: Integer; Cor: TColor);
begin
  if (x < 0) or (x >= Image1.Width) or
     (y < 0) or (y >= Image1.Height) then Exit;

  if (Image1.Canvas.Pixels[x, y] = clRed) or
     (Image1.Canvas.Pixels[x, y] = clGreen) then Exit;

  Image1.Canvas.Pixels[x, y] := clGreen;

  seed_fill(x + 1, y, Cor);
  seed_fill(x - 1, y, Cor);
  seed_fill(x, y + 1, Cor);
  seed_fill(x, y - 1, Cor);
end;

procedure TForm1.seed_fillN8(x, y: Integer; Cor: TColor);
begin
  if (x < 0) or (x >= 192) or
     (y < 0) or (y >= 144) then Exit;

  if (Image1.Canvas.Pixels[x, y] = clRed) or
     (Image1.Canvas.Pixels[x, y] = clGreen) then Exit;

  Image1.Canvas.Pixels[x, y] := clGreen;

  seed_fillN8(x + 1, y, Cor);
  seed_fillN8(x - 1, y, Cor);
  seed_fillN8(x, y + 1, Cor);
  seed_fillN8(x, y - 1, Cor);
  seed_fillN8(x + 1, y + 1, Cor);
  seed_fillN8(x + 1, y - 1, Cor);
  seed_fillN8(x - 1, y + 1, Cor);
  seed_fillN8(x - 1, y - 1, Cor);
end;

procedure TForm1.MenuItem13Click(Sender: TObject);
begin
  (*
  if OpenPictureDialog1.Execute then
  begin
    Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);

    Image1.Refresh;
  end;*)
  desenhoAula16();

  op := 9;
end;

procedure TForm1.MenuItem14Click(Sender: TObject);
begin
  (*
  if OpenPictureDialog1.Execute then
  begin
    Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);

    Image1.Refresh;
  end;*)
  desenhoAula16();

  op := 10;
end;

procedure TForm1.MenuItem15Click(Sender: TObject);
begin
  desenhoAula16();
end;

procedure TForm1.MenuItem16Click(Sender: TObject);
begin
  op:=11;
end;

procedure TForm1.MenuItem16MeasureItem(Sender: TObject; ACanvas: TCanvas;
  var AWidth, AHeight: Integer);
begin

end;

procedure TForm1.MenuItem3Click(Sender: TObject);
begin
  op := 1; //desenhar pixels na imagem
  flagOpcao8 := False;
end;

procedure TForm1.MenuItem4Click(Sender: TObject);
begin
  op:= 2;
  flagOpcao8 := False;
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
  flagOpcao8 := False;
end;

procedure TForm1.MenuItem7Click(Sender: TObject);
begin
  op:=4;
  flagOpcao8 := False;
end;

procedure TForm1.MenuItem8Click(Sender: TObject);
begin
  op:=5;
  flagOpcao8 := False;
end;

procedure TForm1.MenuItem9Click(Sender: TObject);
begin
  op:=6;
  flagOpcao8 := False;
end;

procedure TForm1.RadioButton1Change(Sender: TObject);
begin

end;

procedure TForm1.RadioButton2Change(Sender: TObject);
begin

end;


end.

