class CreateRutinas < ActiveRecord::Migration[5.1]
  def change
    create_table :rutinas do |t|
      t.string :tipo
      t.references :usuario, foreign_key: true

      t.timestamps
    end
  end
end
