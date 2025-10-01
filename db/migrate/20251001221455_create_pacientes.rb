class CreatePacientes < ActiveRecord::Migration[8.0]
  def change
    create_table :pacientes do |t|
      t.string :nome
      t.string :nome_mae
      t.string :nome_social
      t.integer :cpf
      t.integer :nascimento

      t.timestamps
    end
  end
end
