class CreateMovimentacaoVeiculos < ActiveRecord::Migration[6.1]
  def change
    create_table :movimentacao_veiculos do |t|
      t.references :historico_entrada_saidas, null: false, foreign_key: true

      t.timestamps
    end
  end
end
