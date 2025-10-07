class Requerimento < ApplicationRecord
  belongs_to :paciente, foreign_key: "paciente_cpf", primary_key: "cpf"
  has_one :equipamento_paciente
  has_one :equipamento, through: :equipamento_paciente
end