object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 206
  ClientWidth = 304
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object EdtNome: TLabeledEdit
    Left = 8
    Top = 24
    Width = 161
    Height = 21
    EditLabel.Width = 27
    EditLabel.Height = 13
    EditLabel.Caption = 'Nome'
    TabOrder = 0
  end
  object edtSobreNome: TLabeledEdit
    Left = 175
    Top = 24
    Width = 121
    Height = 21
    EditLabel.Width = 58
    EditLabel.Height = 13
    EditLabel.Caption = 'Sobre Nome'
    TabOrder = 1
  end
  object Memo1: TMemo
    Left = 8
    Top = 51
    Width = 288
    Height = 118
    TabOrder = 2
  end
  object Button1: TButton
    Left = 221
    Top = 175
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 3
    OnClick = Button1Click
  end
end
