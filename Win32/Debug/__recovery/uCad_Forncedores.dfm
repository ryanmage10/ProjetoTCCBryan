inherited Cad_Fornecedores: TCad_Fornecedores
  Caption = 'Cadastro de Fornecedores'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList
    inherited LayoutObrigatorio: TdxLayoutCxLookAndFeel
      PixelsPerInch = 96
    end
    inherited LayoutPadrao: TdxLayoutStandardLookAndFeel
      PixelsPerInch = 96
    end
  end
end
