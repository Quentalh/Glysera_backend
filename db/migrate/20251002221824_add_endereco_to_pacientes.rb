class AddEnderecoToPacientes < ActiveRecord::Migration[8.0]
  def change
    add_reference :pacientes, :endereco, null: false, foreign_key: true
  end
end
