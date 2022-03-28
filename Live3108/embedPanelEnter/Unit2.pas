unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Unit3, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DoEnterAsTab(var Msg: TMsg; var Handled: Boolean);
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
var F : TForm;
begin
  F := TForm3.Create(self);
  f.Parent := Panel1;
  f.Show;
end;

procedure TForm2.DoEnterAsTab(var Msg: TMsg; var Handled: Boolean);
begin
  if Msg.Message = WM_KEYDOWN then
  if Msg.wParam = VK_RETURN then Keybd_event(VK_TAB, 0, 0, 0);
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  Application.OnMessage := DoEnterAsTab;
end;

end.
