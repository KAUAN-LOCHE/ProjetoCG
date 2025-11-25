unit desenho;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Menus,
  StdCtrls, ExtDlgs, Math;

type
  TMatriz = array of array of Double;

  TVector3D = record
    x, y, z: Double;
  end;
type
  // NOVO: Um vetor para cores (R, G, B)
  TCorVector = TVector3D;

  // NOVO: Constantes de material para iluminação
  TMaterial = record
    Ka: TCorVector; // Constante Ambiente
    Kd: TCorVector; // Constante Difusa
    Ks: TCorVector; // Constante Especular
    n: Double;       // Expoente Especular
  end;


type



  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit3: TEdit;
    Edit4: TEdit;
    Label3: TLabel;
    MenuItem25: TMenuItem;
    MenuItem22: TMenuItem;
    MenuItem20: TMenuItem;
    MenuItem21: TMenuItem;
    MenuItem23: TMenuItem;
    rampa: TCheckBox;
    objetos: TCheckBox;
    Button2: TButton;
    MenuItem18: TMenuItem;
    RotacionarCasinha: TCheckBox;
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
    MenuItem16: TMenuItem;
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
    procedure Button3Click(Sender: TObject);
    procedure MenuItem22Click(Sender: TObject);
    procedure MenuItem23Click(Sender: TObject);
    procedure MenuItem25Click(Sender: TObject);
    procedure objetosChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure MenuItem18Click(Sender: TObject);
    procedure MenuItem21Click(Sender: TObject);
    procedure RotacionarCasinhaChange(Sender: TObject);
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
    procedure MenuItem11Click(Sender: TObject);
    procedure MenuItem12Click(Sender: TObject);
    procedure MenuItem13Click(Sender: TObject);
    procedure MenuItem14Click(Sender: TObject);
    procedure MenuItem20Click(Sender: TObject);
    procedure MenuItem16Click(Sender: TObject);
    procedure MenuItem16MeasureItem(Sender: TObject; ACanvas: TCanvas;
      var AWidth, AHeight: Integer);
    procedure MenuItem17Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure DesenharSuperficieBilinear(P00, P01, P10, P11: TVector3D;
      Cor: TColor; const MTransform: TMatriz);
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
    procedure DesenharLinhaManual(x1, y1, x2, y2: Integer; Cor: TColor);
    procedure desenhoAula16B();
    procedure desenharPratica1(const MStatic, MRampa: TMatriz);
    function InverterCor(Cor: TColor): TColor;
    procedure MultiplicarMatrizes4x4(const Matriz1, Matriz2: TMatriz; var MResultado: TMatriz);
    procedure desenharZBufferObjetos(const MTransform: TMatriz);
    procedure desenharPratica1(const MTransform: TMatriz);
    function RotacionarPonto(P: TPoint; EixoX, CanvasCenterY: Integer; Angulo: Double): TVector3D;
    // NOVAS Funções de Vetores 3D
    function Vetor(P1, P2: TVector3D): TVector3D;
    function Subtrair(V1, V2: TVector3D): TVector3D;
    function Adicionar(V1, V2: TVector3D): TVector3D;
    function MultiplicarEscalar(V: TVector3D; s: Double): TVector3D;
    function MultiplicarComponente(V1, V2: TCorVector): TCorVector;
    function Magnitude(V: TVector3D): Double;
    function Normalizar(V: TVector3D): TVector3D;
    function ProdutoEscalar(V1, V2: TVector3D): Double;
    function CalcularCor(Intensidade: TCorVector): TColor;
    procedure LimparZBuffer;

    // NOVAS Funções de Iluminação (Trabalho Prático)
    procedure DesenharCenaIluminada(Modelo: Integer);
  private
    ZBuffer: TMatriz;
    EixoVarreduraX: Integer;

  public

  end;




var
  Form1: TForm1;
  op : integer;
  desenhar : boolean;
  x1,xa, ya, xb, contadorVarredura,yb, x2,y2:integer;
  y1:integer;
  contador, contador2:integer;
  flagOpcao8 : boolean;
  xSeed, ySeed: integer;
  PerfilUsuario: array of TPoint;
  ContadorPerfil: Integer;

implementation


{$R *.lfm}

{ TForm1 }
procedure TForm1.FormCreate(Sender: TObject);
begin
  op := 0;
  x1 := -1;
  y1 := -1;
  ContadorPerfil := 0;
  SetLength(PerfilUsuario,0);
  SetLength(ZBuffer, Image1.Height, Image1.Width);

end;


procedure TForm1.MenuItem1Click(Sender: TObject);
begin

end;
function MakeColor(r, g, b: Double): TCorVector;
begin
  Result.x := r;
  Result.y := g;
  Result.z := b;
end;


procedure TForm1.MenuItem2Click(Sender: TObject);
begin
end;
procedure TForm1.desenharPratica1(const MStatic, MRampa: TMatriz);
var
  x_idx, y_idx: Integer;

  function P(x, y, z: Double): TVector3D;
  begin
    Result.x := x;
    Result.y := y;
    Result.z := z;
  end;

begin
  SetLength(ZBuffer, Image1.Height, Image1.Width);
  for y_idx := 0 to Image1.Height - 1 do
    for x_idx := 0 to Image1.Width - 1 do
      ZBuffer[y_idx, x_idx] := Math.Infinity;

  // --- OBJETO 1: Tampa esquerda (Verde)
  DesenharSuperficieBilinear(
    P(0,40,80), P(20,40,80),
    P(0,0,80),  P(20,0,80),
    clGreen, MStatic);

  // --- OBJETO 2: Frente/Fundo da caixa (Verde)
  DesenharSuperficieBilinear(
    P(0,0,80),  P(20,0,80),
    P(0,0,0),   P(20,0,0),
    clGreen, MStatic);

  // --- OBJETO 6: Chão direito (Marrom)
  DesenharSuperficieBilinear(
    P(100,40,0),  P(120,40,0),
    P(100,0,0),   P(120,0,0),
    clMaroon, MStatic);

  // --- OBJETO 3: Lateral da rampa (Amarelo)
  DesenharSuperficieBilinear(
    P(20,0,80),  P(20,40,80),
    P(20,0,0),   P(20,40,0),
    clYellow, MRampa);

  // --- OBJETO 4: Rampa inclinada (Azul)
  DesenharSuperficieBilinear(
    P(20,0,80),  P(20,40,80),
    P(100,0,0),  P(100,40,0),
    clBlue, MRampa);

  // --- OBJETO 5: Base da rampa (Vermelho)
  DesenharSuperficieBilinear(
    P(20,40,0),  P(100,40,0),
    P(20,0,0),   P(100,0,0),
    clRed, MRampa);

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

  // MODIFICADO: Lógica para op = 13 (Desenho livre de Varredura)
  if (op = 13) then
  begin
    desenhar := true;
    // Limpa o perfil anterior e começa um novo
    SetLength(PerfilUsuario, 1);
    PerfilUsuario[0] := Point(X, Y);
    ContadorPerfil := 1;

    // Desenha o primeiro pixel
    if (X >= 0) and (X < Image1.Width) and (Y >= 0) and (Y < Image1.Height) then
      Image1.Canvas.Pixels[X, Y] := clRed;
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
procedure TForm1.MultiplicarMatrizes4x4(const Matriz1, Matriz2: TMatriz; var MResultado: TMatriz);
var
  i, j, k: Integer;
begin
  // Garante que as matrizes tenham o tamanho 4x4
  if (Length(Matriz1) <> 4) or (Length(Matriz2) <> 4) or
     (Length(MResultado) <> 4) or (Length(Matriz1[0]) <> 4) or
     (Length(Matriz2[0]) <> 4) or (Length(MResultado[0]) <> 4) then
  begin
    // Idealmente, trataria este erro.
    Exit;
  end;

  for i := 0 to 3 do
  begin
    for j := 0 to 3 do
    begin
      MResultado[i, j] := 0;
      for k := 0 to 3 do
      begin
        MResultado[i, j] := MResultado[i, j] + Matriz1[i, k] * Matriz2[k, j];
      end;
    end;
  end;
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
  a, b, cx, cy, cz : Integer;
  MTransform, MHO, MHTPos, MHTNeg, MTemp, MIdentidade : TMatriz; // Adicionado MIdentidade
  aa, bb, cc, dd, ee, ff, gg, hh, ii, jj, kk, ll, mm, nn, oo, pp : Double;
  MC_Casinha : TMatriz;
  canvasCenterX, canvasCenterY : Integer;
