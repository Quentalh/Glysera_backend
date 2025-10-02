class RemoveNomeSocialFromPacientes < ActiveRecord::Migration[8.0]
  def change
    remove_column :pacientes, :nome_social, :string
  end
end
