class CreateObservacaos < ActiveRecord::Migration[8.0]
  def change
    create_table :observacaos do |t|
      t.text :texto
      t.date :data

      t.timestamps
    end
  end
end
