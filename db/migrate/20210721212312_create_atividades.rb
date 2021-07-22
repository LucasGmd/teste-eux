class CreateAtividades < ActiveRecord::Migration[5.2]
  def change
    create_table :atividades do |t|
      t.string :nome_atividade, null: false
      t.date :data_inicio, null: false
      t.date :data_final, null: false
      t.boolean :finalizada, default: false
      t.references :projeto, index: true
      t.foreign_key :projetos

      t.timestamps null: false
    end
  end
end
