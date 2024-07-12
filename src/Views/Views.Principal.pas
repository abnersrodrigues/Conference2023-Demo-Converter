unit Views.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TViewPrincipal = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewPrincipal: TViewPrincipal;

implementation

uses
  Views.Metodo1, Views.Metodo2, Views.Metodo3;

{$R *.dfm}

procedure TViewPrincipal.Button1Click(Sender: TObject);
begin
  ViewImportacao.ShowModal;
end;

procedure TViewPrincipal.Button2Click(Sender: TObject);
begin
  ViewExportacao.ShowModal;
end;

procedure TViewPrincipal.Button3Click(Sender: TObject);
begin
  ViewConversao.ShowModal;
end;

end.