begin
  // 1. INICIALIZAR MATRIZES
  SetLength(MTransform, 4, 4);
  SetLength(MHO, 4, 4);
  SetLength(MHTPos, 4, 4);
  SetLength(MHTNeg, 4, 4);
  SetLength(MTemp, 4, 4);
  SetLength(MIdentidade, 4, 4); // Inicializa matriz para objetos estáticos

  // Inicializa MTransform e MIdentidade com a Matriz Identidade
  for a := 0 to 3 do
  begin
    for b := 0 to 3 do
    begin
      MTransform[a,b] := 0.0;
      MIdentidade[a,b] := 0.0;
    end;
    MTransform[a,a] := 1.0;  // Diagonal principal = 1
    MIdentidade[a,a] := 1.0; // Diagonal principal = 1
  end;

  // 2. CONSTRUIR MATRIZ DE TRANSFORMAÇÃO
  if RadioButton1.Checked then
  begin
    aa := StrToFloat(Edit5.Text);
    bb := StrToFloat(Edit6.Text);
    cc := StrToFloat(Edit7.Text);
    MTransform[0,0] := 1 * aa;
    MTransform[1,1] := 1 * bb;
    MTransform[2,2] := 1 * cc;
  end
  else if RadioButton2.Checked then
  begin
    aa := StrToFloat(Edit8.Text);
    MTransform[0,0] := 1 / aa;
    MTransform[1,1] := 1 / aa;
    MTransform[2,2] := 1 / aa;
  end
  else if RadioButton3.Checked then
  begin
    aa := StrToFloat(Edit9.Text);
    bb := StrToFloat(Edit10.Text);
    cc := StrToFloat(Edit11.Text);
    MTransform[3,0] := aa;
    MTransform[3,1] := bb;
    MTransform[3,2] := cc;
  end
  else if RadioButton4.Checked then
  begin
    aa := StrToFloat(Edit13.Text) * Pi / 180;
    if (Edit12.Text = 'X') or (Edit12.Text = 'x') then
    begin
      MTransform[1,1] := cos(aa); MTransform[1,2] := sin(aa);
      MTransform[2,1] := -sin(aa); MTransform[2,2] := cos(aa);
    end
    else if (Edit12.Text = 'Y') or (Edit12.Text = 'y') then
    begin
      MTransform[0,0] := cos(aa); MTransform[0,2] := -sin(aa);
      MTransform[2,0] := sin(aa); MTransform[2,2] := cos(aa);
    end
    else if (Edit12.Text = 'Z') or (Edit12.Text = 'z') then
    begin
      MTransform[0,0] := cos(aa); MTransform[0,1] := sin(aa);
      MTransform[1,0] := -sin(aa); MTransform[1,1] := cos(aa);
    end;
  end
  else if RadioButton5.Checked then
  begin
    // Determina o centro baseado no que está sendo rotacionado
    if RotacionarCasinha.Checked then
    begin
      cx := 50; cy := 70; cz := 50;
    end
    else if objetos.Checked then
    begin
      cx := 60; cy := 20; cz := 40; // Centro aproximado dos objetos da prática 1
    end
    else if (op = 25) then // Se for a Prática da Rampa
    begin
      // Define um ponto de pivô lógico para a rampa (ex: a aresta superior onde ela conecta)
      cx := 20; cy := 0; cz := 80;
    end
    else
    begin
      cx := 0; cy := 0; cz := 0; // Centro na origem para outros casos
    end;

    aa := StrToFloat(Edit13.Text) * Pi / 180;

    for a := 0 to 3 do for b := 0 to 3 do MHO[a,b] := 0.0;
    MHO[0,0] := 1.0; MHO[1,1] := 1.0; MHO[2,2] := 1.0; MHO[3,3] := 1.0;
    for a := 0 to 3 do for b := 0 to 3 do MHTPos[a,b] := 0.0;
    MHTPos[0,0] := 1.0; MHTPos[1,1] := 1.0; MHTPos[2,2] := 1.0; MHTPos[3,3] := 1.0;
    for a := 0 to 3 do for b := 0 to 3 do MHTNeg[a,b] := 0.0;
    MHTNeg[0,0] := 1.0; MHTNeg[1,1] := 1.0; MHTNeg[2,2] := 1.0; MHTNeg[3,3] := 1.0;

    if (Edit12.Text = 'X') or (Edit12.Text = 'x') then
    begin
      MHO[1,1] := cos(aa); MHO[1,2] := sin(aa);
      MHO[2,1] := -sin(aa); MHO[2,2] := cos(aa);
    end
    else if (Edit12.Text = 'Y') or (Edit12.Text = 'y') then
    begin
      MHO[0,0] := cos(aa); MHO[0,2] := -sin(aa);
      MHO[2,0] := sin(aa); MHO[2,2] := cos(aa);
    end
    else if (Edit12.Text = 'Z') or (Edit12.Text = 'z') then
    begin
      MHO[0,0] := cos(aa); MHO[0,1] := sin(aa);
      MHO[1,0] := -sin(aa); MHO[1,1] := cos(aa);
    end;

    MHTPos[3,0] := cx; MHTPos[3,1] := cy; MHTPos[3,2] := cz;
    MHTNeg[3,0] := -cx; MHTNeg[3,1] := -cy; MHTNeg[3,2] := -cz;

    MultiplicarMatrizes4x4(MHTNeg, MHO, MTemp);
    MultiplicarMatrizes4x4(MTemp, MHTPos, MTransform);
  end
  else if RadioButton6.Checked then
  begin
    aa := StrToFloat(Edit14.Text); bb := StrToFloat(Edit15.Text);
    cc := StrToFloat(Edit16.Text); dd := StrToFloat(Edit17.Text);
    ee := StrToFloat(Edit18.Text); ff := StrToFloat(Edit19.Text);
    gg := StrToFloat(Edit20.Text); hh := StrToFloat(Edit21.Text);
    ii := StrToFloat(Edit22.Text); jj := StrToFloat(Edit23.Text);
    kk := StrToFloat(Edit24.Text); ll := StrToFloat(Edit25.Text);
    mm := StrToFloat(Edit26.Text); nn := StrToFloat(Edit27.Text);
    oo := StrToFloat(Edit28.Text); pp := StrToFloat(Edit29.Text);

    MTransform[0,0] := 1 * aa; MTransform[0,1] := 1 * bb; MTransform[0,2] := 1 * cc; MTransform[0,3] := 1 * dd;
    MTransform[1,0] := 1 * ee; MTransform[1,1] := 1 * ff; MTransform[1,2] := 1 * gg; MTransform[1,3] := 1 * hh;
    MTransform[2,0] := 1 * ii; MTransform[2,1] := 1 * jj; MTransform[2,2] := 1 * kk; MTransform[2,3] := 1 * ll;
    MTransform[3,0] := 1 * mm; MTransform[3,1] := 1 * nn; MTransform[3,2] := 1 * oo; MTransform[3,3] := 1 / pp;
  end;

  // 3. LIMPAR TELA
 Image1.Canvas.Brush.Color := clBlack;
  Image1.Canvas.FillRect(0, 0, Image1.Width, Image1.Height);

  // 4. DECIDIR O QUE DESENHAR
  if RotacionarCasinha.Checked then
  begin
    canvasCenterX := Image1.Width div 2;
    canvasCenterY := Image1.Height div 2;
    SetLength(MC_Casinha, 1, 4);
    MTransform[0,2] := 0; MTransform[1,2] := 0; MTransform[2,2] := 0;
    ProjecaoOrtografica(MC_Casinha, MTransform, canvasCenterX, canvasCenterY);
    SetLength(MC_Casinha, 0, 0);
  end
  else if (op = 25) then // Prática 1 (MenuItem25)
  begin
    if rampa.Checked then
      // Apenas a rampa se move (MTransform), o resto fica estático (MIdentidade)
      desenharPratica1(MIdentidade, MTransform)
    else
      // Tudo se move junto
      desenharPratica1(MTransform, MTransform);
  end
  else if (RotacionarCasinha.Checked = false) and (op <> 13) then
  begin
    desenharZBufferObjetos(MTransform);
  end;

  // 5. LIMPEZA
  SetLength(MTransform, 0, 0); SetLength(MIdentidade, 0, 0);
  SetLength(MHO, 0, 0); SetLength(MHTPos, 0, 0);
  SetLength(MHTNeg, 0, 0); SetLength(MTemp, 0, 0);
