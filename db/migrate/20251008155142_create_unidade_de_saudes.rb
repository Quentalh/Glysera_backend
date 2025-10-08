class CreateUnidadeDeSaudes < ActiveRecord::Migration[8.0]
  def change
    create_table :unidade_de_saudes do |t|
      t.string :nome
      t.integer :us
      t.references :endereco, null: false, foreign_key: true

      t.timestamps
    end
  end
end
