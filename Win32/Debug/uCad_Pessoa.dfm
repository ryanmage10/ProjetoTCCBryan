inherited Cad_Pessoa: TCad_Pessoa
  Caption = 'Cadastro de Pessoas'
  ClientHeight = 405
  ClientWidth = 516
  ExplicitWidth = 532
  ExplicitHeight = 444
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 516
    Height = 405
    ExplicitWidth = 516
    ExplicitHeight = 405
    inherited btn_Salvar: TcxButton
      Left = 350
      Top = 363
      TabOrder = 18
      ExplicitLeft = 350
      ExplicitTop = 363
    end
    inherited btn_Cancelar: TcxButton
      Left = 431
      Top = 363
      TabOrder = 19
      ExplicitLeft = 431
      ExplicitTop = 363
    end
    inherited Lbl_Alt: TcxLabel
      Top = 382
      ExplicitTop = 382
    end
    inherited lbl_Cad: TcxLabel
      Top = 363
      ExplicitTop = 363
    end
    inherited lbl_DataCad: TcxLabel
      Top = 363
      ExplicitTop = 363
    end
    inherited lbl_DataAlt: TcxLabel
      Top = 382
      ExplicitTop = 382
    end
    object edt_Nome: TcxTextEdit [7]
      Left = 10
      Top = 90
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 50
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 2
      Width = 242
    end
    object edt_Razao_Social: TcxTextEdit [8]
      Left = 258
      Top = 90
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 30
      Style.BorderColor = clSkyBlue
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 3
      Width = 121
    end
    object edt_Logradouro: TcxTextEdit [9]
      Left = 10
      Top = 192
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 50
      Style.BorderColor = clSkyBlue
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 8
      Width = 242
    end
    object edt_CPFCNPJ: TcxMaskEdit [10]
      Left = 10
      Top = 146
      Properties.AlwaysShowBlanksAndLiterals = True
      Properties.IgnoreMaskBlank = True
      Properties.EditMask = '000\.000\.000-00;1;_'
      Properties.ValidateOnEnter = False
      Properties.ValidationOptions = [evoAllowLoseFocus]
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 5
      Text = '   .   .   -  '
      Width = 242
    end
    object edt_RGIE: TcxMaskEdit [11]
      Left = 258
      Top = 146
      Properties.AlwaysShowBlanksAndLiterals = True
      Properties.EditMask = '00\.000\.000-0;1;_'
      Properties.ValidateOnEnter = False
      Properties.ValidationOptions = [evoAllowLoseFocus]
      Style.BorderColor = clSkyBlue
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 6
      Text = '  .   .   - '
      Width = 121
    end
    object edt_dataNasc: TcxDateEdit [12]
      Left = 385
      Top = 146
      Properties.DateButtons = [btnClear, btnToday]
      Properties.DisplayFormat = 'dd/mm/yyyy'
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 7
      Width = 121
    end
    object edt_numero: TcxTextEdit [13]
      Left = 258
      Top = 192
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 6
      Style.BorderColor = clSkyBlue
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 9
      Width = 121
    end
    object edt_Cep: TcxMaskEdit [14]
      Left = 385
      Top = 192
      Properties.AlwaysShowBlanksAndLiterals = True
      Properties.EditMask = '00000\-000;1;_'
      Properties.ValidateOnEnter = False
      Properties.ValidationOptions = [evoAllowLoseFocus]
      Style.BorderColor = clSkyBlue
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 10
      Text = '     -   '
      Width = 121
    end
    object Rg_TipoPessoa: TcxRadioGroup [15]
      Left = 408
      Top = 10
      Caption = 'Tipo Pessoa'
      ParentBackground = False
      ParentColor = False
      Properties.DefaultValue = 0
      Properties.Items = <
        item
          Caption = 'F'#237'sica'
          Value = 0
        end
        item
          Caption = 'Jur'#237'dica'
          Value = 1
        end>
      ItemIndex = 0
      Style.BorderColor = clSkyBlue
      Style.BorderStyle = ebs3D
      Style.Color = clSkyBlue
      Style.TransparentBorder = False
      TabOrder = 1
      Height = 55
      Width = 98
    end
    object rg_Sexo: TcxRadioGroup [16]
      Left = 385
      Top = 71
      Caption = 'Sexo'
      ParentBackground = False
      ParentColor = False
      Properties.DefaultValue = 0
      Properties.Items = <
        item
          Caption = 'Masculino'
          Value = 0
        end
        item
          Caption = 'Feminino'
          Value = 1
        end>
      ItemIndex = 0
      Style.BorderColor = clSkyBlue
      Style.BorderStyle = ebs3D
      Style.Color = clSkyBlue
      Style.TransparentBorder = False
      TabOrder = 4
      Height = 50
      Width = 121
    end
    object edt_Bairro: TcxTextEdit [17]
      Left = 10
      Top = 238
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 30
      Style.BorderColor = clSkyBlue
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 11
      Width = 344
    end
    object edt_Complemento: TcxTextEdit [18]
      Left = 360
      Top = 238
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 30
      Style.BorderColor = clSkyBlue
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 12
      Width = 146
    end
    object edt_Cidade: TcxTextEdit [19]
      Left = 10
      Top = 284
      Properties.CharCase = ecUpperCase
      Properties.ReadOnly = True
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 13
      Width = 344
    end
    object edt_UF: TcxTextEdit [20]
      Left = 360
      Top = 284
      Properties.CharCase = ecUpperCase
      Properties.ReadOnly = True
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 14
      Width = 65
    end
    object btn_Pesquisar: TcxButton [21]
      Left = 431
      Top = 280
      Width = 75
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 15
    end
    object edt_Tel_Fixo: TcxMaskEdit [22]
      Left = 10
      Top = 330
      Properties.EditMask = '!\(99\)00000-0000;1;_'
      Properties.ValidateOnEnter = False
      Properties.ValidationOptions = [evoAllowLoseFocus]
      Style.BorderColor = clSkyBlue
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 16
      Text = '(  )     -    '
      Width = 245
    end
    object edt_Tel_Cel: TcxMaskEdit [23]
      Left = 261
      Top = 330
      Properties.EditMask = '!\(99\)00000-0000;1;_'
      Properties.ValidateOnEnter = False
      Properties.ValidationOptions = [evoAllowLoseFocus]
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 17
      Text = '(  )     -    '
      Width = 245
    end
    inherited dxLayoutGroup2: TdxLayoutGroup
      Index = 2
    end
    object dxLayoutGroup6: TdxLayoutGroup
      Parent = dxLayoutControl1Group_Root
      CaptionOptions.Text = 'New Group'
      ItemIndex = 5
      ShowBorder = False
      Index = 1
    end
    object dxLayoutGroup7: TdxLayoutGroup
      Parent = dxLayoutGroup6
      CaptionOptions.Text = 'New Group'
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup8: TdxLayoutGroup
      Parent = dxLayoutGroup6
      CaptionOptions.Text = 'New Group'
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 1
    end
    object dxLayoutGroup9: TdxLayoutGroup
      Parent = dxLayoutGroup6
      CaptionOptions.Text = 'New Group'
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 2
    end
    object dxLayoutGroup10: TdxLayoutGroup
      Parent = dxLayoutGroup6
      CaptionOptions.Text = 'New Group'
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 3
    end
    object dxLayoutGroup11: TdxLayoutGroup
      Parent = dxLayoutGroup6
      CaptionOptions.Text = 'New Group'
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 4
    end
    object dxLayoutGroup12: TdxLayoutGroup
      Parent = dxLayoutGroup6
      CaptionOptions.Text = 'New Group'
      ItemIndex = 1
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 5
    end
    object lbl_Nome: TdxLayoutItem
      Parent = dxLayoutGroup7
      AlignHorz = ahClient
      LayoutLookAndFeel = LayoutObrigatorio
      CaptionOptions.Text = 'Nome*'
      CaptionOptions.Layout = clTop
      Control = edt_Nome
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 242
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lbl_RazaoSocial: TdxLayoutItem
      Parent = dxLayoutGroup7
      AlignHorz = ahClient
      LayoutLookAndFeel = LayoutPadrao
      CaptionOptions.Text = 'Raz'#227'o Social'
      CaptionOptions.Layout = clTop
      Control = edt_Razao_Social
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lbl_logradouro: TdxLayoutItem
      Parent = dxLayoutGroup9
      AlignHorz = ahClient
      LayoutLookAndFeel = LayoutPadrao
      CaptionOptions.Text = 'Logradouro'
      CaptionOptions.Layout = clTop
      Control = edt_Logradouro
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lbl_CPFCNPJ: TdxLayoutItem
      Parent = dxLayoutGroup8
      AlignHorz = ahClient
      LayoutLookAndFeel = LayoutObrigatorio
      CaptionOptions.Text = 'CPF*'
      CaptionOptions.Layout = clTop
      Control = edt_CPFCNPJ
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lbl_RGIE: TdxLayoutItem
      Parent = dxLayoutGroup8
      AlignHorz = ahRight
      LayoutLookAndFeel = LayoutPadrao
      CaptionOptions.Text = 'RG'
      CaptionOptions.Layout = clTop
      Control = edt_RGIE
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lbl_DataNasc: TdxLayoutItem
      Parent = dxLayoutGroup8
      AlignHorz = ahRight
      LayoutLookAndFeel = LayoutObrigatorio
      CaptionOptions.Text = 'Data Nascimento*'
      CaptionOptions.Layout = clTop
      Control = edt_dataNasc
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object lbl_numero: TdxLayoutItem
      Parent = dxLayoutGroup9
      AlignHorz = ahRight
      LayoutLookAndFeel = LayoutPadrao
      CaptionOptions.Text = 'N'#250'mero'
      CaptionOptions.Layout = clTop
      Control = edt_numero
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lbl_Cep: TdxLayoutItem
      Parent = dxLayoutGroup9
      AlignHorz = ahRight
      LayoutLookAndFeel = LayoutPadrao
      CaptionOptions.Text = 'CEP'
      CaptionOptions.Layout = clTop
      Control = edt_Cep
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem17: TdxLayoutItem
      Parent = dxLayoutGroup1
      AlignHorz = ahRight
      CaptionOptions.Text = 'cxRadioGroup1'
      CaptionOptions.Visible = False
      CaptionOptions.Layout = clTop
      Control = Rg_TipoPessoa
      ControlOptions.AutoColor = True
      ControlOptions.OriginalHeight = 55
      ControlOptions.OriginalWidth = 98
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object LayoutSexo: TdxLayoutItem
      Parent = dxLayoutGroup7
      AlignHorz = ahRight
      CaptionOptions.Text = 'cxRadioGroup2'
      CaptionOptions.Visible = False
      Control = rg_Sexo
      ControlOptions.AutoColor = True
      ControlOptions.OriginalHeight = 50
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object lbl_Bairro: TdxLayoutItem
      Parent = dxLayoutGroup10
      AlignHorz = ahClient
      LayoutLookAndFeel = LayoutPadrao
      CaptionOptions.Text = 'Bairro'
      CaptionOptions.Layout = clTop
      Control = edt_Bairro
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lbl_Complemento: TdxLayoutItem
      Parent = dxLayoutGroup10
      AlignHorz = ahRight
      CaptionOptions.Text = 'Complemento'
      CaptionOptions.Layout = clTop
      Control = edt_Complemento
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 146
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem21: TdxLayoutItem
      Parent = dxLayoutGroup11
      AlignHorz = ahClient
      LayoutLookAndFeel = LayoutObrigatorio
      CaptionOptions.Text = 'Cidade*'
      CaptionOptions.Layout = clTop
      Control = edt_Cidade
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lbl_UF: TdxLayoutItem
      Parent = dxLayoutGroup11
      AlignHorz = ahRight
      LayoutLookAndFeel = LayoutObrigatorio
      CaptionOptions.Text = 'UF*'
      CaptionOptions.Layout = clTop
      Control = edt_UF
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 65
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem23: TdxLayoutItem
      Parent = dxLayoutGroup11
      AlignHorz = ahRight
      Offsets.Top = 15
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btn_Pesquisar
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object lbl_Tel_Fixo: TdxLayoutItem
      Parent = dxLayoutGroup12
      AlignHorz = ahClient
      LayoutLookAndFeel = LayoutPadrao
      CaptionOptions.Text = 'Telefone Fixo'
      CaptionOptions.Layout = clTop
      Control = edt_Tel_Fixo
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lbl_Tel_Cel: TdxLayoutItem
      Parent = dxLayoutGroup12
      AlignHorz = ahClient
      LayoutLookAndFeel = LayoutObrigatorio
      CaptionOptions.Text = 'Telefone Celular*'
      CaptionOptions.Layout = clTop
      Control = edt_Tel_Cel
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
  end
  inherited dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList
    Left = 256
    Top = 8
    inherited LayoutObrigatorio: TdxLayoutCxLookAndFeel
      PixelsPerInch = 96
    end
    inherited LayoutPadrao: TdxLayoutStandardLookAndFeel
      PixelsPerInch = 96
    end
  end
end
