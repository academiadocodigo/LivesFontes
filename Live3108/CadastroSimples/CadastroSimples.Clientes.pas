unit CadastroSimples.Clientes;

interface

type
  TClientes = class
  private
    FDataNascimento: TDateTime;
    FEstadoCivil: String;
    FCodigo: Integer;
    FSexo: String;
    FNome: String;
  public
    property Codigo : Integer read FCodigo write FCodigo;
    property Nome : String read FNome write FNome;
    property EstadoCivil : String read FEstadoCivil write FEstadoCivil;
    property Sexo : String read FSexo write FSexo;
    property DataNascimento : TDateTime read FDataNascimento write FDataNascimento;
  end;

implementation

end.
