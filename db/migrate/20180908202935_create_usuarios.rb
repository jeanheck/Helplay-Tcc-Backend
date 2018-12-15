class CreateUsuarios < ActiveRecord::Migration[5.1]
  def change
    create_table :usuarios do |t|
      t.string :nome
      t.date :dataNascimento
      t.string :sexo
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