end;
procedure TForm1.Button2Click(Sender: TObject);
var
  i, k, StepSimplificacao, ContagemSimplificada: Integer;
  Angulo, AnguloStep: Double;
  P00, P01, P10, P11, P_Eixo_1: TVector3D; // ADICIONADO P_Eixo_1
  P1, P2: TPoint;
  MTransform: TMatriz;
  a, b, x_idx, y_idx, ImgWidth, ImgHeight, canvasCenterY, y_eixo: Integer; // ADICIONADO y_eixo
  PerfilSimplificado: array of TPoint; // ADICIONADO
  // Variáveis para copiar a lógica de transformação do Button1
  cx, cy, cz : Integer;
  MHO, MHTPos, MHTNeg, MTemp : TMatriz;
  aa, bb, cc, dd, ee, ff, gg, hh, ii, jj, kk, ll, mm, nn, oo, pp : Double;
begin
  RadioButton1.Checked := False;
  RadioButton2.Checked := False;
  RadioButton3.Checked := False;
  RadioButton4.Checked := False;
  RadioButton5.Checked := False;
  RadioButton6.Checked := False;
  // Só executa se estivermos no modo Varredura (op=13) e tivermos um perfil válido
  if (op <> 13) or (ContadorPerfil < 2) then Exit;

  // 1. INICIALIZAR TELA E Z-BUFFER
  ImgWidth := Image1.Width;
  ImgHeight := Image1.Height;
  canvasCenterY := ImgHeight div 2;

  Image1.Canvas.Brush.Color := clBlack;
  Image1.Canvas.FillRect(0, 0, ImgWidth, ImgHeight);

  SetLength(ZBuffer, ImgHeight, ImgWidth);
  for y_idx := 0 to ImgHeight - 1 do
    for x_idx := 0 to ImgWidth - 1 do
      ZBuffer[y_idx, x_idx] := Math.Infinity;

  // 2. CONSTRUIR MATRIZ DE TRANSFORMAÇÃO (Copiado do Button1Click)
  SetLength(MTransform, 4, 4);
  SetLength(MHO, 4, 4);
  SetLength(MHTPos, 4, 4);
  SetLength(MHTNeg, 4, 4);
  SetLength(MTemp, 4, 4);

  for a := 0 to 3 do for b := 0 to 3 do MTransform[a,b] := 0.0;
  MTransform[0,0] := 1.0;
  MTransform[1,1] := 1.0;
  MTransform[2,2] := 1.0;
  MTransform[3,3] := 1.0;

  // ... (O código de construção da MTransform de RadioButton1 a RadioButton6
  // permanece exatamente o mesmo, copiado do seu Button1Click)
  if RadioButton1.Checked then
  begin
    aa := StrToFloat(Edit5.Text);
    bb := StrToFloat(Edit6.Text);
    cc := StrToFloat(Edit7.Text);
    MTransform[0,0] := 1 * aa;
    MTransform[1,1] := 1 * bb;
    MTransform[2,2] := 1 * cc;
  end
  else if RadioButton2.Checked then
  begin
    aa := StrToFloat(Edit8.Text);
    MTransform[0,0] := 1 / aa;
    MTransform[1,1] := 1 / aa;
    MTransform[2,2] := 1 / aa;
  end
  else if RadioButton3.Checked then
  begin
    aa := StrToFloat(Edit9.Text);
    bb := StrToFloat(Edit10.Text);
    cc := StrToFloat(Edit11.Text);
    MTransform[3,0] := aa;
    MTransform[3,1] := bb;
    MTransform[3,2] := cc;
  end
  else if RadioButton4.Checked then
  begin
    aa := StrToFloat(Edit13.Text) * Pi / 180;
    if (Edit12.Text = 'X') or (Edit12.Text = 'x') then
    begin
      MTransform[1,1] := cos(aa); MTransform[1,2] := sin(aa);
      MTransform[2,1] := -sin(aa); MTransform[2,2] := cos(aa);
    end
    else if (Edit12.Text = 'Y') or (Edit12.Text = 'y') then
    begin
      MTransform[0,0] := cos(aa); MTransform[0,2] := -sin(aa);
      MTransform[2,0] := sin(aa); MTransform[2,2] := cos(aa);
    end
    else if (Edit12.Text = 'Z') or (Edit12.Text = 'z') then
    begin
      MTransform[0,0] := cos(aa); MTransform[0,1] := sin(aa);
      MTransform[1,0] := -sin(aa); MTransform[1,1] := cos(aa);
    end;
  end
  else if RadioButton5.Checked then
  begin
    cx := 0; cy := 0; cz := 0;
    aa := StrToFloat(Edit13.Text) * Pi / 180;
    for a := 0 to 3 do for b := 0 to 3 do MHO[a,b] := 0.0;
    MHO[0,0] := 1.0; MHO[1,1] := 1.0; MHO[2,2] := 1.0; MHO[3,3] := 1.0;
    for a := 0 to 3 do for b := 0 to 3 do MHTPos[a,b] := 0.0;
    MHTPos[0,0] := 1.0; MHTPos[1,1] := 1.0; MHTPos[2,2] := 1.0; MHTPos[3,3] := 1.0;
    for a := 0 to 3 do for b := 0 to 3 do MHTNeg[a,b] := 0.0;
    MHTNeg[0,0] := 1.0; MHTNeg[1,1] := 1.0; MHTNeg[2,2] := 1.0; MHTNeg[3,3] := 1.0;

    if (Edit12.Text = 'X') or (Edit12.Text = 'x') then
    begin
      MHO[1,1] := cos(aa); MHO[1,2] := sin(aa);
      MHO[2,1] := -sin(aa); MHO[2,2] := cos(aa);
    end
    else if (Edit12.Text = 'Y') or (Edit12.Text = 'y') then
    begin
      MHO[0,0] := cos(aa); MHO[0,2] := -sin(aa);
      MHO[2,0] := sin(aa); MHO[2,2] := cos(aa);
    end
    else if (Edit12.Text = 'Z') or (Edit12.Text = 'z') then
    begin
      MHO[0,0] := cos(aa); MHO[0,1] := sin(aa);
      MHO[1,0] := -sin(aa); MHO[1,1] := cos(aa);
    end;
    MHTPos[3,0] := cx; MHTPos[3,1] := cy; MHTPos[3,2] := cz;
    MHTNeg[3,0] := -cx; MHTNeg[3,1] := -cy; MHTNeg[3,2] := -cz;
    MultiplicarMatrizes4x4(MHTNeg, MHO, MTemp);
    MultiplicarMatrizes4x4(MTemp, MHTPos, MTransform);
  end
  else if RadioButton6.Checked then
  begin
    aa := StrToFloat(Edit14.Text); bb := StrToFloat(Edit15.Text);
    cc := StrToFloat(Edit16.Text); dd := StrToFloat(Edit17.Text);
    ee := StrToFloat(Edit18.Text); ff := StrToFloat(Edit19.Text);
    gg := StrToFloat(Edit20.Text); hh := StrToFloat(Edit21.Text);
    ii := StrToFloat(Edit22.Text); jj := StrToFloat(Edit23.Text);
    kk := StrToFloat(Edit24.Text); ll := StrToFloat(Edit25.Text);

    mm := StrToFloat(Edit26.Text); nn := StrToFloat(Edit27.Text);
    oo := StrToFloat(Edit28.Text); pp := StrToFloat(Edit29.Text);
    MTransform[0,0] := 1 * aa; MTransform[0,1] := 1 * bb; MTransform[0,2] := 1 * cc; MTransform[0,3] := 1 * dd;
    MTransform[1,0] := 1 * ee; MTransform[1,1] := 1 * ff; MTransform[1,2] := 1 * gg; MTransform[1,3] := 1 * hh;
    MTransform[2,0] := 1 * ii; MTransform[2,1] := 1 * jj; MTransform[2,2] := 1 * kk; MTransform[2,3] := 1 * ll;
    MTransform[3,0] := 1 * mm; MTransform[3,1] := 1 * nn; MTransform[3,2] := 1 * oo; MTransform[3,3] := 1 / pp;
  end;
  // FIM DA CÓPIA DO Button1Click

  // 3. NOVO: SIMPLIFICAR O PERFIL (Resampling)
  StepSimplificacao := 30; // Pega 1 ponto a cada 30 pixels
  if StepSimplificacao = 0 then StepSimplificacao := 1;
  if ContadorPerfil < StepSimplificacao then StepSimplificacao := 1;

  SetLength(PerfilSimplificado, 0);
  k := 0; // Índice do perfil simplificado
  i := 0; // Índice do perfil original

  while i < ContadorPerfil do
  begin
    SetLength(PerfilSimplificado, k + 1);
    PerfilSimplificado[k] := PerfilUsuario[i];
    Inc(k);
    Inc(i, StepSimplificacao);
  end;

  if (k = 0) or ((i - StepSimplificacao) <> (ContadorPerfil - 1)) then
  begin
    SetLength(PerfilSimplificado, k + 1);
    PerfilSimplificado[k] := PerfilUsuario[ContadorPerfil - 1];
    Inc(k);
  end;

  ContagemSimplificada := k;
  if ContagemSimplificada < 2 then Exit;

  // 4. GERAR SUPERFÍCIES DE VARREDURA
  AnguloStep := 15 * Pi / 180; // Gira 15 graus por passo
  Angulo := 0;

  while Angulo < (2 * Pi) do
  begin
    // Itera sobre o PERFIL SIMPLIFICADO
    for i := 0 to ContagemSimplificada - 2 do
    begin
      P1 := PerfilSimplificado[i];
      P2 := PerfilSimplificado[i+1];

      // Calcula os 4 pontos da "pele"
      P00 := RotacionarPonto(P1, EixoVarreduraX, canvasCenterY, Angulo);
      P01 := RotacionarPonto(P1, EixoVarreduraX, canvasCenterY, Angulo + AnguloStep);
      P10 := RotacionarPonto(P2, EixoVarreduraX, canvasCenterY, Angulo);
      P11 := RotacionarPonto(P2, EixoVarreduraX, canvasCenterY, Angulo + AnguloStep);

      // Desenha a "pele"
      DesenharSuperficieBilinear(P00, P01, P10, P11, clYellow, MTransform);
    end;

    // MODIFICAÇÃO: Desenha os "anéis" horizontais para cada ponto
    for i := 0 to ContagemSimplificada - 1 do
    begin
      P1 := PerfilSimplificado[i];

      // Ponto P1 no ângulo atual
      P00 := RotacionarPonto(P1, EixoVarreduraX, canvasCenterY, Angulo);
      // Ponto P1 no próximo ângulo
      P01 := RotacionarPonto(P1, EixoVarreduraX, canvasCenterY, Angulo + AnguloStep);
      // Ponto no eixo na altura de P1
      P_Eixo_1.x := 0; P_Eixo_1.y := P00.y; P_Eixo_1.z := 0;

      // Desenha a "fatia de pizza" (um triângulo degenerado)
      // (Ponto, Ponto+Angulo, Eixo, Eixo)
      DesenharSuperficieBilinear(P00, P01, P_Eixo_1, P_Eixo_1, clGray, MTransform);
    end;

    Angulo := Angulo + AnguloStep;
  end;

  // 5. LIMPAR MATRIZES
  SetLength(MTransform, 0, 0);
  SetLength(MHO, 0, 0);
  SetLength(MHTPos, 0, 0);
  SetLength(MHTNeg, 0, 0);
  SetLength(MTemp, 0, 0);
  SetLength(PerfilSimplificado, 0); // Limpa o perfil simplificado

  // 6. REDESENHAR O EIXO E O PERFIL (MODIFICADO para "na mão")
  // Redesenha o Eixo (pixel por pixel, "na mão")
  for y_eixo := 0 to Image1.Height - 1 do
  begin
    // Desenha pontilhado (alternando a cor a cada 5 pixels)
    if (y_eixo div 5) mod 2 = 0 then
    begin
      if (EixoVarreduraX >= 0) and (EixoVarreduraX < Image1.Width) then
        Image1.Canvas.Pixels[EixoVarreduraX, y_eixo] := clGray;
    end;
  end;

  // Redesenha o PERFIL ORIGINAL usando a linha manual
  if ContadorPerfil > 1 then
  begin
    for i := 0 to ContadorPerfil - 2 do
    begin
      // Conecta cada pixel consecutivo do perfil original
      DesenharLinhaManual(
        PerfilUsuario[i].X, PerfilUsuario[i].Y,
        PerfilUsuario[i+1].X, PerfilUsuario[i+1].Y,
        clRed
      );
    end;
  end;

  // Habilita os botões de transformação para o objeto gerado
  flagOpcao8 := True;
