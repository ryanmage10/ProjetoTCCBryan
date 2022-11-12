program ProjetoTCC;

uses
  Vcl.Forms,
  uBase in 'Win32\Debug\uBase.pas',
  uCaixas in 'Win32\Debug\uCaixas.pas',
  uCaixasController in 'Win32\Debug\uCaixasController.pas',
  uCaixasDao in 'Win32\Debug\uCaixasDao.pas',
  uCaixasFactory in 'Win32\Debug\uCaixasFactory.pas',
  uCaixasService in 'Win32\Debug\uCaixasService.pas',
  uCidades in 'Win32\Debug\uCidades.pas',
  uCidadesController in 'Win32\Debug\uCidadesController.pas',
  uCidadesDao in 'Win32\Debug\uCidadesDao.pas',
  uCidadesFactory in 'Win32\Debug\uCidadesFactory.pas',
  uCidadesService in 'Win32\Debug\uCidadesService.pas',
  uClientes in 'Win32\Debug\uClientes.pas',
  uClientesController in 'Win32\Debug\uClientesController.pas',
  uClientesDao in 'Win32\Debug\uClientesDao.pas',
  uClientesFactory in 'Win32\Debug\uClientesFactory.pas',
  uClientesService in 'Win32\Debug\uClientesService.pas',
  uCompras in 'Win32\Debug\uCompras.pas',
  uCondicaoPagamento in 'Win32\Debug\uCondicaoPagamento.pas',
  uCondicaoPagamentoController in 'Win32\Debug\uCondicaoPagamentoController.pas',
  uCondicaoPagamentoDao in 'Win32\Debug\uCondicaoPagamentoDao.pas',
  uCondicaoPagamentoFactory in 'Win32\Debug\uCondicaoPagamentoFactory.pas',
  uCondicaoPagamentoService in 'Win32\Debug\uCondicaoPagamentoService.pas',
  uContratos in 'Win32\Debug\uContratos.pas',
  uContratosController in 'Win32\Debug\uContratosController.pas',
  uContratosDao in 'Win32\Debug\uContratosDao.pas',
  uContratosFactory in 'Win32\Debug\uContratosFactory.pas',
  uContratosService in 'Win32\Debug\uContratosService.pas',
  uDmConexao in 'Win32\Debug\uDmConexao.pas' {dmConexao: TDataModule},
  uEmpresas in 'Win32\Debug\uEmpresas.pas',
  uEmpresasController in 'Win32\Debug\uEmpresasController.pas',
  uEmpresasDao in 'Win32\Debug\uEmpresasDao.pas',
  uEmpresasFactory in 'Win32\Debug\uEmpresasFactory.pas',
  uEmpresasService in 'Win32\Debug\uEmpresasService.pas',
  uEmpresassFactory in 'Win32\Debug\uEmpresassFactory.pas',
  uEstados in 'Win32\Debug\uEstados.pas',
  uEstadosController in 'Win32\Debug\uEstadosController.pas',
  uEstadosDao in 'Win32\Debug\uEstadosDao.pas',
  uEstadosFactory in 'Win32\Debug\uEstadosFactory.pas',
  uEstadosService in 'Win32\Debug\uEstadosService.pas',
  uFormaPagamento in 'Win32\Debug\uFormaPagamento.pas',
  uFormaPagamentoController in 'Win32\Debug\uFormaPagamentoController.pas',
  uFormaPagamentoDao in 'Win32\Debug\uFormaPagamentoDao.pas',
  uFormaPagamentoFactory in 'Win32\Debug\uFormaPagamentoFactory.pas',
  uFormaPagamentoService in 'Win32\Debug\uFormaPagamentoService.pas',
  uFornecedores in 'Win32\Debug\uFornecedores.pas',
  uFornecedoresController in 'Win32\Debug\uFornecedoresController.pas',
  uFornecedoresDao in 'Win32\Debug\uFornecedoresDao.pas',
  uFornecedoresFactory in 'Win32\Debug\uFornecedoresFactory.pas',
  uFornecedoresService in 'Win32\Debug\uFornecedoresService.pas',
  uFuncionarios in 'Win32\Debug\uFuncionarios.pas',
  uFuncionariosController in 'Win32\Debug\uFuncionariosController.pas',
  uFuncionariosDao in 'Win32\Debug\uFuncionariosDao.pas',
  uFuncionariosFactory in 'Win32\Debug\uFuncionariosFactory.pas',
  uFuncionariosService in 'Win32\Debug\uFuncionariosService.pas',
  uMenuPrincipal in 'Win32\Debug\uMenuPrincipal.pas' {MenuPrincipal},
  uPaises in 'Win32\Debug\uPaises.pas',
  uPaisesController in 'Win32\Debug\uPaisesController.pas',
  uPaisesDao in 'Win32\Debug\uPaisesDao.pas',
  uPaisesFactory in 'Win32\Debug\uPaisesFactory.pas',
  uPaisesService in 'Win32\Debug\uPaisesService.pas',
  uParcelaModeloDao in 'Win32\Debug\uParcelaModeloDao.pas',
  uParcelaModeloFactory in 'Win32\Debug\uParcelaModeloFactory.pas',
  uParcelaModelos in 'Win32\Debug\uParcelaModelos.pas',
  uPessoas in 'Win32\Debug\uPessoas.pas',
  uProdutos in 'Win32\Debug\uProdutos.pas',
  uProdutosController in 'Win32\Debug\uProdutosController.pas',
  uProdutosDao in 'Win32\Debug\uProdutosDao.pas',
  uProdutosFactory in 'Win32\Debug\uProdutosFactory.pas',
  uProdutosService in 'Win32\Debug\uProdutosService.pas',
  uUnidades in 'Win32\Debug\uUnidades.pas',
  uUnidadesController in 'Win32\Debug\uUnidadesController.pas',
  uUnidadesDao in 'Win32\Debug\uUnidadesDao.pas',
  uUnidadesFactory in 'Win32\Debug\uUnidadesFactory.pas',
  uUnidadesService in 'Win32\Debug\uUnidadesService.pas',
  uItensCompra in 'Win32\Debug\uItensCompra.pas',
  uCad_Base in 'Win32\Debug\uCad_Base.pas' {Cad_Base},
  uCad_Cidades in 'Win32\Debug\uCad_Cidades.pas' {Cad_Cidades},
  uCons_Base in 'Win32\Debug\uCons_Base.pas' {Cons_Base},
  uCad_Compras in 'Win32\Debug\uCad_Compras.pas' {Cad_Compras},
  uCad_Clientes in 'Win32\Debug\uCad_Clientes.pas',
  uCad_Pessoa in 'Win32\Debug\uCad_Pessoa.pas' {Cad_Pessoa};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMenuPrincipal, MenuPrincipal);
  Application.CreateForm(TdmConexao, dmConexao);
  Application.CreateForm(TCad_Base, Cad_Base);
  Application.CreateForm(TCons_Base, Cons_Base);
  Application.CreateForm(TCad_Compras, Cad_Compras);
  Application.CreateForm(TCad_Pessoa, Cad_Pessoa);
  Application.Run;
end.


