class CreateUsuarios < ActiveRecord::Migration[8.0]
  def change
    create_table :usuarios do |t|
      t.string :nome_usuario
      t.string :password_digest

      t.timestamps
    end
  end
end
