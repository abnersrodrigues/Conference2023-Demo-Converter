object ViewExportacao: TViewExportacao
  Left = 0
  Top = 0
  Caption = 'ViewExportacao'
  ClientHeight = 312
  ClientWidth = 544
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btn_old: TButton
    Left = 32
    Top = 144
    Width = 75
    Height = 25
    Caption = 'btn_old'
    TabOrder = 0
    OnClick = btn_oldClick
  end
  object edt_inicio: TLabeledEdit
    Left = 368
    Top = 58
    Width = 121
    Height = 21
    EditLabel.Width = 29
    EditLabel.Height = 13
    EditLabel.Caption = 'Inicio:'
    Enabled = False
    TabOrder = 1
  end
  object edt_fim: TLabeledEdit
    Left = 368
    Top = 114
    Width = 121
    Height = 21
    EditLabel.Width = 20
    EditLabel.Height = 13
    EditLabel.Caption = 'Fim:'
    Enabled = False
    TabOrder = 2
  end
  object edt_tempo_execucao: TLabeledEdit
    Left = 368
    Top = 170
    Width = 121
    Height = 27
    EditLabel.Width = 96
    EditLabel.Height = 13
    EditLabel.Caption = 'Tempo de Execu'#231#227'o'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
  object prgGerar: TProgressBar
    Left = 113
    Top = 149
    Width = 150
    Height = 17
    TabOrder = 4
  end
  object btn_new: TButton
    Left = 32
    Top = 196
    Width = 75
    Height = 25
    Caption = 'btn_new'
    TabOrder = 5
    OnClick = btn_newClick
  end
  object edt_tabela_origem: TLabeledEdit
    Left = 32
    Top = 35
    Width = 217
    Height = 27
    EditLabel.Width = 69
    EditLabel.Height = 13
    EditLabel.Caption = 'Tabela Origem'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
  end
end
