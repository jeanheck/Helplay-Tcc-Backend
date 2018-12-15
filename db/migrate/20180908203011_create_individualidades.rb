class CreateIndividualidades < ActiveRecord::Migration[5.1]
  def change
    create_table :individualidades do |t|
      t.references :atividade, foreign_key: true
      #t.string :caracteristica
      t.references :caracteristica, foreign_key: true

      t.timestamps
    end
  end
end
