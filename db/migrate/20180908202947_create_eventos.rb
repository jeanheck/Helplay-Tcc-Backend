class CreateEventos < ActiveRecord::Migration[5.1]
  def change
    create_table :eventos do |t|
      t.string :descricao
      t.string :local
      t.datetime :dataHora
      t.text :informacoes
      t.references :usuario, foreign_key: true

      t.timestamps
    end
  end
end
