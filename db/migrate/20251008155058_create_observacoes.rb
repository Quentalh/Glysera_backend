class CreateObservacoes < ActiveRecord::Migration[8.0]
  def change
    create_table :observacoes do |t|
      t.text :texto
      t.date :data
      t.references :equipamento, null: false, foreign_key: true

      t.timestamps
    end
  end
end
