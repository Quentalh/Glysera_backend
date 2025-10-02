class AddBairroToEnderecos < ActiveRecord::Migration[8.0]
  def change
    add_column :enderecos, :bairro, :string
  end
end
