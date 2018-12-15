class CreateAtividades < ActiveRecord::Migration[5.1]
  def change
    create_table :atividades do |t|
      t.references :esporte, foreign_key: true
      t.references :usuario, foreign_key: true

      t.timestamps
    end
  end
end
