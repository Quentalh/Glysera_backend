# app/models/observacao.rb

class Observacao < ApplicationRecord
  self.table_name = "observacoes"

  belongs_to :equipamento
  has_one_attached :arquivo
end