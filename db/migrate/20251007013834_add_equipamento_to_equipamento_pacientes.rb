class AddEquipamentoToEquipamentoPacientes < ActiveRecord::Migration[8.0]
  def change
    add_reference :equipamento_pacientes, :equipamento, null: false, foreign_key: true
  end
end
