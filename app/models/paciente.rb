class Paciente < ApplicationRecord
  validates :nome, presence: true
  validates :nome_mae, presence: true
  validates :nome_social, presence: true
  validates :cpf  presence: true
  validates :nascimento, presence: true
end
