class ChangeRequerimentoToPacienteOnEquipamentoPacientes < ActiveRecord::Migration[7.0]
  def change
    remove_reference :equipamento_pacientes, :requerimento, foreign_key: true, null: false
  end
end