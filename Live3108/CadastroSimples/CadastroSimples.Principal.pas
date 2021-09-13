unit CadastroSimples.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Datasnap.DBClient,Rtti,
  System.Generics.Collections, CadastroSimples.Clientes,CadastroSimples.ClientesDTO;

type
  TForm2 = class(TForm)
    CampoEstadoCivil: TComboBox;
    Label1: TLabel;
    CampoSexo: TRadioGroup;
    CampoDataNascimento: TDateTimePicker;
    Label2: TLabel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ClientDataSet1: TClientDataSet;
    CampoCodigo: TEdit;
    CampoNome: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ClientDataSet1AfterScroll(DataSet: TDataSet);
  private
    FListaClientes: TObjectList<TClientes>;

    procedure PreencherDataSet;
    procedure PreencheCampos(Clientes : TClientes);
    function AddCliente(aValues: array of variant): TClientes;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

{ TForm2 }

function TForm2.AddCliente(aValues: array of variant): TClientes;
begin
  Result := TClientes.Create;
  Result.Codigo := aValues[0];
  Result.Nome := aValues[1];
  Result.EstadoCivil := aValues[2];
  Result.Sexo := aVAlues[3];
  Result.DataNascimento := StrToDate(aValues[4]);
end;

procedure TForm2.ClientDataSet1AfterScroll(DataSet: TDataSet);
begin
  PreencheCampos(FListaClientes[Pred(ClientDataSet1.RecNo)]);
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  FListaClientes := TObjectList<TClientes>.Create;
  FListaClientes.Add(AddCliente([1,'Alessandro Medeiros','Casado(a)','Masculino','22/01/1985']));
  FListaClientes.Add(AddCliente([2,'Aline Medeiros','Casado(a)','Feminino','22/01/1995']));
  FListaClientes.Add(AddCliente([3,'Kauan Medeiros','Solteiro(a)','Masculino','22/01/2004']));
  FListaClientes.Add(AddCliente([4,'Kelvin Medeiros','Solteiro(a)','Masculino','22/01/2010']));

  PreencherDataSet;
end;

procedure TForm2.FormDestroy(Sender: TObject);
begin
  FListaClientes.Free;
end;

procedure TForm2.PreencheCampos(Clientes: TClientes);
var
  Contexto: TRttiContext;
  Tipo: TRttiType;
  Propriedade: TRttiProperty;
  Valor: variant;
  Componente: TComponent;
begin
// Cria o contexto do RTTI
  Contexto := TRttiContext.Create;

  // Obtém as informações de RTTI da classe TFuncionario
  Tipo := Contexto.GetType(TClientes.ClassInfo);

  try
    // Faz uma iteração nas propriedades do objeto
    for Propriedade in Tipo.GetProperties do
    begin
      // Obtém o valor da propriedade
      Valor := Propriedade.GetValue(Clientes).AsVariant;

      // Encontra o componente relacionado, como, por exemplo, "CampoNome"
      Componente := FindComponent('Campo'+Propriedade.Name);

      // (Código e nome)
      // Testa se o componente é da classe "TEdit" para acessar a propriedade "Text"
      if Componente is TEdit then
        (Componente as TEdit).Text := Valor;

      // (Estado Civil)
      // Testa se o componente é da classe "TComboBox" para acessar a propriedade "ItemIndex"
      if Componente is TComboBox then
        (Componente as TComboBox).ItemIndex := (Componente as TComboBox).Items.IndexOf(Valor);

      // (Sexo)
      // Testa se o componente é da classe "TRadioGroup" para acessar a propriedade "ItemIndex"
      if Componente is TRadioGroup then
        (Componente as TRadioGroup).ItemIndex := (Componente as TRadioGroup).Items.IndexOf(Valor);

      // (Plano de Saúde)
      // Testa se o componente é da classe "TCheckBox" para acessar a propriedade "Checked"
      if Componente is TCheckBox then
        (Componente as TCheckBox).Checked := Valor;

      // (Data de Nascimento)
      // Testa se o componente é da classe "TDateTimePicker" para acessar a propriedade "Date"
      if Componente is TDateTimePicker then
        (Componente as TDateTimePicker).Date := Valor;
    end;
  finally
    Contexto.Free;
  end;
end;

procedure TForm2.PreencherDataSet;
var
  Contexto: TRttiContext;
  Tipo: TRttiType;
  PropriedadeNome : TRttiProperty;
  Clientes: TClientes;
begin
  Contexto:= TRttiContext.Create;
  try
    Tipo := Contexto.GetType(TClientes.ClassInfo);

    PropriedadeNome := Tipo.GetProperty('Nome');

    for Clientes in FListaClientes do
      ClientDataSet1.AppendRecord([PropriedadeNome.GetValue(Clientes).AsString]);

    ClientDataSet1.First;
  finally
    Contexto.Free;
  end;
end;

initialization
  ReportMemoryLeaksOnShutdown := True;

end.
