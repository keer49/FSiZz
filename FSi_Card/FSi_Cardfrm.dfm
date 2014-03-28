object Form1: TForm1
  Left = 313
  Top = 248
  Width = 870
  Height = 640
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnOpen: TButton
    Left = 153
    Top = 39
    Width = 75
    Height = 25
    Caption = #25171#24320#35774#22791
    TabOrder = 0
    OnClick = btnOpenClick
  end
  object btnClose: TButton
    Left = 262
    Top = 39
    Width = 75
    Height = 25
    Caption = #20851#38381#35774#22791
    TabOrder = 1
    OnClick = btnCloseClick
  end
  object btnRead: TButton
    Left = 157
    Top = 92
    Width = 75
    Height = 25
    Caption = #35835#21345#20869#23481
    TabOrder = 2
    OnClick = btnReadClick
  end
  object Memo1: TMemo
    Left = 152
    Top = 194
    Width = 185
    Height = 89
    Lines.Strings = (
      'Memo1')
    TabOrder = 3
  end
end
