class Equipamento < ApplicationRecord
  has_many :equipamento_pacientes, dependent: :destroy
  has_many :observacoes, class_name: "Observacao", dependent: :destroy
  accepts_nested_attributes_for :observacoes, reject_if: :all_blank, allow_destroy: true
end