class Endereco < ApplicationRecord
  has_many :pacientes
  has_many :unidade_de_saudes
  validates :rua, presence: true
  validates :cidade, presence: true
  validates :bairro, presence: true
  validates :cep, presence: true
end
