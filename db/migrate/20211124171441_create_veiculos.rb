class CreateVeiculos < ActiveRecord::Migration[6.1]
  def change
    create_table :veiculos do |t|
      t.references :proprietario, null: false, foreign_key: true
      t.string :placa
      t.string :cor
      t.string :modelo

      t.timestamps
    end
  end
end
