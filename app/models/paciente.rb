class Paciente < ApplicationRecord
  belongs_to :endereco
  has_many :equipamento_pacientes, dependent: :destroy
  has_many :equipamentos, through: :equipamento_pacientes

  validates :nome, presence: true
  validates :nome_mae, presence: true
  validates :nome_social, presence: true
  validates :cpf, presence: true, uniqueness: true
  validates :nascimento_date, presence: true
  accepts_nested_attributes_for :endereco
end