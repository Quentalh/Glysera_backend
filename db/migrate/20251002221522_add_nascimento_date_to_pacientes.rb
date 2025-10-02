class AddNascimentoDateToPacientes < ActiveRecord::Migration[8.0]
  def change
    add_column :pacientes, :nascimento_date, :date
  end
end
