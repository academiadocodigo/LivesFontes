unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, RttiUtils, Validacoes;

type
  TForm4 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FValidacao : TValidacoes;
  public
    { Public declarations }
    procedure ExibirMensagem(aValue : String);
    procedure Exibir(aVAlue : String);
    procedure ExibirResultado(aValue : String);
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

{ TForm4 }

procedure TForm4.Button1Click(Sender: TObject);
begin
//  TRttiUtils.ExecutarMetodo<TForm4>(self, Edit1.Text,Edit2.Text);
  FValidacao.Validar(Edit1.Text);
end;

procedure TForm4.Exibir(aVAlue: String);
begin
  ShowMessage('Exibir ' +  aValue);
end;

procedure TForm4.ExibirMensagem(aValue: String);
begin
  ShowMessage('ExibirMensagem ' +  aValue);
end;

procedure TForm4.ExibirResultado(aValue: String);
begin
  Memo1.Lines.Add(aValue);
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
  FValidacao := TValidacoes.Create;
  FValidacao
    .AddValidacao('AliqICMS')
    .AddValidacao('CFOP')
    .AddValidacao('NCM')
  .ResultDisplay(ExibirResultado);
end;

end.
