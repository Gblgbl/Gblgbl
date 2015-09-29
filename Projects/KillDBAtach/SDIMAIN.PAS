unit SDIMAIN;

interface

uses Winapi.Windows, System.Classes, Vcl.Graphics, Vcl.Forms, Vcl.Controls,
  Vcl.Menus, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.ImgList, Vcl.StdActns, Vcl.ActnList, Vcl.ToolWin, System.ImageList,
  System.Actions, Dbs, SysUtils;

type
  TSDIAppForm = class(TForm)
    StatusBar: TStatusBar;
    Label1: TLabel;
    eAgrno: TEdit;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    N1: TMenuItem;
    FileExitItem: TMenuItem;
    Edit1: TMenuItem;
    CutItem: TMenuItem;
    CopyItem: TMenuItem;
    PasteItem: TMenuItem;
    Help1: TMenuItem;
    HelpAboutItem: TMenuItem;
    ActionList1: TActionList;
    FileNew1: TAction;
    FileOpen1: TAction;
    FileSave1: TAction;
    FileSaveAs1: TAction;
    FileExit1: TAction;
    EditCut1: TEditCut;
    EditCopy1: TEditCopy;
    EditPaste1: TEditPaste;
    HelpAbout1: TAction;
    ImageList1: TImageList;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    Options: TMenuItem;
    BDList: TMenuItem;
    N3: TMenuItem;
    Memo1: TMemo;
    mFileDBS: TMemo;
    procedure FileNew1Execute(Sender: TObject);
    procedure FileOpen1Execute(Sender: TObject);
    procedure FileSave1Execute(Sender: TObject);
    procedure FileExit1Execute(Sender: TObject);
    procedure HelpAbout1Execute(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure fillGridFromMemo ;
    procedure fillMemoFromGrid ;
    procedure SetBDListSubMenu ;
    procedure OnBDListItemClick (Sender : TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
const
  FileDBS = 'dbsList.dbl';
var
  SDIAppForm: TSDIAppForm;
  i : integer ;

implementation

uses About;

{$R *.dfm}
procedure TSDIAppForm.fillGridFromMemo ;
const
  SepChar = '=';
var
  tmp_str : string ;
  dbCap, dbName : string ;
begin
  for i:= 1 to mFileDBS.Lines.Count do
  begin
    tmp_str := mFileDBS.Lines[i-1];
    dbCap := Trim(Copy(tmp_str,1,Pos(SepChar,tmp_str)-1));
    dbName := Trim(Copy(tmp_str,Pos(SepChar,tmp_str)+1,Length(tmp_str)-Pos(SepChar,tmp_str)));
    DBs.Form1.sgBD.RowCount:=i+1;
    DBs.Form1.sgBD.Cells[0,i]:= dbCap;
    DBs.Form1.sgBD.Cells[1,i]:= dbName;
  end;
end;

procedure TSDIAppForm.fillMemoFromGrid ;
const
  SepChar = '=';
var
  tmp_str : string ;
  dbCap, dbName : string ;
begin
  mFileDBS.Lines.Clear;
  for i:= 1 to DBs.Form1.sgBD.RowCount do
  begin
    if ((Trim(DBs.Form1.sgBD.Cells[0,i]) <> '') and (Trim(DBs.Form1.sgBD.Cells[1,i]) <> '')) then
    begin
      dbCap   := DBs.Form1.sgBD.Cells[0,i];
      dbName  := DBs.Form1.sgBD.Cells[1,i];
      tmp_str := dbCap + SepChar + dbName ;
      mFileDBS.Lines.Add(tmp_str);
    end;
  end;

end;

procedure TSDIAppForm.SetBDListSubMenu ;
var
  item : TMenuItem;
begin
  BDList.Clear;
  for I := 1 to DBs.Form1.sgBD.RowCount - 1  do
  begin
    item := TMenuItem.Create(BDlist);
    item.Caption := DBs.Form1.sgBD.Cells[0,i];
    item.Name := 'BDListItem'+IntToStr(i);
    item.OnClick := OnBDListItemClick;
    BDList.Add(item);
  end;
end;

procedure TSDIAppForm.OnBDListItemClick ( Sender : TObject ) ;
begin
  ShowMessage((Sender as TMenuItem).Name);
end;

procedure TSDIAppForm.FileNew1Execute(Sender: TObject);
begin
  { Do nothing }
end;

procedure TSDIAppForm.FileOpen1Execute(Sender: TObject);
begin
  OpenDialog.Execute;
end;

procedure TSDIAppForm.FileSave1Execute(Sender: TObject);
begin
  SaveDialog.Execute;
end;

procedure TSDIAppForm.FormActivate(Sender: TObject);
begin
  DBs.Form1.sgBD.Cells[0,0]:='Имя';
  DBs.Form1.sgBD.Cells[1,0]:='Путь';

  if FileExists(FileDBS) then
  begin
    mFileDBS.Lines.LoadFromFile(FileDBS) ;
    fillGridFromMemo;
    SetBDListSubMenu;
  end
    else ShowMessage('Отсутствует список БД!');
end;

procedure TSDIAppForm.FileExit1Execute(Sender: TObject);
begin
  Close;
end;

procedure TSDIAppForm.HelpAbout1Execute(Sender: TObject);
begin
  AboutBox.ShowModal;
end;

procedure TSDIAppForm.N3Click(Sender: TObject);
begin

  DBs.Form1.ShowModal;
  if (DBs.Form1.ModalResult = mrOk) then
  begin
    fillMemoFromGrid;
    SetBDListSubMenu;
    mFileDBs.Lines.SaveToFile(FileDBS);
  end;
end;

end.
