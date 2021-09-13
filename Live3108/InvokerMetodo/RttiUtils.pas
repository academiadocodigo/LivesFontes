unit RttiUtils;

interface

uses
  System.Rtti;

type
  TRttiUtils = class
  private
  public
    class procedure ExecutarMetodo<T:Class>(Sender:T;ametodo:string;aparam:string);
  end;

implementation

{ TRttiUtils }

class procedure TRttiUtils.ExecutarMetodo<T>(Sender: T; ametodo,
  aparam: string);
var
  contexto : TRttiContext;
  tipo : TRttiType;
  metodo:TRttiMethod;
  lParams : Array of TValue;
begin
  contexto := TRttiContext.Create;
  try
    tipo := contexto.GetType(Sender.ClassType);

    metodo:=tipo.GetMethod(ametodo);

    SetLength(lParams, 1);
    lParams[0] := aParam;
    metodo.Invoke(Sender, lParams);
  finally
    contexto.Free;
  end;
end;

end.
