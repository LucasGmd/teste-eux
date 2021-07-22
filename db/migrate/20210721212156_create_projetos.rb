class CreateProjetos < ActiveRecord::Migration[5.2]
  def change
    create_table :projetos do |t|
      t.string :nome_projeto, null: false
      t.date :data_inicio, null: false
      t.date :data_final, null: false

      t.timestamps null: false
    end
  end
end
