class Usuario < ApplicationRecord
  #has_many :endereco, dependent: destroy
  validates :nome, presence: true
  validates :email, presence: true, uniqueness: true
end
