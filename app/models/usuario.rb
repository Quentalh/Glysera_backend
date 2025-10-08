class Usuario < ApplicationRecord
  has_secure_password

  validates :nome_usuario, presence: true, uniqueness: true
  validates :senha, presence: true, length: { minimum: 6 }, if: -> { new_record? || !senha.nil? }
end