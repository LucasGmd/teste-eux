class Atividade < ActiveRecord::Base

  belongs_to :projeto
  validates :nome_atividade, :data_inicio, :data_final, :projeto_id, presence: true
  validates :finalizada, inclusion: [true, false, nil]

  validate :valida_ordem_datas

  def valida_ordem_datas
    return unless data_inicio && data_final
    errors.add :base, 'Data inicial da atividade não pode ser posterior a sua data final.' if data_inicio > data_final
  end
end