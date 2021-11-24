class HistoricoEntradaSaida < ApplicationRecord
  belongs_to :veiculo
  validates :veiculos_id, presence: true
  validates :dataEntrada, presence: true
  validates :dataSaida, presence: true
  validates :isEntrada, presence: true
end
