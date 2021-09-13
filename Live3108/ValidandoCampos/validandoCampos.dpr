program validandoCampos;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Pessoa in 'Pessoa.pas',
  DAO in 'DAO.pas',
  RttiUtils in 'RttiUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
