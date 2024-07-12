unit Controllers.ConfigINI;

interface

Uses
  System.SysUtils, Vcl.Dialogs, System.IniFiles, Vcl.Forms, Controllers.Interfaces;

Type

  TConfigINI = class(TInterfacedObject, iConfigINI)
    private
      function PastaDll: Boolean;
      function GravarIni: Boolean;
    public
      Constructor Create;
      Destructor Destroy; Override;
      class function New: iConfigINI;
      function LerIni: TiniFile;
  end;

implementation

uses
  System.Classes;

Constructor TConfigINI.Create;
begin
  PastaDll;
  if not FileExists(ExtractFilePath(ParamStr(0))+'Config.ini') then
    GravarIni;
end;

function TConfigINI.PastaDll:Boolean;
Begin
  Result := true;
  {$IFDEF WIN32}
    if not DirectoryExists(ExtractFilePath(ParamStr(0)) + '\dll32x') then
      Begin
        CreateDir(ExtractFilePath(ParamStr(0)) + '\dll32x');
      End;
  {$ENDIF$}

  {$IFDEF WIN64}
    if not DirectoryExists(ExtractFilePath(ParamStr(0)) + '\dll64x') then
      Begin
        CreateDir(ExtractFilePath(ParamStr(0)) + '\dll64x');
      End;
  {$ENDIF}
End;

destructor TConfigINI.Destroy;
begin

  inherited;
end;

class function TConfigINI.New: iConfigINI;
begin
  Result := Self.Create;
end;

function TConfigINI.LerIni: TiniFile;
Var
  IniFile : String;
Begin
  try
    IniFile := ExtractFilePath(ParamStr(0))+'Config.ini';
    Result := TIniFile.Create(IniFile);
  Except
    Result := nil;
  end;
End;

function TConfigINI.GravarIni: Boolean;
Var
  IniFile     : String;
  xStringList : TStringList;
Begin
  IniFile := ExtractFilePath(ParamStr(0))+'Config.ini';
  xStringList := TStringList.Create;
  try
    With xStringList do
      Begin
        Add('[MySQL]');
        Add('Database=');
        Add('User_Name=');
        Add('Password=');
        Add('Port=');
        Add('Server=');
        Add('CaminhoDll32x=');
        Add('CaminhoDll64x=');
        Add(' ');
        Add('[PG]');
        Add('Database=');
        Add('User_Name=');
        Add('Password=');
        Add('Port=');
        Add('Server=');
        Add('CaminhoDll32x=');
        Add('CaminhoDll64x=');
        Add(' ');
        Add('[MSSQL]');
        Add('Database=');
        Add('User_Name=');
        Add('Password=');
        Add('Port=');
        Add('Server=');
        Add('CaminhoDll32x=');
        Add('CaminhoDll64x=');
      End;
    xStringList.SaveToFile(IniFile);
  finally
    xStringList.Free;
    Result := true;
  end;

End;

end.
