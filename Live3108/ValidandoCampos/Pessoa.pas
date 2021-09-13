unit Pessoa;

interface

uses
  RttiUtils;

type
  TPessoa = class
  private
    FIdade: Integer;
    FNome: String;
    procedure SetIdade(const Value: Integer);
    procedure SetNome(const Value: String);
  public
    [NotNull('O Campo Nome não pode ser Nulo')]
    [MinLength(6,'Nome não pode ter menos que 6 catactere')]
    property Nome : String read FNome write SetNome;
    property Idade:Integer read FIdade write SetIdade;
  end;

implementation

{ TPessoa }

procedure TPessoa.SetIdade(const Value: Integer);
begin
  FIdade := Value;
end;

procedure TPessoa.SetNome(const Value: String);
begin
  FNome := Value;
end;

end.
