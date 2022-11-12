inherited Cad_Contratos: TCad_Contratos
  Caption = 'Cadastro de Contratos'
  ClientHeight = 265
  ExplicitHeight = 304
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Height = 265
    inherited lbl_Cad: TLabel
      Top = 231
      ExplicitTop = 231
    end
    inherited lbl_DataCad: TLabel
      Top = 231
      ExplicitTop = 231
    end
    inherited Lbl_Alt: TLabel
      Top = 245
      ExplicitTop = 245
    end
    inherited lbl_DataAlt: TLabel
      Top = 245
      ExplicitTop = 245
    end
    object Label1: TLabel [5]
      Left = 16
      Top = 67
      Width = 37
      Height = 13
      Caption = 'Label1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel [6]
      Left = 90
      Top = 67
      Width = 37
      Height = 13
      Caption = 'Label1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel [7]
      Left = 349
      Top = 67
      Width = 37
      Height = 13
      Caption = 'Label1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel [8]
      Left = 16
      Top = 116
      Width = 37
      Height = 13
      Caption = 'Label1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel [9]
      Left = 16
      Top = 165
      Width = 37
      Height = 13
      Caption = 'Label1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel [10]
      Left = 349
      Top = 116
      Width = 37
      Height = 13
      Caption = 'Label1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited btn_Salvar: TButton
      Top = 226
      ExplicitTop = 226
    end
    inherited btn_Cancelar: TButton
      Top = 226
      ExplicitTop = 226
    end
    object Edit1: TEdit
      Left = 16
      Top = 86
      Width = 65
      Height = 21
      TabOrder = 3
    end
    object Edit2: TEdit
      Left = 87
      Top = 86
      Width = 256
      Height = 21
      TabOrder = 4
    end
    object Edit3: TEdit
      Left = 349
      Top = 85
      Width = 75
      Height = 21
      TabOrder = 5
    end
    object Edit4: TEdit
      Left = 16
      Top = 134
      Width = 249
      Height = 21
      ReadOnly = True
      TabOrder = 6
    end
    object Edit5: TEdit
      Left = 16
      Top = 184
      Width = 327
      Height = 21
      ReadOnly = True
      TabOrder = 7
    end
    object Button1: TButton
      Left = 268
      Top = 133
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 8
    end
    object Button2: TButton
      Left = 349
      Top = 182
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 9
    end
    object MaskEdit1: TMaskEdit
      Left = 347
      Top = 135
      Width = 77
      Height = 21
      TabOrder = 10
      Text = ''
    end
    object rg_Tipo: TRadioGroup
      Left = 312
      Top = 8
      Width = 112
      Height = 50
      Caption = 'Tipo de Contrato'
      ItemIndex = 0
      Items.Strings = (
        'A Receber'
        'A Pagar')
      TabOrder = 11
    end
  end
end
