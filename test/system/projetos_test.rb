require "application_system_test_case"

class ProjetosTest < ApplicationSystemTestCase
  setup do
    @projeto = projetos(:one)
  end

  test "visiting the index" do
    visit projetos_url
    assert_selector "h1", text: "Projetos"
  end

  test "creating a Projeto" do
    visit projetos_url
    click_on "New Projeto"

    fill_in "Data final", with: @projeto.data_final
    fill_in "Data inicio", with: @projeto.data_inicio
    fill_in "Nome projeto", with: @projeto.nome_projeto
    click_on "Create Projeto"

    assert_text "Projeto was successfully created"
    click_on "Back"
  end

  test "updating a Projeto" do
    visit projetos_url
    click_on "Edit", match: :first

    fill_in "Data final", with: @projeto.data_final
    fill_in "Data inicio", with: @projeto.data_inicio
    fill_in "Nome projeto", with: @projeto.nome_projeto
    click_on "Update Projeto"

    assert_text "Projeto was successfully updated"
    click_on "Back"
  end

  test "destroying a Projeto" do
    visit projetos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Projeto was successfully destroyed"
  end
end
