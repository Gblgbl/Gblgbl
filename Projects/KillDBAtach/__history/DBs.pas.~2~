unit DBs;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    bOk: TButton;
    sgBD: TStringGrid;
    procedure sgBDKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

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


end;

end.
