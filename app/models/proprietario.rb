class Proprietario < ApplicationRecord
    validates :nome, presence: true
    validates :bloco, presence: true
    validates :apartamento, presence: true
    validates :morador, presence: true
end
