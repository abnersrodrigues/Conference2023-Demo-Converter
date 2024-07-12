object ViewConversao: TViewConversao
  Left = 0
  Top = 0
  Caption = 'ViewConversao'
  ClientHeight = 410
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 32
    Top = 155
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object edt_inicio: TLabeledEdit
    Left = 312
    Top = 40
    Width = 121
    Height = 21
    EditLabel.Width = 29
    EditLabel.Height = 13
    EditLabel.Caption = 'Inicio:'
    Enabled = False
    TabOrder = 1
  end
  object edt_fim: TLabeledEdit
    Left = 312
    Top = 96
    Width = 121
    Height = 21
    EditLabel.Width = 20
    EditLabel.Height = 13
    EditLabel.Caption = 'Fim:'
    Enabled = False
    TabOrder = 2
  end
  object edt_tempo_execucao: TLabeledEdit
    Left = 312
    Top = 152
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
    TabOrder = 4
  end
  object edt_tabela_destino: TLabeledEdit
    Left = 32
    Top = 91
    Width = 217
    Height = 27
    EditLabel.Width = 71
    EditLabel.Height = 13
    EditLabel.Caption = 'Tabela Destino'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
  end
end
