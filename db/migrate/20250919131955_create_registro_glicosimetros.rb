class CreateRegistroGlicosimetros < ActiveRecord::Migration[8.0]
  def change
    create_table :registro_glicosimetros do |t|
      t.string :marca
      t.boolean :status
      t.date :data

      t.timestamps
    end
  end
end
