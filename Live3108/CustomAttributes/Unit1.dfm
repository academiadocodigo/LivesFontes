object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Usando um Custom Attribute'
  ClientHeight = 259
  ClientWidth = 442
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 61
    Top = 8
    Width = 31
    Height = 13
    Caption = 'Label1'
  end
  object Edit1: TEdit
    Left = 61
    Top = 27
    Width = 313
    Height = 21
    TabOrder = 0
    Text = 'Edit1'
  end
  object Button1: TButton
    Left = 80
    Top = 54
    Width = 270
    Height = 25
    Caption = 'Clique aqui para ver os campos'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 13
    Top = 96
    Width = 421
    Height = 155
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssBoth
    TabOrder = 2
  end
end
