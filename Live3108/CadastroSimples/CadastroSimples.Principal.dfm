object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 242
  ClientWidth = 436
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 53
    Width = 55
    Height = 13
    Caption = 'Estado Civil'
  end
  object Label2: TLabel
    Left = 319
    Top = 53
    Width = 81
    Height = 13
    Caption = 'Data Nascimento'
  end
  object Label3: TLabel
    Left = 8
    Top = 8
    Width = 33
    Height = 13
    Caption = 'Codigo'
  end
  object Label4: TLabel
    Left = 72
    Top = 8
    Width = 27
    Height = 13
    Caption = 'Nome'
  end
  object CampoEstadoCivil: TComboBox
    Left = 8
    Top = 72
    Width = 97
    Height = 21
    TabOrder = 0
    Items.Strings = (
      'Solteiro(a)'
      'Casado(a)'
      'Vi'#250'vo(a)'
      'Divorciado(a)')
  end
  object CampoSexo: TRadioGroup
    Left = 128
    Top = 53
    Width = 185
    Height = 40
    Caption = 'Sexo'
    Columns = 2
    Items.Strings = (
      'Masculino'
      'Feminino')
    TabOrder = 1
  end
  object CampoDataNascimento: TDateTimePicker
    Left = 319
    Top = 72
    Width = 106
    Height = 21
    Date = 44438.000000000000000000
    Time = 0.955457685187866400
    TabOrder = 2
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 101
    Width = 417
    Height = 133
    DataSource = DataSource1
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object CampoCodigo: TEdit
    Left = 8
    Top = 26
    Width = 55
    Height = 21
    TabOrder = 4
  end
  object CampoNome: TEdit
    Left = 69
    Top = 26
    Width = 356
    Height = 21
    TabOrder = 5
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 328
    Top = 184
  end
  object ClientDataSet1: TClientDataSet
    PersistDataPacket.Data = {
      330000009619E0BD0100000018000000010000000000030000003300044E6F6D
      6501004900000001000557494454480200020032000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Nome'
        DataType = ftString
        Size = 50
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterScroll = ClientDataSet1AfterScroll
    Left = 256
    Top = 152
  end
end
