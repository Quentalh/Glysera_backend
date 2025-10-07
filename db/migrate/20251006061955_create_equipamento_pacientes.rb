class CreateEquipamentoPacientes < ActiveRecord::Migration[8.0]
  def change
    create_table :equipamento_pacientes do |t|
      t.date :data_de_recebimento

      t.timestamps
    end
  end
end