end;
  procedure TForm1.DesenharLinhaManual(x1, y1, x2, y2: Integer; Cor: TColor);
  var
    m: Double;
    xi, yi, x_ini, x_fim, y_ini, y_fim: Integer;
  begin
    // Trata caso de ponto único
    if (x1 = x2) and (y1 = y2) then
    begin
      if (x1 >= 0) and (x1 < Image1.Width) and (y1 >= 0) and (y1 < Image1.Height) then
        Image1.Canvas.Pixels[x1, y1] := Cor;
      Exit;
    end;

    // Decide se a linha é mais horizontal ou vertical (eixo dominante)
    if (Abs(x2 - x1) >= Abs(y2 - y1)) then // Mais horizontal (ou 45 graus)
    begin
      // Garante que a iteração seja da esquerda para a direita (x_ini < x_fim)
      if (x1 > x2) then
      begin
        x_ini := x2; y_ini := y2;
        x_fim := x1; y_fim := y1;
      end
      else
      begin
        x_ini := x1; y_ini := y1;
        x_fim := x2; y_fim := y2;
      end;

      // Calcula a inclinação (deltaY / deltaX)
      if (x_fim - x_ini) = 0 then m := 0.0 else m := (y_fim - y_ini) / (x_fim - x_ini);

      // Itera ao longo de X (eixo dominante)
      for xi := x_ini to x_fim do
      begin
        yi := Round(y_ini + m * (xi - x_ini));
        // Desenha o pixel (com verificação de limites da tela)
        if (xi >= 0) and (xi < Image1.Width) and (yi >= 0) and (yi < Image1.Height) then
          Image1.Canvas.Pixels[xi, yi] := Cor;
      end;
    end
    else // Mais vertical
    begin
      // Garante que a iteração seja de cima para baixo (y_ini < y_fim)
      if (y1 > y2) then
      begin
        x_ini := x2; y_ini := y2;
        x_fim := x1; y_fim := y1;
      end
      else
      begin
        x_ini := x1; y_ini := y1;
        x_fim := x2; y_fim := y2;
      end;

      // Calcula a inclinação inversa (deltaX / deltaY)
      if (y_fim - y_ini) = 0 then m := 0.0 else m := (x_fim - x_ini) / (y_fim - y_ini);

      // Itera ao longo de Y (eixo dominante)
      for yi := y_ini to y_fim do
      begin
        xi := Round(x_ini + m * (yi - y_ini));
        // Desenha o pixel (com verificação de limites da tela)
        if (xi >= 0) and (xi < Image1.Width) and (yi >= 0) and (yi < Image1.Height) then
          Image1.Canvas.Pixels[xi, yi] := Cor;
      end;
    end;
  end;
function TForm1.RotacionarPonto(P: TPoint; EixoX, CanvasCenterY: Integer; Angulo: Double): TVector3D;
var
  Raio: Double;
begin
  // Raio é a distância do ponto (P.X) ao eixo de rotação (EixoX)
  // Assume que o perfil está no plano XY do mundo (X = Raio, Y = altura, Z = 0)
  Raio := P.X - EixoX;


  Result.y := CanvasCenterY - P.Y; // Y do mundo = Altura no canvas


  Result.x := Raio * cos(Angulo);
  Result.z := Raio * sin(Angulo); // Z negativo para "dentro" da tela
end;


procedure TForm1.MenuItem18Click(Sender: TObject);
begin
  // MODIFICADO: Configura para desenhar perfil de varredura
  op := 13; // Modo de desenho de Varredura
  contadorVarredura:= 1;
  flagOpcao8 := False; // Desativa transformações (Button1)
  RotacionarCasinha.Checked := False;
  objetos.Checked := False;

  // Limpa a tela
  Image1.Canvas.Brush.Color := clBlack;
  Image1.Canvas.FillRect(0, 0, Image1.Width, Image1.Height);

  // Define e desenha o eixo de rotação (Y-axis no mundo 3D)
  EixoVarreduraX := Image1.Width div 4; // Eixo à esquerda
  Image1.Canvas.Pen.Color := clGray;
  Image1.Canvas.Pen.Style := psDot;
  Image1.Canvas.MoveTo(EixoVarreduraX, 0);
  Image1.Canvas.LineTo(EixoVarreduraX, Image1.Height);
  Image1.Canvas.Pen.Style := psSolid; // Resetar estilo

  // Reseta o perfil do usuário
  SetLength(PerfilUsuario, 0);
  ContadorPerfil := 0;
end;
procedure TForm1.MenuItem21Click(Sender: TObject);
var
  MTransform: TMatriz;
  a, b: Integer;
