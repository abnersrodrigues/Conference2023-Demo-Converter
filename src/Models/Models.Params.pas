unit Models.Params;

interface

uses
  System.SysUtils, System.Classes, System.IniFiles, Controllers.ConfigINI;

type
  TDMParams = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FPort:          string;
    FDllConexao32x: string;
    FDatabase:      string;
    FPassword:      string;
    FDllConexao64x: string;
    FUserName:      string;
    FServer:        string;
    FConfig:        TiniFile;

  public
    property Config:        TiniFile    read FConfig        write FConfig;
    property UserName:      string      read FUserName      write FUserName;
    property Password:      string      read FPassword      write FPassword;
    property Database:      string      read FDatabase      write FDatabase;
    property Server:        string      read FServer        write FServer;
    property DllConexao32x: string      read FDllConexao32x write FDllConexao32x;
    property DllConexao64x: string      read FDllConexao64x write FDllConexao64x;
    property Port:          string      read FPort          write FPort;

    function GetParamsMSSQL: Boolean;
  end;

var
  DMParams: TDMParams;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDMParams.DataModuleCreate(Sender: TObject);
begin
  Config := TConfigINI.New.LerIni;
end;

procedure TDMParams.DataModuleDestroy(Sender: TObject);
begin
  FreeAndNil(FConfig);
end;

function TDMParams.GetParamsMSSQL: Boolean;
Begin
  Result := true;
  Try
    with Self.Config do
      Begin
        UserName        := ReadString('MSSQL',     'User_Name',        '');
        Password        := ReadString('MSSQL',     'Password',         '');
        Database        := ReadString('MSSQL',     'Database',         '');;
        Server          := ReadString('MSSQL',     'Server',           '');
        DllConexao32x   := ReadString('MSSQL',     'CaminhoDll32x',    '');
        DllConexao64x   := ReadString('MSSQL',     'CaminhoDll64x',    '');
        Port            := ReadString('MSSQL',     'Port',             '');
      End;
  Except
    Result := false;
  End;
End;

end.
