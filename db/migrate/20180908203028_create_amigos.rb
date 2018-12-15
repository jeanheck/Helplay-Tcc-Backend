class CreateAmigos < ActiveRecord::Migration[5.1]
  def change
    create_table :amigos do |t|
      t.references :usuarioUm#, foreign_key: true
      t.references :usuarioDois#, foreign_key: true

      add_foreign_key :amigos, :usuarios, column: :usuarioUm_id#, primary_key: :id
      add_foreign_key :amigos, :usuarios, column: :usuarioDois_id#, primary_key: :id

      t.timestamps
    end
  end
end
