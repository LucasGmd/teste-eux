class Projeto < ActiveRecord::Base

  validates :nome_projeto, :data_inicio, :data_final, presence: true
  validates :data_inicio, :data_final, format: { with: /\A\d+-\d{2}-\d{2}\z/, message: 'está em um formato inválido.' }

  validate :valida_ordem_datas

  has_many :atividades, dependent: :destroy

  accepts_nested_attributes_for :atividades

  def qtd_atividades_finalizadas
    atividades.where('finalizada IS TRUE').count
  end

  def atrasado?
    atividades.where('atividades.data_final > ?', data_final).exists?
  end

  class << self

    def busca_registros_index
      sql_qtd_total_atividades = "GREATEST(COALESCE((SELECT COUNT (*) FROM atividades WHERE atividades.projeto_id = projetos.id), 0.0), 1.0)"

      sql_qtd_atividades_finalizadas = "COALESCE((SELECT COUNT (*) FROM atividades WHERE finalizada IS TRUE AND atividades.projeto_id = projetos.id), 0.0)"

      sql_projeto_atrasado = "(SELECT TRUE FROM atividades WHERE atividades.projeto_id = projetos.id AND atividades.data_final > projetos.data_final)"

      Projeto.all.select(:id,
                         :nome_projeto,
                         "TO_CHAR(projetos.data_inicio::DATE, 'DD/MM/YYYY') AS data_inicio_formatada",
                         "TO_CHAR(projetos.data_final::DATE, 'DD/MM/YYYY') AS data_final_formatada",
                         "(#{ sql_qtd_atividades_finalizadas }) / (#{ sql_qtd_total_atividades }) * 100 AS porcentagem_completo",
                         "EXISTS(#{sql_projeto_atrasado}) AS projeto_atrasado").order(:nome_projeto)
    end
  end

  private

  def valida_ordem_datas
    return unless data_inicio && data_final
    errors.add :base, 'Data inicial do projeto não pode ser posterior a sua data final.' if data_inicio > data_final
  end
end