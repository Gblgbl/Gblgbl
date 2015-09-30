unit SDIMAIN;

interface

uses Winapi.Windows, System.Classes, Vcl.Graphics, Vcl.Forms, Vcl.Controls,
  Vcl.Menus, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.ImgList, Vcl.StdActns, Vcl.ActnList, Vcl.ToolWin, System.ImageList,
  System.Actions, Dbs, SysUtils, Data.DB, IBX.IBDatabase, IBX.IBCustomDataSet,
  IBX.IBQuery, FireDAC.Phys.IBDef, FireDAC.Stan.Intf, FireDAC.Phys,
  FireDAC.Phys.IBBase, FireDAC.Phys.IB, DBLogDlg, Vcl.Grids, StrUtils;

type
  TSDIAppForm = class(TForm)
    StatusBar: TStatusBar;
    Label1: TLabel;
    eAgrno: TEdit;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    N1: TMenuItem;
    FileExitItem: TMenuItem;
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
    mFileDBS: TMemo;
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    IBQueryOrders: TIBQuery;
    IBUpdOrders: TIBQuery;
    IBQueryOrdersORDERID: TIntegerField;
    IBQueryOrdersPARENTID: TIntegerField;
    IBQueryOrdersSYSUPDDATE: TDateTimeField;
    IBQueryOrdersOWNERTYPE: TIntegerField;
    IBQueryOrdersORDERNO: TIBStringField;
    IBQueryOrdersAGREEMENTNO: TIBStringField;
    IBQueryOrdersAGREEMENTDATE: TDateTimeField;
    IBQueryOrdersCURRENCYID: TIntegerField;
    IBQueryOrdersSELLERID: TIntegerField;
    IBQueryOrdersCUSTOMERID: TIntegerField;
    IBQueryOrdersORDERSTATEID: TIntegerField;
    IBQueryOrdersPAYTYPEID: TIntegerField;
    IBQueryOrdersITEMSTATUSMODE: TIntegerField;
    IBQueryOrdersTOTALPRICELOCK: TIntegerField;
    IBQueryOrdersLABORIOUSNESS: TIntegerField;
    IBQueryOrdersPRODDATE: TDateTimeField;
    IBQueryOrdersFACTORYNUM: TIntegerField;
    IBQueryOrdersFLOORINSTALL: TIBStringField;
    IBQueryOrdersPHONEINSTALL: TIBStringField;
    IBQueryOrdersDATEORDER: TDateTimeField;
    IBQueryOrdersORDERSTATUS: TSmallintField;
    IBQueryOrdersLASTGENITEM: TIntegerField;
    IBQueryOrdersRECCOLOR: TIntegerField;
    IBQueryOrdersRECFLAG: TIntegerField;
    IBQueryOrdersGUIDHI: TLargeintField;
    IBQueryOrdersGUIDLO: TLargeintField;
    IBQueryOrdersOWNERID: TIntegerField;
    IBQueryOrdersDATECREATED: TDateTimeField;
    IBQueryOrdersDATEMODIFIED: TDateTimeField;
    IBQueryOrdersDATEDELETED: TDateTimeField;
    IBQueryOrdersDELETED: TIntegerField;
    IBQueryOrdersRCOMMENT: TIBStringField;
    IBQueryOrdersADRESSINSTALL: TIBStringField;
    IBQueryOrdersVALID: TIntegerField;
    IBQueryOrdersTOTALPRICE: TIBBCDField;
    IBQueryOrdersPAYMENT: TIBBCDField;
    IBQueryOrdersISDEALERADD: TIntegerField;
    IBQueryOrdersISDEALERSTARTADD: TIntegerField;
    IBQueryOrdersDEALERGUIDHI: TLargeintField;
    IBQueryOrdersDEALERGUIDLO: TLargeintField;
    IBQueryOrdersISRESERVED: TIntegerField;
    IBQueryOrdersAPPROVEDOCUMENTID: TIntegerField;
    IBQueryOrdersACCOUNTID: TIntegerField;
    IBQueryOrdersWPREQUESTID: TIntegerField;
    IBQueryOrdersCROSSRATE: TFMTBCDField;
    IBKillAttach: TIBQuery;
    IBQueryAttach: TIBQuery;
    bScr: TButton;
    FDPhysIBDriverLink1: TFDPhysIBDriverLink;
    sgOrders: TStringGrid;
    IBQueryAttachMONATTACHMENT_ID: TIntegerField;
    IBQueryAttachMONSERVER_PID: TIntegerField;
    IBQueryAttachMONSTATE: TSmallintField;
    IBQueryAttachMONATTACHMENT_NAME: TIBStringField;
    IBQueryAttachMONUSER: TIBStringField;
    IBQueryAttachMONROLE: TIBStringField;
    IBQueryAttachMONREMOTE_PROTOCOL: TIBStringField;
    IBQueryAttachMONREMOTE_ADDRESS: TIBStringField;
    IBQueryAttachMONREMOTE_PID: TIntegerField;
    IBQueryAttachMONCHARACTER_SET_ID: TSmallintField;
    IBQueryAttachMONTIMESTAMP: TDateTimeField;
    IBQueryAttachMONGARBAGE_COLLECTION: TSmallintField;
    IBQueryAttachMONREMOTE_PROCESS: TIBStringField;
    IBQueryAttachMONSTAT_ID: TIntegerField;
    IBQueryAttachMONTRANSACTION_ID: TIntegerField;
    IBQueryAttachSQL_TEXT: TWideMemoField;
    IBQueryAttachSTART_TR: TDateTimeField;
    Timer1: TTimer;
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
    procedure eAgrnoChange(Sender: TObject);
    procedure bScrClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure SetDBFileName;
  private
    { Private declarations }
  public
    { Public declarations }
  end;
