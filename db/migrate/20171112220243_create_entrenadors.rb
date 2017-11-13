class CreateEntrenadors < ActiveRecord::Migration[5.1]
  def change
    create_table :entrenadors do |t|
      t.string :nombre
      t.string :password

      t.timestamps
    end
  end
end
