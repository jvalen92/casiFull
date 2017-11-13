class Ejercicio < ApplicationRecord
  belongs_to :rutina

#validate rows params adding this at the end of the model.rb
validates_presence_of :nombre, :musculo, :maquina, :repeticiones, :series, :peso

end
