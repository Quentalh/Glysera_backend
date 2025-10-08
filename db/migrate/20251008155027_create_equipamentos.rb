class CreateEquipamentos < ActiveRecord::Migration[8.0]
  def change
    create_table :equipamentos do |t|
      t.string :marca
      t.date :data
      t.integer :numero_de_serie
      t.string :modelo

      t.timestamps
    end
  end
end
