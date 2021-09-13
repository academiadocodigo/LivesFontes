unit CadastroSimples.ClientesDTO;

interface

uses
  CadastroSimples.Clientes;

type
  iClientesDTO = interface
    function Codigo(Value : Integer) : iClientesDTO;
    function Nome(Value : String): iClientesDTO;
    function EstadoCivil(Value : String): iClientesDTO;
    function Sexo(Value : String): iClientesDTO;
    function DataNascimento(Value : TDateTime): iClientesDTO;
    function Build : TClientes;
  end;

  TClientesDTO = class(TInterfacedObject, iClientesDTO)
    private
      FEntity : TClientes;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iClientesDTO;
      function Codigo(Value : Integer) : iClientesDTO;
      function Nome(Value : String): iClientesDTO;
      function EstadoCivil(Value : String): iClientesDTO;
      function Sexo(Value : String): iClientesDTO;
      function DataNascimento(Value : TDateTime): iClientesDTO;
      function Build : TClientes;
  end;

implementation

function TClientesDTO.Build: TClientes;
begin
  Result := FEntity;
end;

function TClientesDTO.Codigo(Value: Integer): iClientesDTO;
begin
  Result := Self;
  FEntity.Codigo := Value;
end;

constructor TClientesDTO.Create;
begin
  FEntity := TClientes.Create;
end;

function TClientesDTO.DataNascimento(Value: TDateTime): iClientesDTO;
begin
  Result := Self;
  FEntity.DataNascimento := Value;
end;

destructor TClientesDTO.Destroy;
begin
  FEntity.Free;
  inherited;
end;

function TClientesDTO.EstadoCivil(Value: String): iClientesDTO;
begin
  Result := Self;
  FEntity.EstadoCivil := Value;
end;

class function TClientesDTO.New : iClientesDTO;
begin
  Result := Self.Create;
end;

function TClientesDTO.Nome(Value: String): iClientesDTO;
begin
  Result := Self;
  FEntity.Nome := Value;
end;

function TClientesDTO.Sexo(Value: String): iClientesDTO;
begin
  Result := Self;
  FEntity.Sexo := Value;
end;

end.
