class HistoricoEntradaSaida < ApplicationRecord
  belongs_to :veiculo
  validates :veiculos_id, presence: false
  validates :dataEntrada, presence: false
  validates :dataSaida, presence: false
  validates :isEntrada, presence: false
end