begin
  op := 14;
  flagOpcao8 := True;

  RotacionarCasinha.Checked := False;
  objetos.Checked := True;

  RadioButton1.Checked := False;
  RadioButton2.Checked := False;
  RadioButton3.Checked := False;
  RadioButton4.Checked := False;
  RadioButton5.Checked := False;
  RadioButton6.Checked := False;

  SetLength(MTransform, 4, 4);
  for a := 0 to 3 do for b := 0 to 3 do MTransform[a,b] := 0.0;
  MTransform[0,0] := 1.0;
  MTransform[1,1] := 1.0;
  MTransform[2,2] := 1.0;
  MTransform[3,3] := 1.0;

  //desenharPratica1(MTransform);

  SetLength(MTransform, 0, 0);
end;

procedure TForm1.objetosChange(Sender: TObject);
begin
  RotacionarCasinha.Checked := False;
end;

procedure TForm1.MenuItem22Click(Sender: TObject);
begin
  // Modelo 1: I = IaKa + Il.Kd.cos(theta)
  op := 21; // Novo 'op' para Iluminação
  flagOpcao8 := False;
  RotacionarCasinha.Checked := False;
  objetos.Checked := False;
  rampa.Checked := False;

  DesenharCenaIluminada(1); // Chama o Modelo 1

end;

procedure TForm1.Button3Click(Sender: TObject);
begin

end;

procedure TForm1.MenuItem23Click(Sender: TObject);
begin
  // Modelo 2: I = IaKa + (Il/(d+K)) * (Kd.cos(theta) + Ks.cos(alpha)^n)
  op := 22; // Novo 'op' para Iluminação
  flagOpcao8 := False;
  RotacionarCasinha.Checked := False;
  objetos.Checked := False;
  rampa.Checked := False;

  DesenharCenaIluminada(2); // Chama o Modelo 2
end;
procedure TForm1.MenuItem25Click(Sender: TObject);
var
  MInicial, RotX, RotY, Temp: TMatriz;
  a, b: Integer;
  angX, angY: Double;
begin
  op := 25; // Define a operação para Prática 1
  flagOpcao8 := True; // Habilita transformações

  // Reseta os checkboxes
  RotacionarCasinha.Checked := False;
  objetos.Checked := False;
  rampa.Checked := True; // Deixa marcado para animar a rampa depois

  // Limpa a tela
  Image1.Canvas.Brush.Color := clBlack;
  Image1.Canvas.FillRect(0, 0, Image1.Width, Image1.Height);

  // Inicializa as matrizes
  SetLength(MInicial, 4, 4);
  SetLength(RotX, 4, 4);
  SetLength(RotY, 4, 4);
  SetLength(Temp, 4, 4);

  // Preenche com Identidade (Diagonal = 1)
  for a := 0 to 3 do
  begin
    for b := 0 to 3 do
    begin
      MInicial[a,b] := 0; RotX[a,b] := 0; RotY[a,b] := 0; Temp[a,b] := 0;
    end;
    MInicial[a,a] := 1; RotX[a,a] := 1; RotY[a,a] := 1; Temp[a,a] := 1;
  end;

  // --- CONFIGURAÇÃO DA VISÃO INICIAL (LATERAL) ---
  // Rotação no Eixo X (20 graus) - Para ver um pouco "de cima"
  angX := 20 * Pi / 180;
  RotX[1,1] := cos(angX); RotX[1,2] := sin(angX);
  RotX[2,1] := -sin(angX); RotX[2,2] := cos(angX);

  // Rotação no Eixo Y (-45 graus) - Para ver "de quina/lateral"
  angY := -45 * Pi / 180;
  RotY[0,0] := cos(angY); RotY[0,2] := -sin(angY);
  RotY[2,0] := sin(angY); RotY[2,2] := cos(angY);

  // Combina as rotações: MInicial = RotX * RotY
  // (Multiplica RotX por RotY e guarda em MInicial)
  MultiplicarMatrizes4x4(RotY, RotX, MInicial);

  // Desenha a cena com essa rotação inicial (tanto estático quanto rampa)
  desenharPratica1(MInicial, MInicial);

  // Limpeza de memória
  SetLength(MInicial, 0, 0);
  SetLength(RotX, 0, 0);
  SetLength(RotY, 0, 0);
  SetLength(Temp, 0, 0);
end;

function InBounds(v, minv, maxv: Integer): Boolean;
begin
  Result := (v >= minv) and (v <= maxv);
end;
   procedure TForm1.DesenharCenaIluminada(Modelo: Integer);
var
  PosObservador, PosLuz: TVector3D;
  Ia, Il, Ib: TCorVector;
  Ka, Kd, Ks: TCorVector;
  specularN, K_Atenuacao: Double;

  a, b, RaioEsfera, step: Double;
  P, N, L, S, H: TVector3D;

  px, py: Integer;
  cx, cy: Integer;
  x, y: Integer;

  Intensidade, I_Amb, I_Dif, I_Esp: TCorVector;
  cosTheta, cosNH: Double;
  distLuz, fatorAtenuacao: Double;

  function Clamp(const C: TCorVector): TCorVector;
  begin
    Result.x := EnsureRange(C.x, 0, 1);
    Result.y := EnsureRange(C.y, 0, 1);
    Result.z := EnsureRange(C.z, 0, 1);
  end;

  function MakeColor(r, g, b: Double): TCorVector;
  begin
    Result.x := r;
    Result.y := g;
    Result.z := b;
  end;

begin
  LimparZBuffer;  // Deve preencher com um valor bem pequeno (ex: -999999)

  cx := Image1.Width div 2;
  cy := Image1.Height div 2;

  // --------------------------
  // POSIÇÕES DA CENA
  // --------------------------
  PosObservador.x := 0;   PosObservador.y := 0;   PosObservador.z := 100;
  PosLuz.x := 100;        PosLuz.y := 0;          PosLuz.z := 100;

  // Luzes
  Ia := MakeColor(0, 0, 1);
  Ib := MakeColor(1,0,0);
  Il := MakeColor(1.0, 1.0, 1.0);

  // Constantes fornecidas pelo usuário
  Ka := MakeColor(StrToFloat(Edit3.Text),
                  StrToFloat(Edit3.Text),
                  StrToFloat(Edit3.Text));

  K_Atenuacao := StrToFloat(Edit4.Text);

  // Materiais
  Kd := MakeColor(0.3, 0.3, 0.3);  // difusa
  Ks := MakeColor(0.8, 0.8, 0.8);  // especular
  specularN := 16;

  // ------------------------------
  // PLANO
  // ------------------------------

  for x := -100 to 100 do
    for y := -100 to 100 do
    begin
      P.x := x;
      P.y := y;
      P.z := -200;  // bem atrás da esfera

      N.x := 0; N.y := 0; N.z := 1;

      L := Normalizar(Subtrair(PosLuz, P));
      S := Normalizar(Subtrair(PosObservador, P));

      cosTheta := Max(0, ProdutoEscalar(N, L));

      I_Amb := MultiplicarComponente(Ia, Ka);
      I_Dif := MultiplicarEscalar(
                  MultiplicarComponente(Il, MakeColor(0.7, 0.7, 0.7)),
                  cosTheta);

      Intensidade := Adicionar(I_Amb, I_Dif);

      if Modelo = 2 then
      begin
        H := Normalizar(Adicionar(L, S));
        cosNH := Max(0, ProdutoEscalar(N, H));

        I_Esp := MultiplicarEscalar(
                   MultiplicarComponente(Il, MakeColor(0.4,0.4,0.4)),
                   Power(cosNH, specularN));

        distLuz := Magnitude(Subtrair(PosLuz, P));
        fatorAtenuacao := 1 / (1 + K_Atenuacao * distLuz);

        Intensidade := Adicionar(
                         I_Amb,
                         MultiplicarEscalar(
                           Adicionar(I_Dif, I_Esp),
                           fatorAtenuacao));
      end;

      Intensidade := Clamp(Intensidade);

      px := cx + x;
      py := cy - y;

      if (px >= 0) and (px < Image1.Width) and
         (py >= 0) and (py < Image1.Height) then
      begin
        // Z-BUFFER CORRIGIDO: maior Z = mais perto
        if P.z > ZBuffer[py, px] then
        begin
          ZBuffer[py, px] := P.z;
          Image1.Canvas.Pixels[px, py] := CalcularCor(Intensidade);
        end;
      end;
    end;

  // ------------------------------
  // ESFERA (Centro 0,0,0)
  // ------------------------------
  RaioEsfera := 50;
  step := 0.02;

  a := -Pi/2;
  while a <= Pi/2 do
  begin
    b := -Pi;
    while b <= Pi do
    begin
      P.x := RaioEsfera * Cos(a) * Cos(b);
      P.y := RaioEsfera * Cos(a) * Sin(b);
      P.z := RaioEsfera * Sin(a);

      N := Normalizar(P);

      L := Normalizar(Subtrair(PosLuz, P));
      S := Normalizar(Subtrair(PosObservador, P));

      I_Amb := MultiplicarComponente(Ib, Ka);

      cosTheta := Max(0, ProdutoEscalar(N, L));
      I_Dif := MultiplicarEscalar(MultiplicarComponente(Il, Kd), cosTheta);

      Intensidade := Adicionar(I_Amb, I_Dif);

      if Modelo = 2 then
      begin
        H := Normalizar(Adicionar(L, S));
        cosNH := Max(0, ProdutoEscalar(N, H));

        I_Esp := MultiplicarEscalar(MultiplicarComponente(Il, Ks),
                                     Power(cosNH, specularN));

        distLuz := Magnitude(Subtrair(PosLuz, P));
        fatorAtenuacao := 1 / (1 + K_Atenuacao * distLuz);

        Intensidade := Adicionar(
                         I_Amb,
                         MultiplicarEscalar(
                           Adicionar(I_Dif, I_Esp), fatorAtenuacao));
      end;

      Intensidade := Clamp(Intensidade);

      px := cx + Round(P.x);
      py := cy - Round(P.y);

      if (px >= 0) and (px < Image1.Width) and
         (py >= 0) and (py < Image1.Height) then
      begin
        // usando o novo Z-buffer (maior Z = mais perto)
        if P.z > ZBuffer[py, px] then
        begin
          ZBuffer[py, px] := P.z;
          Image1.Canvas.Pixels[px, py] := CalcularCor(Intensidade);
        end;
      end;

      b := b + step;
    end;
    a := a + step;
  end;

