class EquipamentoPaciente < ApplicationRecord
  belongs_to :paciente
  belongs_to :equipamento
  belongs_to :unidade_de_saude
end