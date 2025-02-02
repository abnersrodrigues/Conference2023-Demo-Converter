program Conferencia2023;

uses
  Vcl.Forms,
  Models.Conexao in 'src\Models\Models.Conexao.pas',
  Models.Querys in 'src\Models\Models.Querys.pas',
  Views.Metodo2 in 'src\Views\Views.Metodo2.pas' {ViewImportacao},
  Controllers.ConfigINI in 'src\Controllers\Controllers.ConfigINI.pas',
  Controllers.Interfaces in 'src\Controllers\Controllers.Interfaces.pas',
  Controllers.Criptografia in 'src\Controllers\Controllers.Criptografia.pas',
  Models.Params in 'src\Models\Models.Params.pas' {DMParams: TDataModule},
  Convert4Delphi.Component.BatchMove in '..\Convert4Delphi\src\Convert4Delphi.Component.BatchMove.pas',
  Convert4Delphi.Component.BatchMoveDataSetReader in '..\Convert4Delphi\src\Convert4Delphi.Component.BatchMoveDataSetReader.pas',
  Convert4Delphi.Component.BatchMoveDataSetWriter in '..\Convert4Delphi\src\Convert4Delphi.Component.BatchMoveDataSetWriter.pas',
  Convert4Delphi.Component.BatchMoveSQLReader in '..\Convert4Delphi\src\Convert4Delphi.Component.BatchMoveSQLReader.pas',
  Convert4Delphi.Component.BatchMoveSQLWriter in '..\Convert4Delphi\src\Convert4Delphi.Component.BatchMoveSQLWriter.pas',
  Convert4Delphi.Component.BatchMoveTextReader in '..\Convert4Delphi\src\Convert4Delphi.Component.BatchMoveTextReader.pas',
  Convert4Delphi.Component.BatchMoveTextWriter in '..\Convert4Delphi\src\Convert4Delphi.Component.BatchMoveTextWriter.pas',
  Convert4Delphi.Component.GUIxWaitCursor in '..\Convert4Delphi\src\Convert4Delphi.Component.GUIxWaitCursor.pas',
  Convert4Delphi.Converter in '..\Convert4Delphi\src\Convert4Delphi.Converter.pas',
  Convert4Delphi.Exportar in '..\Convert4Delphi\src\Convert4Delphi.Exportar.pas',
  Convert4Delphi.Importar in '..\Convert4Delphi\src\Convert4Delphi.Importar.pas',
  Convert4Delphi.Interfaces.Components in '..\Convert4Delphi\src\Convert4Delphi.Interfaces.Components.pas',
  Convert4Delphi.Interfaces in '..\Convert4Delphi\src\Convert4Delphi.Interfaces.pas',
  Convert4Delphi in '..\Convert4Delphi\src\Convert4Delphi.pas',
  Views.Metodo1 in 'src\Views\Views.Metodo1.pas' {ViewExportacao},
  Views.Metodo3 in 'src\Views\Views.Metodo3.pas' {ViewConversao},
  Controllers.Utils in 'src\Controllers\Controllers.Utils.pas',
  Views.Principal in 'src\Views\Views.Principal.pas' {ViewPrincipal};

{$R *.res}

begin
    ReportMemoryLeaksOnShutdown := true;

    Application.Initialize;
    Application.MainFormOnTaskbar := True;
    Application.CreateForm(TViewPrincipal, ViewPrincipal);
  Application.CreateForm(TViewConversao, ViewConversao);
  Application.CreateForm(TViewImportacao, ViewImportacao);
  Application.CreateForm(TViewExportacao, ViewExportacao);
  Application.CreateForm(TDMParams, DMParams);
  Application.Run;
end.
