require 'test_helper'

class AtividadeTest < ActiveSupport::TestCase

  test 'validacoes_atributos' do
    atividade = Atividade.new
    refute atividade.valid?

    erros = { :projeto => ["é obrigatório(a)"],
              :nome_atividade => ["não pode ficar em branco"],
              :data_inicio => ["não pode ficar em branco"],
              :data_final => ["não pode ficar em branco"],
              :projeto_id => ["não pode ficar em branco"] }

    assert_equal atividade.errors.messages, erros, "Validações dos atributos falhou."
  end

  test 'valida_ordem_datas' do
    projeto = Projeto.create(nome_projeto: 'Teste 2', data_inicio: Date.today, data_final: Date.tomorrow)
    atividade = Atividade.new(nome_atividade: 'Teste 1',
                              data_inicio: Date.tomorrow,
                              data_final: Date.today,
                              finalizada: true,
                              projeto_id: projeto.id)

    refute atividade.valid?

    erros = { :base => ["Data inicial da atividade não pode ser posterior a sua data final."] }
    assert_equal atividade.errors.messages, erros, "Validações de ordem das datas falhou."
  end

end
