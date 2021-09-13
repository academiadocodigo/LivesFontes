unit Validacoes;

interface

uses
  System.Generics.Collections, System.SysUtils, RttiUtils;

type
  TValidacoes = class
  private
    FList : TList<String>;
    FResult : TProc<String>;
  public
    constructor Create;
    destructor Destroy; override;

    function AddValidacao(aValue : String) : TValidacoes;
    function ResultDisplay(aVAlue : TProc<String>) : TValidacoes;
    procedure Validar(aValue : String);

    // validar de produto nfe
    procedure CFOP(aValue : String);
    procedure AliqICMS(aValue : String);
    procedure NCM(aValue : String);
  end;

implementation

{ TValidacoes }

function TValidacoes.AddValidacao(aValue: String): TValidacoes;
begin
  Result := Self;
  FList.Add(aValue);
end;

procedure TValidacoes.AliqICMS(aValue: String);
begin
  FResult('OK ICMS - ' + aValue);
end;

procedure TValidacoes.CFOP(aValue: String);
begin
  if aValue = '' then
    FResult('ERROR CFOP - ' + aValue)
  else
    FResult('OK CFOP - ' + aValue);
end;

constructor TValidacoes.Create;
begin
  FList := TList<String>.Create;
end;

destructor TValidacoes.Destroy;
begin
  FList.Free;
  inherited;
end;

procedure TValidacoes.NCM(aValue: String);
begin
  FResult('OK NCM - ' + aValue);
end;

function TValidacoes.ResultDisplay(aVAlue: TProc<String>): TValidacoes;
begin
  Result := Self;
  FResult := aVAlue;
end;

procedure TValidacoes.Validar(aValue: String);
var
  I: Integer;
begin
  for I := 0 to Pred(FList.Count) do
    TRttiUtils.ExecutarMetodo<TValidacoes>(Self, FList[I], aValue);
end;

end.
