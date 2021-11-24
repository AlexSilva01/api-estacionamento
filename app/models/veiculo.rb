class Veiculo < ApplicationRecord
  belongs_to :proprietario
  validates :proprietario, presence: true
  validates :placa, presence: true
  validates :cor, presence: true
  validates :modelo, presence: true
end
