class AddSexoToPacientes < ActiveRecord::Migration[8.0]
  def change
    add_column :pacientes, :sexo, :string
  end
end
