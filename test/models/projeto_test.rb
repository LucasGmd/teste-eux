require 'test_helper'

class ProjetoTest < ActiveSupport::TestCase

  test 'validacoes_atributos' do
    projeto = Projeto.new
    refute projeto.valid?

    erros = { :nome_projeto => ["não pode ficar em branco"],
              :data_inicio => ["não pode ficar em branco", "está em um formato inválido."],
              :data_final => ["não pode ficar em branco", "está em um formato inválido."] }

    assert_equal projeto.errors.messages, erros, "Validações dos atributos falhou."
  end

  test 'valida_ordem_datas' do
    projeto = Projeto.new(nome_projeto: 'Teste 1', data_inicio: Date.tomorrow, data_final: Date.today)
    refute projeto.valid?

    erros = { :base => ["Data inicial do projeto não pode ser posterior a sua data final."] }
    assert_equal projeto.errors.messages, erros, "Validações de ordem das datas falhou."
  end

  test 'qtd_atividades_finalizadas' do
    projeto = Projeto.new(nome_projeto: 'Teste 1', data_inicio: Date.today, data_final: Date.tomorrow)
    assert projeto.save
    assert_equal 0, projeto.qtd_atividades_finalizadas

    projeto.atividades.build [{ nome_atividade: 'Atv 1', data_inicio: Date.today, data_final: Date.tomorrow, finalizada: true },
                              { nome_atividade: 'Atv 2', data_inicio: Date.today, data_final: Date.tomorrow, finalizada: false }]

    assert projeto.save
    assert_equal 1, projeto.qtd_atividades_finalizadas

    projeto.atividades.update_all finalizada: true
    assert_equal 2, projeto.qtd_atividades_finalizadas
  end

  test 'busca_registros_index' do
    Projeto.delete_all

    consulta_projetos = Projeto.busca_registros_index
    assert_equal [], consulta_projetos

    projeto1 = Projeto.create(nome_projeto: 'Teste 1', data_inicio: Date.today, data_final: Date.tomorrow)
    projeto1.atividades.build [{ nome_atividade: 'Atv 1', data_inicio: Date.today, data_final: Date.tomorrow + 1.day, finalizada: true },
                               { nome_atividade: 'Atv 2', data_inicio: Date.today, data_final: Date.tomorrow, finalizada: false }]

    projeto1.save

    projeto2 = Projeto.create(nome_projeto: 'Teste 2', data_inicio: Date.today, data_final: Date.tomorrow)
    projeto2.atividades.build [{ nome_atividade: 'Atv 1', data_inicio: Date.today, data_final: Date.tomorrow, finalizada: true },
                               { nome_atividade: 'Atv 2', data_inicio: Date.today, data_final: Date.tomorrow, finalizada: true }]

    projeto2.save

    retorno_esperado = [{ "id" => projeto1.id,
                          "nome_projeto" => projeto1.nome_projeto,
                          "data_inicio_formatada" => projeto1.data_inicio.strftime('%d/%m/%Y'),
                          "data_final_formatada" => projeto1.data_final.strftime('%d/%m/%Y'),
                          "porcentagem_completo" => 50.0,
                          "projeto_atrasado" => true },
                        { "id" => projeto2.id,
                          "nome_projeto" => projeto2.nome_projeto,
                          "data_inicio_formatada" => projeto2.data_inicio.strftime('%d/%m/%Y'),
                          "data_final_formatada" => projeto2.data_final.strftime('%d/%m/%Y'),
                          "porcentagem_completo" => 100.0,
                          "projeto_atrasado" => false }]

    consulta_projetos = Projeto.busca_registros_index

    assert_equal retorno_esperado, consulta_projetos.map(&:attributes)
  end

end
