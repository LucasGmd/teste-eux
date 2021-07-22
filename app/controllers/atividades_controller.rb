class AtividadesController < ApplicationController
  before_action :seta_atividade, only: [:show, :edit, :update, :destroy]

  def index
    @atividades = Atividade.joins(:projeto).select(:id,
                                                   :nome_atividade,
                                                   :finalizada,
                                                   "TO_CHAR(atividades.data_inicio::DATE, 'DD/MM/YYYY') AS data_inicio_formatada",
                                                   "TO_CHAR(atividades.data_final::DATE, 'DD/MM/YYYY') AS data_final_formatada",
                                                   'projetos.nome_projeto').order(:nome_atividade)
  end

  def new
    @projetos = Projeto.order(:nome_projeto)
    @redireciona_projeto = Projeto.where(id: params[:redireciona_projeto_id]).first
    @atividade = Atividade.new
  end

  def edit
    @projetos = Projeto.order(:nome_projeto)
  end

  def create
    @atividade = Atividade.new(atividade_params)

    respond_to do |format|
      if @atividade.save
        @projeto_para_redicionar = Projeto.where(id: params[:atividade][:redireciona_projeto]).first

        if @projeto_para_redicionar.present?
          path = edit_projeto_path(@projeto_para_redicionar.id)
          mensagem = 'O Projeto e suas atividades foram atualizadas com sucesso.'
          location = @projeto_para_redicionar
        else
          path = edit_atividade_path(@atividade.id)
          mensagem = 'Atividade foi atualizada com sucesso.'
          location = @atividade
        end

        format.html { redirect_to path, notice: mensagem }
        format.json { render :edit, status: :ok, location: location }
      else
        format.html { render :new }
        format.json { render json: @atividade.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @atividade.update(atividade_params)
        @projeto_para_redicionar = Projeto.where(id: params[:atividade][:redireciona_projeto]).first

        if @projeto_para_redicionar.present?
          path = edit_projeto_path(@projeto_para_redicionar.id)
          mensagem = 'O Projeto e suas atividades foram atualizadas com sucesso.'
          location = @projeto_para_redicionar
        else
          path = edit_atividade_path(@atividade.id)
          mensagem = 'Atividade foi atualizada com sucesso.'
          location = @atividade
        end

        format.html { redirect_to path, notice: mensagem }
        format.json { render :edit, status: :ok, location: location }
      else
        format.html { render :edit }
        format.json { render json: @atividade.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    nome_atividade = @atividade.nome_atividade
    @atividade.destroy
    mensagem = "Atividade #{ nome_atividade } foi deletada com sucesso."

    @projeto_para_redicionar = Projeto.where(id: params[:redireciona_projeto]).first

    if @projeto_para_redicionar.present?
      path = edit_projeto_path(@projeto_para_redicionar.id)
      location = @projeto_para_redicionar
    else
      path = atividades_path
      location = @atividade
    end

    respond_to do |format|
      format.html { redirect_to path, notice: mensagem }
      format.json { render :edit, status: :ok, location: location }
    end
  end

  private

  def seta_atividade
    @atividade = Atividade.find(params[:id])
  end

  def atividade_params
    params.require(:atividade).permit(:nome_atividade, :data_inicio, :data_final, :finalizada, :projeto_id)
  end
end
