unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Rtti;

type
  THintAttribute = class(TCustomAttribute)
  private
    FHint: string;
    procedure SetHint(const Value: string);
  published
    public
      constructor Create(Hint: string);
      property Hint: string read FHint write SetHint;
  end;

  TForm1 = class(TForm)
    [THintAttribute('Eu sou o Edit 1')]
    Edit1: TEdit;

    [THintAttribute('Eu sou o Label que diz o que o Edit 1 é')]
    Label1: TLabel;

    [THintAttribute('Sou um botão, se clicar em mim listo os campos')]
    Button1: TButton;

    [THintAttribute('Em mim você ve os custom attributes')]
    Memo1: TMemo;

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

procedure TForm1.Button1Click(Sender: TObject);
var
  contexto : TRttiContext;
  campo : TRttiField;
  tipo: TRttiType;
  atributo: TCustomAttribute;
begin
  Memo1.Clear;
  contexto := TRttiContext.Create;
  try
    tipo := contexto.GetType(self.ClassInfo);
    for campo in tipo.GetFields do
       for atributo in campo.GetAttributes do
          if (atributo is THintAttribute) then
              Memo1.Lines.Add('Campo: ' + campo.Name + ' Informação: '+ (atributo as THintAttribute).Hint);

  finally
    contexto.Free;
  end;
end;

{ THintAttribute }

constructor THintAttribute.Create(Hint: string);
begin
  inherited Create;
  FHint:= Hint;
end;

procedure THintAttribute.SetHint(const Value: string);
begin
  FHint := Value;
end;

end.
