class CreateEquipamentos < ActiveRecord::Migration[8.0]
  def change
    create_table :equipamentos do |t|
      t.string :marca
      t.date :data
      t.string :modelo
      t.integer :numero_de_serie

      t.timestamps
    end
  end
end