end;







{ TForm1 }

// ****** INÍCIO DO NOVO BLOCO DE FUNÇÕES AUXILIARES ******

procedure TForm1.LimparZBuffer;
var i,j: Integer;
begin
  for i := 0 to Image1.Height-1 do
    for j := 0 to Image1.Width-1 do
      ZBuffer[i,j] := -99999999;   // OU -999999999
end;

function TForm1.Vetor(P1, P2: TVector3D): TVector3D;
begin
  Result.x := P2.x - P1.x;
  Result.y := P2.y - P1.y;
  Result.z := P2.z - P1.z;
end;

function TForm1.Subtrair(V1, V2: TVector3D): TVector3D;
begin
  Result.x := V1.x - V2.x;
  Result.y := V1.y - V2.y;
  Result.z := V1.z - V2.z;
end;

function TForm1.Adicionar(V1, V2: TVector3D): TVector3D;
begin
  Result.x := V1.x + V2.x;
  Result.y := V1.y + V2.y;
  Result.z := V1.z + V2.z;
end;

function TForm1.MultiplicarEscalar(V: TVector3D; s: Double): TVector3D;
begin
  Result.x := V.x * s;
  Result.y := V.y * s;
  Result.z := V.z * s;
end;

// Multiplicação componente a componente (para cores)
function TForm1.MultiplicarComponente(V1, V2: TCorVector): TCorVector;
begin
  Result.x := V1.x * V2.x;
  Result.y := V1.y * V2.y;
  Result.z := V1.z * V2.z;
end;

function TForm1.Magnitude(V: TVector3D): Double;
begin
  Result := Sqrt(Sqr(V.x) + Sqr(V.y) + Sqr(V.z));
end;

function TForm1.Normalizar(V: TVector3D): TVector3D;
var
  mag: Double;
begin
  mag := Magnitude(V);
  if mag = 0 then
  begin
    Result.x := 0; Result.y := 0; Result.z := 0;
  end
  else
  begin
    Result.x := V.x / mag;
    Result.y := V.y / mag;
    Result.z := V.z / mag;
  end;
end;

function TForm1.ProdutoEscalar(V1, V2: TVector3D): Double;
begin
  Result := V1.x * V2.x + V1.y * V2.y + V1.z * V2.z;
end;

function TForm1.CalcularCor(Intensidade: TCorVector): TColor;
var
  r, g, b: Integer;
begin
  // 1. Limita (Clamp) a intensidade entre 0.0 e 1.0
  if Intensidade.x < 0 then Intensidade.x := 0;
  if Intensidade.x > 1 then Intensidade.x := 1;
  if Intensidade.y < 0 then Intensidade.y := 0;
  if Intensidade.y > 1 then Intensidade.y := 1;
  if Intensidade.z < 0 then Intensidade.z := 0;
  if Intensidade.z > 1 then Intensidade.z := 1;

  // 2. Converte para 0-255
  r := Round(Intensidade.x * 255);
  g := Round(Intensidade.y * 255);
  b := Round(Intensidade.z * 255);

  // 3. Retorna a cor TColor
  Result := RGBToColor(r, g, b);
end;

// ****** FIM DO NOVO BLOCO DE FUNÇÕES AUXILIARES ******

// ****** FIM DA NOVA FUNÇÃO DE DESENHO (ILUMINAÇÃO) ******

procedure TForm1.DesenharSuperficieBilinear(P00, P01, P10, P11: TVector3D;
  Cor: TColor; const MTransform: TMatriz);
var
  u, v, step: Double;
  P_uv: TVector3D;
  MC, MResultado: TMatriz;
  px, py: Integer;
  z_prof: Double;
  ImgWidth, ImgHeight, canvasCenterX, canvasCenterY: Integer;
begin
  ImgWidth := Image1.Width;
  ImgHeight := Image1.Height;
  canvasCenterX := ImgWidth div 2;
  canvasCenterY := ImgHeight div 2;

  SetLength(MC, 1, 4);
  SetLength(MResultado, 1, 4);
  MC[0, 3] := 1.0;

  // Passo menor para maior qualidade
  step := 0.02;

  u := 0;
  while u <= 1.0 do
  begin
    v := 0;
    while v <= 1.0 do
    begin
      // Calcula P(u,v) usando interpolação bilinear
      P_uv.x := P00.x * (1 - u) * (1 - v) +
                P01.x * (1 - u) * v +
                P10.x * u * (1 - v) +
                P11.x * u * v;

      P_uv.y := P00.y * (1 - u) * (1 - v) +
                P01.y * (1 - u) * v +
                P10.y * u * (1 - v) +
                P11.y * u * v;

      P_uv.z := P00.z * (1 - u) * (1 - v) +
                P01.z * (1 - u) * v +
                P10.z * u * (1 - v) +
                P11.z * u * v;

      MC[0, 0] := P_uv.x;
      MC[0, 1] := P_uv.y;
      MC[0, 2] := P_uv.z;

      MultiplicarMatrizes(MC, MTransform, MResultado);

      px := canvasCenterX + Round(MResultado[0, 0]);
      py := canvasCenterY - Round(MResultado[0, 1]);
      z_prof := MResultado[0, 2];

      if (px >= 0) and (px < ImgWidth) and (py >= 0) and (py < ImgHeight) then
      begin
        if z_prof < ZBuffer[py, px] then
        begin
          ZBuffer[py, px] := z_prof;
          Image1.Canvas.Pixels[px, py] := Cor;
        end;
      end;

      v := v + step;
    end;
    u := u + step;
  end;

  SetLength(MC, 0, 0);
  SetLength(MResultado, 0, 0);
end;
procedure TForm1.desenharPratica1(const MTransform: TMatriz);
var
  V: array[1..10] of TVector3D;
  x_idx, y_idx: Integer;
