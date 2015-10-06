unit SaveToXML;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Xml.xmldom, Xml.XMLIntf, Data.DB,
  IBX.IBCustomDataSet, Xml.XMLDoc, IBX.IBQuery, IBX.IBDatabase, Vcl.StdCtrls,
  Xml.Win.msxmldom;

type
  TForm1 = class(TForm)
    Button1: TButton;
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    IBQueryCust: TIBQuery;
    XMLDocument1: TXMLDocument;
    IBQueryCustDIRACTIONSID: TIntegerField;
    IBQueryCustRECINDEX: TIntegerField;
    IBQueryCustNAME: TIBStringField;
    IBQueryCustRCOMMENT: TIBStringField;
    IBQueryCustRECCOLOR: TIntegerField;
    IBQueryCustRECFLAG: TIntegerField;
    IBQueryCustGUIDHI: TLargeintField;
    IBQueryCustGUIDLO: TLargeintField;
    IBQueryCustOWNERID: TIntegerField;
    IBQueryCustDATECREATED: TDateTimeField;
    IBQueryCustDATEMODIFIED: TDateTimeField;
    IBQueryCustDATEDELETED: TDateTimeField;
    IBQueryCustDELETED: TIntegerField;
    IBQueryCustISADD: TIntegerField;
    IBQueryCustCODE: TIBStringField;
    IBQueryCustUSEINPLANNING: TIntegerField;
    IBQueryOrders: TIBQuery;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IBStringField1: TIBStringField;
    IBStringField2: TIBStringField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    LargeintField1: TLargeintField;
    LargeintField2: TLargeintField;
    IntegerField5: TIntegerField;
    DateTimeField1: TDateTimeField;
    DateTimeField2: TDateTimeField;
    DateTimeField3: TDateTimeField;
    IntegerField6: TIntegerField;
    IntegerField7: TIntegerField;
    IBStringField3: TIBStringField;
    IntegerField8: TIntegerField;
    procedure createXml ;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
procedure TForm1.createXml ;
begin
  XmlDocument1.Active := true;
  with XmlDocument1 do
  begin
    // создаем корневой узел
    with AddChild ('Data') do
    begin
      IBQueryCust.Open;
      while not IBQueryCust.Eof do
      begin
        // создаем дочерний узел
        with AddChild ('Contragent') do
        begin
        // дочерние элементы
          ChildValues ['INN'] := IBQueryCust.FieldByName('INN').AsString;
          IBQueryOrders.Close;
          IBQueryOrders.ParamByName('customerid').Value :=  IBQueryCust.FieldByName('customerid').AsInteger;
          IBQueryOrders.Open;
          While not IBQueryOrders.Eof do
          begin
            with AddChild ('Agreement') do
            begin
              ChildValues ['AgreementNo'] := IBQueryOrders.FieldByName('agreementno').AsString;
              ChildValues ['Status'] := IBQueryOrders.FieldByName('qty').AsString;;
            end; // with
            IBQueryOrders.Next;
          end; //while
        end; // with
        IBQueryCust.Next;
      end; // while
      IBQueryCust.Close;
    end;

  end; // with: создаем

    // записываем
  XmlDocument1. SaveToFile ('Example1.xml');

    // обрати внимание, что объект Xml самостоятельно не уничтожаем, т.к.
    // он уничтожится автоматически при выходе из этой процедуры
end;

end.
