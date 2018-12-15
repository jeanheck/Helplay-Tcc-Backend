class AddPublicoToEvento < ActiveRecord::Migration[5.1]
  def change
    add_column :eventos, :publico, :boolean
  end
end