begin
  // Define os 10 Vértices
  V[1].x := 0;   V[1].y := 0;   V[1].z := 0;
  V[2].x := 0;   V[2].y := 0;   V[2].z := 80;
  V[3].x := 0;   V[3].y := 40;  V[3].z := 80;
  V[4].x := 20;  V[4].y := 0;   V[4].z := 0;
  V[5].x := 20;  V[5].y := 0;   V[5].z := 80;
  V[6].x := 20;  V[6].y := 40;  V[6].z := 80;
  V[7].x := 100; V[7].y := 0;   V[7].z := 0;
  V[8].x := 100; V[8].y := 40;  V[8].z := 0;
  V[9].x := 120; V[9].y := 0;   V[9].z := 0;
  V[10].x := 120; V[10].y := 40; V[10].z := 0;

  // Limpa Canvas e Z-Buffer
  Image1.Canvas.Brush.Color := clBlack;
  Image1.Canvas.FillRect(0, 0, Image1.Width, Image1.Height);

  SetLength(ZBuffer, Image1.Height, Image1.Width);
  for y_idx := 0 to Image1.Height - 1 do
    for x_idx := 0 to Image1.Width - 1 do
      ZBuffer[y_idx, x_idx] := 1e10; // Valor grande ao invés de Infinity

  // Desenha as 7 faces usando superfícies bilineares

  // Quadriláteros (4 vértices distintos)
  DesenharSuperficieBilinear(V[1], V[2], V[4], V[5], clGreen, MTransform);  // Face 1 - Verde Lateral
  DesenharSuperficieBilinear(V[2], V[3], V[5], V[6], clGreen, MTransform);  // Face 2 - Verde Traseira
  DesenharSuperficieBilinear(V[7], V[8], V[9], V[10], clMaroon, MTransform); // Face 7 - Marrom Chão

  // Triângulos (usando P10=P11 ou P01=P11)
  DesenharSuperficieBilinear(V[4], V[5], V[7], V[7], clGreen, MTransform);  // Face 3 - Verde Rampa Inf
  DesenharSuperficieBilinear(V[5], V[6], V[8], V[8], clYellow, MTransform); // Face 4 - Amarelo Rampa
  DesenharSuperficieBilinear(V[3], V[6], V[8], V[8], clBlue, MTransform);   // Face 5 - Azul Rampa
  DesenharSuperficieBilinear(V[4], V[7], V[8], V[8], clRed, MTransform);    // Face 6 - Vermelho Chão
end;
procedure TForm1.RotacionarCasinhaChange(Sender: TObject);
begin
  objetos.checked:=False;
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
  // ADICIONADO: Lógica de desenho livre para Varredura (op=13)
  if (op = 13) and (desenhar) then
  begin
    // Adiciona ponto ao perfil
    SetLength(PerfilUsuario, ContadorPerfil + 1);
    PerfilUsuario[ContadorPerfil] := Point(X, Y);
    Inc(ContadorPerfil);

    // Desenha o pixel "à mão livre" (com verificação de limites)
    if (X >= 0) and (X < Image1.Width) and (Y >= 0) and (Y < Image1.Height) then
      Image1.Canvas.Pixels[X, Y] := clRed;
  end;
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
  end

  else if (op = 13) then
  begin
    desenhar := False; // Para de desenhar ao soltar o mouse
  end;


end;

procedure TForm1.Label1Click(Sender: TObject);
begin

end;

procedure TForm1.MenuItem10Click(Sender: TObject);
var
   a, b : Integer;
  MC, MH, MResultado : TMatriz; // array of array of Double; <-- Use TMatriz
  canvasCenterX, canvasCenterY : Integer;
begin
  // Limpa a tela
    Image1.Canvas.Brush.Color := clBlack;
    Image1.Canvas.FillRect(0, 0, Image1.Width, Image1.Height);

    canvasCenterX := Image1.Width div 2;
    canvasCenterY := Image1.Height div 2;

    op := 8;
    flagOpcao8 := True;
    RotacionarCasinha.Checked := True; // <-- Define o CheckBox

    // Prepara matrizes
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

    // Matriz Identidade para Projeção Ortogonal (z=0)
    MH[0,0] := 1;
    MH[1,1] := 1;
    // MH[2,2] := 0; // Projeção z=0
    MH[3,3] := 1;

    // Desenha a casinha na posição inicial
    ProjecaoOrtografica(MC, MH, canvasCenterX, canvasCenterY);

    // Limpa matrizes
    SetLength(MC, 0, 0);
    SetLength(MH, 0, 0);
    SetLength(MResultado, 0, 0);
end;

procedure TForm1.MenuItem11Click(Sender: TObject);
begin

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

procedure TForm1.MenuItem20Click(Sender: TObject);
begin

end;

procedure TForm1.MenuItem16Click(Sender: TObject);
begin
  op:=11;
end;

procedure TForm1.MenuItem16MeasureItem(Sender: TObject; ACanvas: TCanvas;
  var AWidth, AHeight: Integer);
begin

end;

procedure TForm1.MenuItem17Click(Sender: TObject);
var
  MTransform: TMatriz; // Matriz identidade para o desenho inicial
  a, b: Integer;
begin
  // Define a operação para "Z-Buffer"
  op := 12;
  // Habilita os botões de transformação
  flagOpcao8 := True;
  RotacionarCasinha.Checked := False; // <-- Define o CheckBox

  // Limpa os RadioButtons para desenhar o estado inicial
  RadioButton1.Checked := False;
  RadioButton2.Checked := False;
  RadioButton3.Checked := False;
  RadioButton4.Checked := False;
  RadioButton5.Checked := False;
  RadioButton6.Checked := False;

  // Cria uma Matriz Identidade para o desenho inicial
  SetLength(MTransform, 4, 4);
  for a := 0 to 3 do for b := 0 to 3 do MTransform[a,b] := 0.0;
  MTransform[0,0] := 1.0;
  MTransform[1,1] := 1.0;
  MTransform[2,2] := 1.0;
  MTransform[3,3] := 1.0;

  // Desenha o estado inicial dos objetos Z-Buffer
  desenharZBufferObjetos(MTransform);

  SetLength(MTransform, 0, 0);
end;

procedure TForm1.desenharZBufferObjetos(const MTransform: TMatriz);
var
  MC, MResultado: TMatriz;
  ImgWidth, ImgHeight, canvasCenterX, canvasCenterY: Integer;
  x_idx, y_idx, z_idx, px, py: Integer;
  x_obj, y_obj, z_obj: Double;
  a_obj, b_obj: Double;
  z_prof: Double;
   t_obj:Integer;

  // Vértices das superfícies bilineares
  V: array[1..10] of TVector3D;

