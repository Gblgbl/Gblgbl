object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 201
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 256
    Top = 152
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
  end
  object IBDatabase1: TIBDatabase
    Connected = True
    DatabaseName = '192.168.168.2:d:\DB2014\odin2015_1.gdb'
    Params.Strings = (
      'user_name=q')
    ServerType = 'IBServer'
    Left = 32
    Top = 32
  end
  object IBTransaction1: TIBTransaction
    Active = True
    DefaultDatabase = IBDatabase1
    Left = 32
    Top = 80
  end
  object IBQueryCust: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select distinct co.inn, cu.customerid'
      'from customers cu'
      'join contragents co on co.contragid = cu.contragid'
      'join orders o on o.customerid = cu.customerid'
      'left join orderitems oi on oi.orderid = o.orderid'
      'where coalesce(co.inn, '#39#39') <> '#39#39' and cu.deleted = 0')
    Left = 32
    Top = 136
    object IBQueryCustINN: TIBStringField
      FieldName = 'INN'
      Origin = '"CONTRAGENTS"."INN"'
      Size = 32
    end
    object IBQueryCustCUSTOMERID: TIntegerField
      FieldName = 'CUSTOMERID'
      Origin = '"CUSTOMERS"."CUSTOMERID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object XMLDocument1: TXMLDocument
    Options = [doNodeAutoCreate, doNodeAutoIndent, doAttrNull, doAutoPrefix, doNamespaceDecl]
    Left = 256
    Top = 72
  end
  object IBQueryOrders: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select o.agreementno,'
      'o.proddate, list(distinct eva.rname,'#39'; '#39') as uslugi_dostavki,'
      'os.name orderstatname, dd.rcomment,'
      'dd.plan_date, o.agreementdate, sum(oi.qty) as qty'
      'from orders o'
      'left join orderitems oi on oi.orderid = o.orderid'
      'join models m on m.orderitemsid = oi.orderitemsid'
      'join modelitems mi on mi.modelid = m.modelid'
      
        'left join orderecdetail oe on oe.orderid = o.orderid and oe.ecit' +
        'emid = 84 and oe.partid =  203'
      'join ec_values eva on eva.ecvalueid = oe.ecvalueid'
      'left join orderstates os on os.orderstateid = o.orderstateid'
      
        'left join dirdates dd on dd.orderid = o.orderid and dd.dirdatesi' +
        'd ='
      '    ( select max(dd2.dirdatesid)'
      '      from dirdates dd2'
      '      where dd2.orderid = o.orderid'
      '      and dd2.diractionsid = 37 -- ID '#1101#1090#1072#1087#1072' "'#1055#1077#1088#1077#1085#1086#1089' '#1076#1086#1089#1090#1072#1074#1082#1080'"'
      '      and coalesce(dd2.rcomment,'#39#39') not containing '#39'ANTOR'#39
      '      )'
      'where o.deleted = 0 and o.customerid =:customerid'
      'group by 1,2,4,5,6,7')
    Left = 112
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'customerid'
        ParamType = ptUnknown
      end>
    object IBQueryOrdersAGREEMENTNO: TIBStringField
      FieldName = 'AGREEMENTNO'
      Origin = '"ORDERS"."AGREEMENTNO"'
      Size = 32
    end
    object IBQueryOrdersPRODDATE: TDateTimeField
      FieldName = 'PRODDATE'
      Origin = '"ORDERS"."PRODDATE"'
    end
    object IBQueryOrdersUSLUGI_DOSTAVKI: TWideMemoField
      FieldName = 'USLUGI_DOSTAVKI'
      ProviderFlags = []
      BlobType = ftWideMemo
      Size = 8
    end
    object IBQueryOrdersORDERSTATNAME: TIBStringField
      FieldName = 'ORDERSTATNAME'
      ProviderFlags = []
      Size = 256
    end
    object IBQueryOrdersRCOMMENT: TIBStringField
      FieldName = 'RCOMMENT'
      Origin = '"DIRDATES"."RCOMMENT"'
      Size = 256
    end
    object IBQueryOrdersPLAN_DATE: TDateTimeField
      FieldName = 'PLAN_DATE'
      Origin = '"DIRDATES"."PLAN_DATE"'
    end
    object IBQueryOrdersAGREEMENTDATE: TDateTimeField
      FieldName = 'AGREEMENTDATE'
      Origin = '"ORDERS"."AGREEMENTDATE"'
    end
    object IBQueryOrdersQTY: TLargeintField
      FieldName = 'QTY'
      ProviderFlags = []
    end
  end
end
