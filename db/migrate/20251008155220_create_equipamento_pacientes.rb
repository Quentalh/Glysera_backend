class CreateEquipamentoPacientes < ActiveRecord::Migration[8.0]
  def change
    create_table :equipamento_pacientes do |t|
      t.date :data_de_recebimento
      t.references :unidade_de_saude, null: false, foreign_key: true
      t.references :paciente, null: false, foreign_key: true
      t.references :equipamento, null: false, foreign_key: true
      t.references :requerimento, null: false, foreign_key: true

      t.timestamps
    end
  end
end
