class AddPacienteCpfToRequerimento < ActiveRecord::Migration[8.0]
  def change
    add_column :requerimentos, :paciente_cpf, :string
    add_index :requerimentos, :paciente_cpf
  end
end
