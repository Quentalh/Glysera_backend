class CreateRequerimentos < ActiveRecord::Migration[8.0]
  def change
    create_table :requerimentos do |t|
      t.date :data
      t.boolean :situacao
      t.references :paciente, null: false, foreign_key: true

      t.timestamps
    end
  end
end
