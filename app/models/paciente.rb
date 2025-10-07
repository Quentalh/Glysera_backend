class Paciente < ApplicationRecord
  belongs_to :endereco
  has_one :requerimento, foreign_key: "paciente_cpf", primary_key: "cpf"
  has_one :equipamento, through: :requerimento
  validates :nome, presence: true
  validates :nome_mae, presence: true
  validates :nome_social, presence: true
  validates :cpf, presence: true, uniqueness: true
  validates :nascimento_date, presence: true
  accepts_nested_attributes_for :endereco
end
