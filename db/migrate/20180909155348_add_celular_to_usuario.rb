class AddCelularToUsuario < ActiveRecord::Migration[5.1]
  def change
    add_column :usuarios, :celular, :string
  end
end
