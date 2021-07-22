require 'test_helper'

class AtividadesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @atividade = atividades(:one)
  end

  test "index" do
    get atividades_url
    assert_response :success
  end

  test "new" do
    get new_atividade_url
    assert_response :success
  end

  test "create" do
    projeto = Projeto.create(nome_projeto: 'Teste 1', data_inicio: Date.today, data_final: Date.tomorrow)
    assert_difference('Atividade.count') do
      post atividades_url, params: { atividade: { data_final: @atividade.data_final, data_inicio: @atividade.data_inicio, finalizada: @atividade.finalizada, nome_atividade: @atividade.nome_atividade, projeto_id: projeto.id } }
    end

    assert_redirected_to edit_atividade_url(Atividade.last)
  end

  test "show" do
    get atividade_url(@atividade)
    assert_response :success
  end

  test "edit" do
    get edit_atividade_url(@atividade)
    assert_response :success
  end

  test "update" do
    projeto = Projeto.create(nome_projeto: 'Teste 1', data_inicio: Date.today, data_final: Date.tomorrow)
    patch atividade_url(@atividade), params: { atividade: { data_final: @atividade.data_final, data_inicio: @atividade.data_inicio, finalizada: @atividade.finalizada, nome_atividade: @atividade.nome_atividade, projeto_id: projeto.id } }
    assert_redirected_to edit_atividade_url(@atividade)
  end

  test "destroy" do
    assert_difference('Atividade.count', -1) do
      delete atividade_url(@atividade)
    end

    assert_redirected_to atividades_url
  end
end
