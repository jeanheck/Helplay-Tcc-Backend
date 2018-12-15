class CreateEsportes < ActiveRecord::Migration[5.1]
  def change
    create_table :esportes do |t|
      t.string :nome

      t.timestamps
    end
  end
end
