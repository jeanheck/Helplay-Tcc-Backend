class CreateParticipantes < ActiveRecord::Migration[5.1]
  def change
    create_table :participantes do |t|
      t.references :evento, foreign_key: true
      t.references :usuario, foreign_key: true

      t.timestamps
    end
  end
end
