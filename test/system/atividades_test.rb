require "application_system_test_case"

class AtividadesTest < ApplicationSystemTestCase
  setup do
    @atividade = atividades(:one)
  end

  test "visiting the index" do
    visit atividades_url
    assert_selector "h1", text: "Atividades"
  end

  test "creating a Atividade" do
    visit atividades_url
    click_on "New Atividade"

    fill_in "Data final", with: @atividade.data_final
    fill_in "Data inicio", with: @atividade.data_inicio
    check "Finalizada" if @atividade.finalizada
    fill_in "Nome atividade", with: @atividade.nome_atividade
    click_on "Create Atividade"

    assert_text "Atividade was successfully created"
    click_on "Back"
  end

  test "updating a Atividade" do
    visit atividades_url
    click_on "Edit", match: :first

    fill_in "Data final", with: @atividade.data_final
    fill_in "Data inicio", with: @atividade.data_inicio
    check "Finalizada" if @atividade.finalizada
    fill_in "Nome atividade", with: @atividade.nome_atividade
    click_on "Update Atividade"

    assert_text "Atividade was successfully updated"
    click_on "Back"
  end

  test "destroying a Atividade" do
    visit atividades_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Atividade was successfully destroyed"
  end
end
