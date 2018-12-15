class AddInseridaPeloUsuarioToCaracteristica < ActiveRecord::Migration[5.1]
  def change
    add_column :caracteristicas, :inseridaPeloUsuario, :boolean
  end
end
