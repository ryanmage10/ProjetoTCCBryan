inherited Cad_Empresa: TCad_Empresa
  Caption = 'Cadastro Empresas'
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    inherited btn_Salvar: TcxButton
      OnClick = btn_SalvarClick
    end
    inherited edt_CPFCNPJ: TcxMaskEdit
      Properties.EditMask = '00\.000\.000/0000-00;1;_'
      Text = '  .   .   /    -  '
    end
    inherited edt_RGIE: TcxMaskEdit
      Properties.EditMask = '000000000000'
      Text = '            '
    end
    inherited edt_dataNasc: TcxDateEdit
      Style.BorderColor = clSkyBlue
      Style.BorderStyle = ebs3D
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
    end
    inherited btn_Pesquisar: TcxButton
      OnClick = btn_PesquisarClick
    end
    inherited lbl_CPFCNPJ: TdxLayoutItem
      CaptionOptions.Text = 'CNPJ*'
    end
    inherited lbl_RGIE: TdxLayoutItem
      CaptionOptions.Text = 'IE*'
    end
    inherited lbl_DataNasc: TdxLayoutItem
      LayoutLookAndFeel = LayoutPadrao
      CaptionOptions.Text = 'Data de Funda'#231#227'o'
    end
    inherited dxLayoutItem17: TdxLayoutItem
      Visible = False
    end
    object dxLayoutItem18: TdxLayoutItem
      Visible = False
      Index = -1
    end
  end
  inherited dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList
    inherited LayoutObrigatorio: TdxLayoutCxLookAndFeel
      PixelsPerInch = 96
    end
    inherited LayoutPadrao: TdxLayoutStandardLookAndFeel
      PixelsPerInch = 96
    end
  end
end
