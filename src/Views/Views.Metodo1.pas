unit Views.Metodo1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.UITypes, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, ComObj,
  Vcl.FileCtrl, Controllers.Interfaces, Vcl.ExtCtrls, Vcl.ComCtrls, System.Threading;

type
  TViewExportacao = class(TForm)
    btn_old: TButton;
    edt_inicio: TLabeledEdit;
    edt_fim: TLabeledEdit;
    edt_tempo_execucao: TLabeledEdit;
    prgGerar: TProgressBar;
    btn_new: TButton;
    edt_tabela_origem: TLabeledEdit;
    procedure btn_oldClick(Sender: TObject);
    procedure btn_newClick(Sender: TObject);
  private
    procedure SetDataHoraFinal;
    procedure SetDataHoraInicial;
    procedure ZeraContador;
    function ExportaTxt: Boolean;
    function ExportaCvs: Boolean;

  public
    FDataInicial, FDataFinal: TDateTime;
  end;

function SelecionaCaminho(ANomeArquivo: String): String;

var
  ViewExportacao: TViewExportacao;
  FCaminho: String;

implementation

uses
  Models.Querys, Models.Conexao, Convert4Delphi, Controllers.Utils;

{$R *.dfm}

procedure TViewExportacao.btn_oldClick(Sender: TObject);
Begin
  ExportaTxt;
end;

function TViewExportacao.ExportaCvs:Boolean;
Var
  FConexao      : iConexao;
  FQryE         : iQuerys;

  Linha         : integer;
  Cont          : integer;
  Planilha      : variant;
begin
  // Inicio da rotina ..
  SetDataHoraInicial;

  FConexao := TModelConexao.New('MSSQL');
  FQryE := TModelQuerys.New(FConexao)
                       .Get('Select * from '+edt_tabela_origem.Text);

  CONT                := FQryE.DataSet.RecordCount;
  prgGerar.Max        := Cont;
  prgGerar.Position   := 0;

  FQryE.DataSet.Filtered := False;
  Linha := 2;

  Planilha            := CreateOleObject('Excel.Application');
  Planilha.Caption    := 'Relatorio';
  Planilha.visible    := False;
  Planilha.Workbooks.add(1);

  Planilha.cells[1,1]   := 'xcd_int_ncms';
  Planilha.cells[1,2]   := 'xncms';
  Planilha.cells[1,3]   := 'xdescricao';
  Planilha.cells[1,4]   := 'xcd_int_unidades';

  FQryE.DataSet.DisableControls;

  try
    while not FQryE.DataSet.Eof do
      begin
        Planilha.cells[linha,1]   := FQryE.DataSet.FieldByName('XCD_INT_NCMS').AsString;
        Planilha.cells[linha,2]   := FQryE.DataSet.FieldByName('XNCM').AsString;
        Planilha.cells[linha,3]   := FQryE.DataSet.FieldByName('XDESCRICAO').AsString;
        Planilha.cells[linha,4]   := FQryE.DataSet.FieldByName('XCD_INT_UNIDADES').AsString;

        LINHA :=linha+1;
        FQryE.DataSet.Next;
        prgGerar.Position :=  prgGerar.Position+1;
      end;

    Planilha.columns.autofit;
    Planilha.Visible:=true;

  finally
    FQryE.DataSet.EnableControls;
    Planilha:=Unassigned;
    SetDataHoraFinal;
    Result := true;
  end;
End;

function TViewExportacao.ExportaTxt:Boolean;
Var
  FConexao : iConexao;
  FQryE: iQuerys;
  FList : TStringList;
begin
  // Inicio da rotina ..
  SetDataHoraInicial;

  SelecionaCaminho('Exportacao.txt');

  FConexao := TModelConexao.New('MSSQL');
  FQryE := TModelQuerys.New(FConexao)
                       .Get('Select * from '+edt_tabela_origem.Text);

  prgGerar.Max        := FQryE.DataSet.RecordCount;
  prgGerar.Position   := 0;

  FQryE.DataSet.Filtered := False;

  FList := TStringList.Create;
  Try

    FList.Add('"xcd_int_ncms";"xncms";"xdescricao";"xcd_int_unidades"');

    FQryE.DataSet.DisableControls;

      while not FQryE.DataSet.Eof do
        begin
          FList.Add('"' + FQryE.DataSet.FieldByName('XCD_INT_NCMS').AsString + '"' +
                    '"' + FQryE.DataSet.FieldByName('XNCM').AsString + '"' +
                    '"' + FQryE.DataSet.FieldByName('XDESCRICAO').AsString + '"' +
                    '"' + FQryE.DataSet.FieldByName('XCD_INT_UNIDADES').AsString + '"');

          FQryE.DataSet.Next;
          prgGerar.Position :=  prgGerar.Position+1;
        end;
  Finally
    FList.SaveToFile(FCaminho);
    FreeAndNil(FList);
    FQryE.DataSet.EnableControls;
    SetDataHoraFinal;
    Result := true;
  End;
End;

procedure TViewExportacao.btn_newClick(Sender: TObject);
begin
  // Inicio da rotina ..
  TTask.Run(procedure
  Var
    FConexao : iConexao;
    FQryE: iQuerys;
  Begin
    ZeraContador;
    SetDataHoraInicial;
    SelecionaCaminho('Exportacao.txt');

    FConexao := TModelConexao.New('MSSQL');

    FQryE := TModelQuerys.New(FConexao)
                         .Get('Select * from '+edt_tabela_origem.Text);

    TConverter4Delphi.New.Exportar(TModelQuerys(FQryE).DataSet, FCaminho);

    TThread.Synchronize(TThread.CurrentThread, procedure
    Begin
      SetDataHoraFinal;
      // Fim.
    End);
  End);
end;

function SelecionaCaminho(ANomeArquivo: String): String;
Begin
  Try
    SelectDirectory('Selecione caminho da exportação', '', FCaminho);
    FCaminho := FCaminho + '\' + ANomeArquivo;

    if FileExists(FCaminho) then
      Begin
        if MessageDlg('Arquivo já existe e será apagado! '+ #13 +'Deseja prosseguir?', mtConfirmation,
          [mbYes, mbNo], 0) = mrYes then
          begin
             DeleteFile(FCaminho);
          end;
      End;

  Finally
    Result := FCaminho;
  End;
End;

procedure TViewExportacao.SetDataHoraInicial;
Begin
  FDataInicial := Now();
  edt_inicio.Text := FormatDateTime('HH:MM:SS', FDataInicial);
End;

procedure TViewExportacao.SetDataHoraFinal;
Begin
  FDataFinal := Now();
  edt_fim.Text := FormatDateTime('HH:MM:SS', FDataFinal);

  edt_tempo_execucao.Text := TimeToStr(FDataFinal-FDataInicial);
End;

procedure TViewExportacao.ZeraContador;
Begin
  edt_inicio.Text         := EmptyStr;
  edt_fim.Text            := EmptyStr;
  edt_tempo_execucao.Text := EmptyStr;
End;

end.
