class CreateHistoricoEntradaSaidas < ActiveRecord::Migration[6.1]
  def change
    create_table :historico_entrada_saidas do |t|
      t.references :veiculo, null: false, foreign_key: true
      t.timestamp :dataEntrada
      t.timestamp :dataSaida
      t.boolean :isEntrada

      t.timestamps
    end
  end
end
