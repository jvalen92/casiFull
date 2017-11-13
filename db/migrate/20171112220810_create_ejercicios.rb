class CreateEjercicios < ActiveRecord::Migration[5.1]
  def change
    create_table :ejercicios do |t|
      t.string :nombre
      t.string :musculo
      t.string :gif
      t.string :maquina
      t.string :repeticiones
      t.string :tiempo
      t.string :series
      t.references :rutina, foreign_key: true
      t.string :peso

      t.timestamps
    end
  end
end
