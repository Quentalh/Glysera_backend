class AddNomeSocialToPacientes < ActiveRecord::Migration[8.0]
  def change
    add_column :pacientes, :nome_social, :string
  end
end
