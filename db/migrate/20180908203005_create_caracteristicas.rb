class CreateCaracteristicas < ActiveRecord::Migration[5.1]
  def change
    create_table :caracteristicas do |t|
      t.string :descricao
      t.references :esporte, foreign_key: true

      t.timestamps
    end
  end
end