begin
  // ----------------------------------------
  // INICIALIZAÇÃO E Z-BUFFER
  // ----------------------------------------
  ImgWidth := Image1.Width;
  ImgHeight := Image1.Height;
  canvasCenterX := ImgWidth div 2;
  canvasCenterY := ImgHeight div 2;

  Image1.Canvas.Brush.Color := clBlack;
  Image1.Canvas.FillRect(Rect(0, 0, ImgWidth, ImgHeight));

  SetLength(ZBuffer, ImgHeight, ImgWidth);
  for y_idx := 0 to ImgHeight - 1 do
    for x_idx := 0 to ImgWidth - 1 do
      ZBuffer[y_idx, x_idx] := Math.Infinity;

  SetLength(MC, 1, 4);
  SetLength(MResultado, 1, 4);
  MC[0,3] := 1;

  // ============================================================
  // HELPER LOCAL: desenha direto com Z-Buffer (substitui Plot3D)
  // ============================================================
  // MC[0,0], MC[0,1], MC[0,2] devem ser preenchidos antes
  // usa MTransform que vem da casinha/rotação
  // ============================================================

  // ------------------------------------------------
  // OBJETO 1 – AZUL
  // ------------------------------------------------
  for x_idx := 10 to 30 do
    for y_idx := 20 to 40 do
    begin
      z_obj := x_idx*x_idx + y_idx;

      MC[0,0] := x_idx;
      MC[0,1] := y_idx;
      MC[0,2] := z_obj;

      MultiplicarMatrizes(MC, MTransform, MResultado);

      px := canvasCenterX + Round(MResultado[0,0]);
      py := canvasCenterY - Round(MResultado[0,1]);
      z_prof := MResultado[0,2];

      if (px >= 0) and (px < ImgWidth) and (py >= 0) and (py < ImgHeight) then
        if z_prof < ZBuffer[py, px] then
        begin
          ZBuffer[py, px] := z_prof;
          Image1.Canvas.Pixels[px, py] := clBlue;
        end;
    end;

  // ------------------------------------------------
  // OBJETO 2 – VERMELHO
  // ------------------------------------------------
  for x_idx := 50 to 100 do
    for y_idx := 30 to 80 do
    begin
      z_obj := 3*x_idx - 2*y_idx + 5;

      MC[0,0] := x_idx;
      MC[0,1] := y_idx;
      MC[0,2] := z_obj;

      MultiplicarMatrizes(MC, MTransform, MResultado);

      px := canvasCenterX + Round(MResultado[0,0]);
      py := canvasCenterY - Round(MResultado[0,1]);
      z_prof := MResultado[0,2];

      if (px >= 0) and (px < ImgWidth) and (py >= 0) and (py < ImgHeight) then
        if z_prof < ZBuffer[py, px] then
        begin
          ZBuffer[py, px] := z_prof;
          Image1.Canvas.Pixels[px, py] := clRed;
        end;
    end;

  // ------------------------------------------------
  // OBJETO 3 – AMARELO (helicoidal)
  // ------------------------------------------------
  for t_obj := 0 to 50 do
  begin
    a_obj := 0;
    while a_obj <= 2*pi do
    begin
      x_obj := 30 + cos(a_obj)*t_obj;
      y_obj := 50 + sin(a_obj)*t_obj;
      z_obj := 10 + t_obj;

      MC[0,0] := x_obj;
      MC[0,1] := y_obj;
      MC[0,2] := z_obj;

      MultiplicarMatrizes(MC, MTransform, MResultado);

      px := canvasCenterX + Round(MResultado[0,0]);
      py := canvasCenterY - Round(MResultado[0,1]);
      z_prof := MResultado[0,2];

      if (px>=0) and (px<ImgWidth) and (py>=0) and (py<ImgHeight) then
        if z_prof < ZBuffer[py,px] then
        begin
          ZBuffer[py,px] := z_prof;
          Image1.Canvas.Pixels[px,py] := clYellow;
        end;

      a_obj := a_obj + 0.05;
    end;
  end;

  // ------------------------------------------------
  // OBJETO 4 – VERDE (esfera paramétrica deslocada)
  // ------------------------------------------------
  a_obj := 0;
  while a_obj <= 2*pi do
  begin
    b_obj := 0;
    while b_obj <= 2*pi do
    begin
      x_obj := 100 + 30*cos(a_obj)*cos(b_obj);
      y_obj := 50 + 30*cos(a_obj)*sin(b_obj);
      z_obj := 20 + 30*sin(a_obj);

      MC[0,0] := x_obj;
      MC[0,1] := y_obj;
      MC[0,2] := z_obj;

      MultiplicarMatrizes(MC, MTransform, MResultado);

      px := canvasCenterX + Round(MResultado[0,0]);
      py := canvasCenterY - Round(MResultado[0,1]);
      z_prof := MResultado[0,2];

      if (px>=0) and (px<ImgWidth) and (py>=0) and (py<ImgHeight) then
        if z_prof < ZBuffer[py,px] then
        begin
          ZBuffer[py,px] := z_prof;
          Image1.Canvas.Pixels[px,py] := clGreen;
        end;

      b_obj := b_obj + 0.05;
    end;
    a_obj := a_obj + 0.05;
  end;

  // ------------------------------------------------
  // OBJETO 5 – CUBO BRANCO (6 FACES) — SEM PROCEDURE
  // ------------------------------------------------

  // Face z = 20 (topo)
  for x_idx := -20 to 20 do
    for y_idx := -20 to 20 do
    begin
      MC[0,0] := x_idx;
      MC[0,1] := y_idx;
      MC[0,2] := 20;

      MultiplicarMatrizes(MC, MTransform, MResultado);
      px := canvasCenterX + Round(MResultado[0,0]);
      py := canvasCenterY - Round(MResultado[0,1]);
      z_prof := MResultado[0,2];

      if (px>=0) and (px<ImgWidth) and (py>=0) and (py<ImgHeight) then
        if z_prof < ZBuffer[py,px] then
        begin
          ZBuffer[py,px] := z_prof;
          Image1.Canvas.Pixels[px,py] := clWhite;
        end;
    end;

  // Face z = -20
  for x_idx := -20 to 20 do
    for y_idx := -20 to 20 do
    begin
      MC[0,0] := x_idx;
      MC[0,1] := y_idx;
      MC[0,2] := -20;

      MultiplicarMatrizes(MC, MTransform, MResultado);
      px := canvasCenterX + Round(MResultado[0,0]);
      py := canvasCenterY - Round(MResultado[0,1]);
      z_prof := MResultado[0,2];

      if (px>=0) and (px<ImgWidth) and (py>=0) and (py<ImgHeight) then
        if z_prof < ZBuffer[py,px] then
        begin
          ZBuffer[py,px] := z_prof;
          Image1.Canvas.Pixels[px,py] := clWhite;
        end;
    end;

  // Face y = 20
  for x_idx := -20 to 20 do
    for z_idx := -20 to 20 do
    begin
      MC[0,0] := x_idx;
      MC[0,1] := 20;
      MC[0,2] := z_idx;

      MultiplicarMatrizes(MC, MTransform, MResultado);
      px := canvasCenterX + Round(MResultado[0,0]);
      py := canvasCenterY - Round(MResultado[0,1]);
      z_prof := MResultado[0,2];

      if (px>=0) and (px<ImgWidth) and (py>=0) and (py<ImgHeight) then
        if z_prof < ZBuffer[py,px] then
        begin
          ZBuffer[py,px] := z_prof;
          Image1.Canvas.Pixels[px,py] := clWhite;
        end;
    end;

  // Face y = -20
  for x_idx := -20 to 20 do
    for z_idx := -20 to 20 do
    begin
      MC[0,0] := x_idx;
      MC[0,1] := -20;
      MC[0,2] := z_idx;

      MultiplicarMatrizes(MC, MTransform, MResultado);
      px := canvasCenterX + Round(MResultado[0,0]);
      py := canvasCenterY - Round(MResultado[0,1]);
      z_prof := MResultado[0,2];

      if (px>=0) and (px<ImgWidth) and (py>=0) and (py<ImgHeight) then
        if z_prof < ZBuffer[py,px] then
        begin
          ZBuffer[py,px] := z_prof;
          Image1.Canvas.Pixels[px,py] := clWhite;
        end;
    end;

  // Face x = 20
  for y_idx := -20 to 20 do
    for z_idx := -20 to 20 do
    begin
      MC[0,0] := 20;
      MC[0,1] := y_idx;
      MC[0,2] := z_idx;

      MultiplicarMatrizes(MC, MTransform, MResultado);
      px := canvasCenterX + Round(MResultado[0,0]);
      py := canvasCenterY - Round(MResultado[0,1]);
      z_prof := MResultado[0,2];

      if (px>=0) and (px<ImgWidth) and (py>=0) and (py<ImgHeight) then
        if z_prof < ZBuffer[py,px] then
        begin
          ZBuffer[py,px] := z_prof;
          Image1.Canvas.Pixels[px,py] := clWhite;
        end;
    end;

  // Face x = -20
  for y_idx := -20 to 20 do
    for z_idx := -20 to 20 do
    begin
      MC[0,0] := -20;
      MC[0,1] := y_idx;
      MC[0,2] := z_idx;

      MultiplicarMatrizes(MC, MTransform, MResultado);
      px := canvasCenterX + Round(MResultado[0,0]);
      py := canvasCenterY - Round(MResultado[0,1]);
      z_prof := MResultado[0,2];

      if (px>=0) and (px<ImgWidth) and (py>=0) and (py<ImgHeight) then
        if z_prof < ZBuffer[py,px] then
        begin
          ZBuffer[py,px] := z_prof;
          Image1.Canvas.Pixels[px,py] := clWhite;
        end;
    end;

  // ----------------------------------------------------------
  // SUPERFÍCIES BILINEARES — AULA 19 (com vértices corretos)
  // ----------------------------------------------------------
     V[1].x := 0;   V[1].y := 0;   V[1].z := 0;
V[2].x := 0;   V[2].y := 0;   V[2].z := 80;
V[3].x := 0;   V[3].y := 40;  V[3].z := 80;
V[4].x := 20;  V[4].y := 0;   V[4].z := 0;
V[5].x := 20;  V[5].y := 0;   V[5].z := 80;
V[6].x := 20;  V[6].y := 40;  V[6].z := 80;
V[7].x := 100; V[7].y := 0;   V[7].z := 0;
V[8].x := 100; V[8].y := 40;  V[8].z := 0;
V[9].x := 120; V[9].y := 0;   V[9].z := 0;
V[10].x := 120; V[10].y := 40; V[10].z := 0;

  DesenharSuperficieBilinear(V[1], V[2], V[4], V[5], clGreen, MTransform);
  DesenharSuperficieBilinear(V[2], V[3], V[5], V[6], clGreen, MTransform);
  DesenharSuperficieBilinear(V[4], V[5], V[7], V[8], clRed,   MTransform);
  DesenharSuperficieBilinear(V[5], V[6], V[8], V[7], clYellow,MTransform);
  DesenharSuperficieBilinear(V[3], V[6], V[8], V[2], clBlue,  MTransform);
  DesenharSuperficieBilinear(V[7], V[8], V[10],V[9], clMaroon,MTransform);

  // ----------------------------------------
  // ENCERRAMENTO
  // ----------------------------------------
  SetLength(MC,0,0);
  SetLength(MResultado,0,0);
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

