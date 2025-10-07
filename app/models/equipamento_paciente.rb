class EquipamentoPaciente < ApplicationRecord
  belongs_to :requerimento
  belongs_to :equipamento
  belongs_to :unidade_de_saude
end