class AddRemainingAddressFieldsToEnderecos < ActiveRecord::Migration[8.0]
  def change
    add_column :enderecos, :numero, :string
    add_column :enderecos, :complemento, :string
  end
end