const
  FileDBS = 'dbsList.dbl';
  teststr = 'teststr';
 // emess = 'ExecSQL error.'+#13+#10+
  emess = 'lock conflict on no wait transaction'+#13+#10+
          'deadlock'+#13+#10+
          'update conflicts with concurrent update'+#13+#10+
          'concurrent transaction number is ';
var
  SDIAppForm: TSDIAppForm;
  i : integer ;

implementation

uses About;

{$R *.dfm}
procedure TSDIAppForm.SetDBFileName;
var
  n : integer ;
begin
  for I := 0 to BDList.Count - 1 do
  begin
    if BDList.Items[i].Checked then
    begin
      n:=i;
      IBDatabase1.Connected := False ;
      IBDatabase1.DatabaseName := DBS.Form1.sgBD.Cells[2,i+1];   //тут какая-то шляпа
    end;
  end;
end;

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
    DBs.Form1.sgBD.Cells[1,i]:= dbCap;
    DBs.Form1.sgBD.Cells[2,i]:= dbName;
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
    if ((Trim(DBs.Form1.sgBD.Cells[1,i]) <> '') and (Trim(DBs.Form1.sgBD.Cells[2,i]) <> '')) then
    begin
      dbCap   := DBs.Form1.sgBD.Cells[1,i];
      dbName  := DBs.Form1.sgBD.Cells[2,i];
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
    item.Caption := DBs.Form1.sgBD.Cells[1,i];
    item.Name := 'BDListItem'+IntToStr(i);
    item.OnClick := OnBDListItemClick;
    BDList.Add(item);
  end;
end;

procedure TSDIAppForm.Timer1Timer(Sender: TObject);
begin
  if IBDataBase1.Connected then
    StatusBar.Panels[1].Text:='Подключено.'
    else StatusBar.Panels[1].Text:='Не подключено.';

end;

procedure TSDIAppForm.OnBDListItemClick ( Sender : TObject ) ;
var
  n : integer ;
begin
  //ShowMessage(IntToStr((Sender as TMenuItem).MenuIndex));
  n := (Sender as TMenuItem).MenuIndex;
  if not BDList.Items[n].Checked then
  begin
    for I := 0 to BDList.Count - 1 do
      BDList.Items[i].Checked := False;
    BDList.Items[n].Checked := true;
    SetDBFileName;
  end;

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
  DBs.Form1.sgBD.Cells[0,0]:='Осн.';
  DBs.Form1.sgBD.Cells[1,0]:='Имя';
  DBs.Form1.sgBD.Cells[2,0]:='Путь';
  sgOrders.Rows[0].Add('№ дог.');
  sgOrders.Rows[0].Add('Блок.');
  sgOrders.Rows[0].Add('Когда');
  sgOrders.Rows[0].Add('IP');
  sgOrders.Rows[0].Add('Login');
  //sgOrders.Rows[0].Add('');
  if FileExists(FileDBS) then
  begin
    mFileDBS.Lines.LoadFromFile(FileDBS) ;
    fillGridFromMemo;
    SetBDListSubMenu;
    if BDList.Count > 0 then
    begin
      BDList.Items[0].Checked := True;
      //IBDataBase1.DatabaseName
    end;
  end
    else ShowMessage('Отсутствует список БД!');
end;

procedure TSDIAppForm.bScrClick(Sender: TObject);
var
  id : integer ;
  ExceptionMessage : string ;
begin
  //ShowMessage('q');
  //sgOrders.Rows.Clear;
  IBQueryOrders.ParamByName('agrno').Value:= Trim(eAgrno.Text);
  IBQueryOrders.Open;
  i := 0;
  sgOrders.RowCount:=2;
  sgOrders.Rows[1].Clear;
  while not IBQueryOrders.Eof do
  begin                                           //teststr
    inc(i);
    sgOrders.RowCount:=i+1;
    sgOrders.Rows[i].Add(IBQueryOrdersAGREEMENTNO.AsString);
    IBUpdOrders.ParamByName('orderid').Value:=IBQueryOrdersORDERID.AsInteger;
    IBUpdOrders.ParamByName('agrno').Value:=IBQueryOrdersAGREEMENTNO.AsString;//+teststr;
    id := 0;
    try
      IBUpdOrders.ExecSQL;
    except
      On E : Exception do
      begin
        //ShowMessage(E.ClassName+#10+E.Message);
        ExceptionMessage := E.Message;
        if Pos(emess,ExceptionMessage) = 1 then
          id:=StrToInt(Trim(AnsiReplaceText(ExceptionMessage, emess, ' ')));
      end;
    end;
    if id <> 0 then
    begin
      sgOrders.Rows[i].Add('+');
      IBQueryAttach.ParamByName('transaction_id').Value:=id;
      IBQueryAttach.Open;
      sgOrders.Rows[i].Add(IBQueryAttach.FieldByName('START_TR').AsString);
      sgOrders.Rows[i].Add(IBQueryAttach.FieldByName('MON$REMOTE_ADDRESS').AsString);
      sgOrders.Rows[i].Add(IBQueryAttach.FieldByName('MON$USER').AsString);
      IBQueryAttach.Close;
    end else
    begin
      sgOrders.Rows[i].Add('-');
    end;
    IBQueryOrders.Next;
  end;
  IBQueryOrders.Close;
  IBTransaction1.Commit;
end;

procedure TSDIAppForm.eAgrnoChange(Sender: TObject);
begin
  if Length(Trim(eAgrno.Text)) > 5 then
    bScr.Enabled := True
    else
    bScr.Enabled := False;
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
