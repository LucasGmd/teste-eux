class ProjetosController < ApplicationController
  before_action :seta_projeto, only: [:show, :edit, :update, :destroy]

  def index
    @projetos = Projeto.busca_registros_index
  end

  def new
    @projeto = Projeto.new
  end

  def create
    @projeto = Projeto.new(projeto_params)

    respond_to do |format|
      if @projeto.save
        format.html { redirect_to edit_projeto_path(@projeto.id), notice: 'Projeto foi criado com sucesso.' }
        format.json { render :edit, status: :ok, location: @projeto }
      else
        format.html { render :new }
        format.json { render json: @projeto.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @projeto.update(projeto_params)
        format.html { redirect_to edit_projeto_path(@projeto.id), notice: 'Projeto foi atualizado com sucesso.' }
        format.json { render :edit, status: :ok, location: @projeto }
      else
        format.html { render :edit }
        format.json { render json: @projeto.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    nome_projeto = @projeto.nome_projeto
    @projeto.destroy
    respond_to do |format|
      format.html { redirect_to projetos_url, notice: "Projeto #{nome_projeto} foi deletado com sucesso." }
      format.json { head :no_content }
    end
  end

  private

  def seta_projeto
    @projeto = Projeto.find(params[:id])
  end

  def projeto_params
    params.require(:projeto).permit(:nome_projeto, :data_inicio, :data_final, atividades_attributes: [:id, :nome_atividade, :data_inicio, :data_final, :finalizada])
  end
end
