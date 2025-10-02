class AddEstadoToEnderecos < ActiveRecord::Migration[8.0]
  def change
    add_column :enderecos, :estado, :string
  end
end
