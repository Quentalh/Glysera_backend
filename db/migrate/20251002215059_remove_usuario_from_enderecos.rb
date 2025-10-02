class RemoveUsuarioFromEnderecos < ActiveRecord::Migration[8.0]
  def change
    remove_reference :enderecos, :usuario, null: false, foreign_key: true
  end
end
