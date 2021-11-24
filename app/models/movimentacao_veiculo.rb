class MovimentacaoVeiculo < ApplicationRecord
  belongs_to :historico_entrada_saida
  validates :historico_entrada_saida, presence: true
end
