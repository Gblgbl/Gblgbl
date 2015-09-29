object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #1057#1087#1080#1089#1086#1082' '#1041#1044
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
  object bOk: TButton
    Left = 364
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Ok'
    ModalResult = 1
    TabOrder = 0
  end
  object sgBD: TStringGrid
    Left = 0
    Top = 0
    Width = 345
    Height = 129
    ColCount = 2
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 1
    OnKeyDown = sgBDKeyDown
    ColWidths = (
      87
      278)
  end
end
