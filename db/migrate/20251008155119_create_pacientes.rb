class CreatePacientes < ActiveRecord::Migration[8.0]
  def change
    create_table :pacientes do |t|
      t.string :nome
      t.string :nome_social
      t.string :nome_mae
      t.string :cpf
      t.date :nascimento_date
      t.references :endereco, null: false, foreign_key: true

      t.timestamps
    end
  end
end
