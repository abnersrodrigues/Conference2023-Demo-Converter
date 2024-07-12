unit Controllers.Interfaces;

interface

uses
  Data.DB, System.IniFiles, FireDAC.Comp.Client;

Type
  iConexao = interface
    function Conexao : TCustomConnection;
  end;

  iConfigINI = interface
    function LerIni: TiniFile;
  end;

  iQuerys = interface
    function Get(ASql: String): iQuerys;
    function DataSet : TFDQuery;
  end;

implementation

end.
