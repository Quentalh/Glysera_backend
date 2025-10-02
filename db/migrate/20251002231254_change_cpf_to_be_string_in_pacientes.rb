class ChangeCpfToBeStringInPacientes < ActiveRecord::Migration[8.0]
  def change
    change_column :pacientes, :cpf, :string
  end
end