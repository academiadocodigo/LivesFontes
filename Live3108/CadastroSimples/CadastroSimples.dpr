program CadastroSimples;

uses
  Vcl.Forms,
  CadastroSimples.Principal in 'CadastroSimples.Principal.pas' {Form2},
  CadastroSimples.Clientes in 'CadastroSimples.Clientes.pas',
  CadastroSimples.ClientesDTO in 'CadastroSimples.ClientesDTO.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
