unit DAO;

interface

type
  iDao = Interface
    procedure Salvar;
  End;

  TDAO<T : Class> = class(TInterfacedObject, iDao)
    private
      FParent : T;
    public
      constructor Create(Parent : T);
      destructor Destroy; override;
      class function New(Parent : T) : iDao;
      procedure Salvar;
  end;

implementation

uses
  RttiUtils;

constructor TDAO<T>.Create(Parent : T);
begin
  FParent := Parent;
end;

destructor TDAO<T>.Destroy;
begin

  inherited;
end;

class function TDAO<T>.New(Parent : T) : iDao;
begin
  Result := Self.Create(Parent);
end;

procedure TDAO<T>.Salvar;
begin
  TRttiUtils.ValidarCampo(FParent);
end;

end.
