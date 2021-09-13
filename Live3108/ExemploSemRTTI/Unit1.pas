unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Rtti;

type
  Descricao = class(TCustomAttribute)
  private
    FDescricao: String;
  public
    constructor Create(aValue: String);
    property Descricao: String read FDescricao write FDescricao;
  end;

  TForm1 = class(TForm)
    [Descricao('Edit para nome')]
    EdtNome: TLabeledEdit;
    [Descricao('Edit para sobre nome')]
    edtSobreNome: TLabeledEdit;
    [Descricao('Memo para descrição das informações')]
    Memo1: TMemo;
    [Descricao('Botão para visualizar os dados')]
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


{ DescricaoAttribute }

constructor Descricao.Create(aValue: String);
begin
  FDescricao := aValue;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  contexto: TRttiContext;
  campo : TRttiField;
  tipo: TRttiType;
  atributo: TCustomAttribute;
begin
  Memo1.Clear;
  contexto := TRttiContext.Create;
  try
    tipo := contexto.GetType(self.ClassType);
    for campo in tipo.GetFields do
      for atributo in campo.GetAttributes do
        if (atributo is Descricao) then
          Memo1.Lines.Add('Campo: ' + campo.Name + ' Informação: ' + (atributo as Descricao).Descricao);
  finally
    contexto.Free;
  end;
end;

end.
