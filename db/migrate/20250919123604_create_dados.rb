class CreateDados < ActiveRecord::Migration[8.0]
  def change
    create_table :dados do |t|
      t.string :nome
      t.string :nomeMae
      t.string :nomeSocial

      t.timestamps
    end
  end
end
