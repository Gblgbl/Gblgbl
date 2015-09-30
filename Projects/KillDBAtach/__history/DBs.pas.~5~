unit DBs;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls,
  System.ImageList, Vcl.ImgList, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    bOk: TButton;
    sgBD: TStringGrid;
    ImageList1: TImageList;
    bUp: TButton;
    bDown: TButton;
    GridEditPanel: TPanel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    procedure sgBDKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure SetArrowButtonsEnabled ;
    procedure bUpClick(Sender: TObject);
    procedure sgBDClick(Sender: TObject);
    procedure bDownClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
procedure TForm1.SetArrowButtonsEnabled ;
begin
  if sgBD.Row = 1 then
  begin
    bUp.Enabled := false;
    bUp.ImageIndex := -1 ;
  end
  else begin
    bUp.Enabled := true;
    bUp.ImageIndex := 3 ;
  end;
  if sgBD.Row = sgBD.RowCount - 1 then
  begin
    bDown.Enabled := false;
    bDown.ImageIndex := -1 ;
  end
  else begin
    bDown.Enabled := true;
    bDown.ImageIndex := 0 ;
  end;
end;

procedure TForm1.bDownClick(Sender: TObject);
var
  RowStr : TStrings;
  n : integer ;
begin
  //ShowMessage('Up');
  n := sgBD.Row;
  if n in [1..(sgBD.RowCount- 2)] then
  begin
    RowStr := TStringList.Create;
    RowStr.Text := sgBD.Rows[n].Text;
    sgBD.Rows[n] := sgBD.Rows[n+1];
    sgBD.Rows[n+1] := RowStr;
    n := n + 1;
    sgBD.Row := n ;
  end;
  sgBD.Cols[0].Clear;
  sgBD.Cols[0].Add('Îñí.');
  sgBD.Cols[0].Add('*');
end;

procedure TForm1.bUpClick(Sender: TObject);
var
  RowStr : TStrings;
  n : integer ;
begin
  //ShowMessage('Up');
  n := sgBD.Row;
  if n in [2..(sgBD.RowCount- 1)] then
  begin
    RowStr := TStringList.Create;
    RowStr.Text := sgBD.Rows[n].Text;
    sgBD.Rows[n] := sgBD.Rows[n-1];
    sgBD.Rows[n-1] := RowStr;
    n := n - 1;
    sgBD.Row := n ;
  end;
  sgBD.Cols[0].Clear;
  sgBD.Cols[0].Add('Îñí.');
  sgBD.Cols[0].Add('*');
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  //bUp.Parent    :=  GridEditPanel;
  //bDown.Parent  :=  GridEditPanel;
  sgBD.ColWidths[0]:=35;
  //sgBD.Objects[0,1]:=RadioButton1;
  sgBD.Cells[0,1]:='*';
  SetArrowButtonsEnabled;
end;

procedure TForm1.sgBDClick(Sender: TObject);
begin
  SetArrowButtonsEnabled;
end;

procedure TForm1.sgBDKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 // ShowMessage(IntToStr(Key));
  if (Key = 40) then
    if (sgBD.Row = (sgBD.RowCount - 1)) then
      if Trim(sgBD.Cells[0,(sgBD.RowCount - 1)] + sgBD.Cells[1,(sgBD.RowCount - 1)]) <> '' then
        sgBD.RowCount := sgBD.RowCount + 1;
  if (Key = 38) then
    if Trim(sgBD.Cells[0,(sgBD.RowCount - 1)] + sgBD.Cells[1,(sgBD.RowCount - 1)]) = '' then
      sgBD.RowCount := sgBD.RowCount - 1;

  SetArrowButtonsEnabled;
end;

end.
