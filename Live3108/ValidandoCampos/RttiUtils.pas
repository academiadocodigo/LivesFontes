unit RttiUtils;

interface

type
  NotNull = class(TCustomAttribute)
  private
    FMensagem: String;
    procedure SetMensagem(const Value: String);
  public
    constructor Create(aMsg : String);
    property Mensagem : String read FMensagem write SetMensagem;
  end;

  MinLength = class(TCustomAttribute)
  private
    FLength: Integer;
    FMensagem: String;
    procedure SetLength(const Value: Integer);
    procedure SetMensagem(const Value: String);
  public
    constructor Create(aLength : Integer; Msg : String);
    property Length : Integer read FLength write SetLength;
    property Mensagem : String read FMensagem write SetMensagem;
  end;

  TRttiUtils = class
  private
  public
    class procedure ValidarCampo(aObject : TObject);
  end;

implementation

uses
  System.Rtti, System.SysUtils;

{ TRttiUtils }

class procedure TRttiUtils.ValidarCampo(aObject: TObject);
var
  contexto : TRttiContext;
  tipo : TRttiType;
  propriedade : TRttiProperty;
  atributo : TCustomAttribute;
begin
  contexto := TRttiContext.Create;
  try
    tipo := contexto.GetType(aObject.ClassType);

    for propriedade in tipo.GetProperties do
      for atributo in propriedade.GetAttributes  do
      begin
        if atributo is NotNull then
        begin
          case propriedade.GetValue(aObject).TypeInfo.Kind of
            tkString : begin
              if propriedade.GetValue(aObject).AsString.Trim.IsEmpty then
                raise Exception.Create(NotNull(atributo).Mensagem);
            end;
            tkInteger : begin
              if not propriedade.GetValue(aObject).AsInteger in [0..9] then
                raise Exception.Create(NotNull(atributo).Mensagem);
            end;
          end;
        end;

        if atributo is MinLength then
        begin
          if Length(propriedade.GetValue(aObject).AsString)<MinLength(atributo).FLength then
            raise Exception.Create(MinLength(atributo).Mensagem);
        end;
      end;
  finally

  end;
end;

{ NotNull }

constructor NotNull.Create(aMsg: String);
begin
  FMensagem := aMsg;
end;

procedure NotNull.SetMensagem(const Value: String);
begin
  FMensagem := Value;
end;

{ MinLength }

constructor MinLength.Create(aLength: Integer; Msg: String);
begin
  FLength := aLength;
  FMensagem := Msg;
end;

procedure MinLength.SetLength(const Value: Integer);
begin
  FLength := Value;
end;

procedure MinLength.SetMensagem(const Value: String);
begin
  FMensagem := Value;
end;

end.
