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
    Edit3: TEdit;
    Edit4: TEdit;
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
    procedure MenuItem1Click(Sender: TObject);
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
    procedure InverterCor(var Cor: TColor);
    procedure EdgeFill(Bitmap: TBitmap);
    procedure seed_fill(x, y: Integer; Cor: TColor);
    procedure seed_fillN8(x, y: Integer; Cor: TColor);
    procedure SortIntArray(var Arr: array of Integer);
    procedure desenhoAula16();
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
  flagOpcao8 : boolean;
  xSeed, ySeed: integer;

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

  if (op = 8) then
  begin
     xSeed := X;
     ySeed := Y;
  end;
end;

procedure TForm1.Image1Click(Sender: TObject);
begin
end;

procedure TForm1.FormCreate(Sender: TObject);
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
  cor : TColor;


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
  end

  else if(op = 8) then
  begin
      Cor := Image1.Canvas.Pixels[X, Y];

      if (Cor <> clGreen) and (Cor <> clRed) then
        seed_fill(X, Y, Cor);
      Image1.Refresh;
  end

  else if(op = 9) then
  begin
      Cor := Image1.Canvas.Pixels[X, Y];

      if (Cor <> clGreen) and (Cor <> clRed) then
        seed_fillN8(X, Y, Cor);
      Image1.Refresh;
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

procedure TForm1.InverterCor(var Cor: TColor);
begin
  if Color = clWhite then
    Color := clBlack
  else
    Color := clWhite;
end;

//Quando converti da imagem para desenho ficou bem pequeno, então usei uma llm para aumentar a escala
procedure TForm1.desenhoAula16();
var
  i, j, k, dx, dy: integer;
  scale: integer;
begin
  scale := 4; // quadruple the size

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

procedure TForm1.EdgeFill(Bitmap: TBitmap);
var
  x, y: Integer;
  MinX, MaxX, MinY, MaxY: Integer;
  Intersections: array of Integer;
  i, Count: Integer;
  CurrentColor: TColor;
begin
  // === 1. Find bounding box ===
  MinX := Bitmap.Width;
  MinY := Bitmap.Height;
  MaxX := 0;
  MaxY := 0;

  for y := 0 to Bitmap.Height - 1 do
    for x := 0 to Bitmap.Width - 1 do
      if Bitmap.Canvas.Pixels[x, y] = clBlack then
      begin
        if x < MinX then MinX := x;
        if x > MaxX then MaxX := x;
        if y < MinY then MinY := y;
        if y > MaxY then MaxY := y;
      end;

   // === 2. Draw bounding box on the bitmap ===
  Bitmap.Canvas.Pen.Color := clRed;      // Bounding box color
  Bitmap.Canvas.Pen.Width := 1;          // Line thickness
  Bitmap.Canvas.Brush.Style := bsClear;  // Don't fill rectangle

  Bitmap.Canvas.Rectangle(MinX, MinY, MaxX, MaxY);

  // Optional: refresh Image1 if using a TImage
  Image1.Refresh;


end;


procedure TForm1.MenuItem12Click(Sender: TObject);
begin
  if OpenPictureDialog1.Execute then
  begin
    Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);

    Image1.Refresh;
  end;
  EdgeFill(Image1.Picture.Bitmap);
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
  if (x < 0) or (x >= 48) or
     (y < 0) or (y >= 36) then Exit;

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

  op := 8;
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

  op := 9;
end;

procedure TForm1.MenuItem15Click(Sender: TObject);
begin
  desenhoAula16();
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

