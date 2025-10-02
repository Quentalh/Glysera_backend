class Endereco < ApplicationRecord
  has_many :pacientes
  validates :rua, presence: true
  validates :cidade, presence: true
  validates :bairro, presence: true
  validates :cep, presence: true
end
