class Endereco < ApplicationRecord
  belongs_to :usuario
  validates :rua, presence: true
  validates :cidade, presence: true
  validates :cep, presence: true
end
