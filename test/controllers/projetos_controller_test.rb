require 'test_helper'

class ProjetosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @projeto = projetos(:one)
  end

  test "index" do
    get projetos_url
    assert_response :success
  end

  test "new" do
    get new_projeto_url
    assert_response :success
  end

  test "create" do
    assert_difference('Projeto.count') do
      post projetos_url, params: { projeto: { data_final: @projeto.data_final, data_inicio: @projeto.data_inicio, nome_projeto: @projeto.nome_projeto } }
    end

    assert_redirected_to edit_projeto_url(Projeto.last)
  end

  test "show" do
    get projeto_url(@projeto)
    assert_response :success
  end

  test "edit" do
    get edit_projeto_url(@projeto)
    assert_response :success
  end

  test "update" do
    patch projeto_url(@projeto), params: { projeto: { data_final: @projeto.data_final, data_inicio: @projeto.data_inicio, nome_projeto: @projeto.nome_projeto } }
    assert_redirected_to edit_projeto_url(@projeto)
  end

  test "destroy" do
    assert_difference('Projeto.count', -1) do
      delete projeto_url(@projeto)
    end

    assert_redirected_to projetos_url
  end
end
