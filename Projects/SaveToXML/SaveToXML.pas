unit SaveToXML;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Xml.xmldom, Xml.XMLIntf, Data.DB,
  IBX.IBCustomDataSet, Xml.XMLDoc, IBX.IBQuery, IBX.IBDatabase, Vcl.StdCtrls,
  Xml.Win.msxmldom, DBLogDlg;

type
  TForm1 = class(TForm)
    Button1: TButton;
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    IBQueryCust: TIBQuery;
    XMLDocument1: TXMLDocument;
    IBQueryOrders: TIBQuery;
    IBQueryCustINN: TIBStringField;
    IBQueryCustCUSTOMERID: TIntegerField;
    IBQueryOrdersAGREEMENTNO: TIBStringField;
    IBQueryOrdersPRODDATE: TDateTimeField;
    IBQueryOrdersUSLUGI_DOSTAVKI: TWideMemoField;
    IBQueryOrdersORDERSTATNAME: TIBStringField;
    IBQueryOrdersRCOMMENT: TIBStringField;
    IBQueryOrdersPLAN_DATE: TDateTimeField;
    IBQueryOrdersAGREEMENTDATE: TDateTimeField;
    IBQueryOrdersQTY: TLargeintField;
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
    // ������� �������� ����
    with AddChild ('Data') do
    begin
      IBQueryCust.Open;
      while not IBQueryCust.Eof do
      begin
        // ������� �������� ����
        with AddChild ('Customer') do
        begin
        // �������� ��������
          ChildValues ['INN'] := IBQueryCust.FieldByName('INN').AsString;
          IBQueryOrders.Close;
          IBQueryOrders.ParamByName('customerid').Value :=  IBQueryCust.FieldByName('customerid').AsInteger;
          IBQueryOrders.Open;
          While not IBQueryOrders.Eof do
          begin
            with AddChild ('Agreement') do
            begin
              ChildValues ['AgreementNo'] := IBQueryOrders.FieldByName('agreementno').AsString;
              ChildValues ['Qty'] := IBQueryOrders.FieldByName('qty').AsString;
              ChildValues ['ProdDate'] := IBQueryOrders.FieldByName('ProdDate').AsString;
              ChildValues ['DeliveryService'] := IBQueryOrders.FieldByName('uslugi_dostavki').AsString;
              ChildValues ['Status'] := IBQueryOrders.FieldByName('orderstatname').AsString;
              ChildValues ['ReasonForTransfer'] := IBQueryOrders.FieldByName('rcomment').AsString;
              ChildValues ['DateOfTransfer'] := IBQueryOrders.FieldByName('plan_date').AsString;
              ChildValues ['AgreementDate'] := IBQueryOrders.FieldByName('AgreementDate').AsString;
            end; // with
            IBQueryOrders.Next;
          end; //while
          IBQueryOrders.Close;
        end; // with
        IBQueryCust.Next;
      end; // while
      IBQueryCust.Close;
    end;

  end; // with: �������

    // ����������
  XmlDocument1. SaveToFile ('CustomersOrders.xml');

    // ������ ��������, ��� ������ Xml �������������� �� ����������, �.�.
    // �� ����������� ������������� ��� ������ �� ���� ���������
end;

end.
