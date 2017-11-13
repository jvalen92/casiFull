class Usuario < ApplicationRecord

 belongs_to :entrenador

#declare a model association adding this in the top of the model.rb
has_many :rutinas, dependent: :destroy


  #validate rows params adding this at the end of the model.rb
validates_presence_of :nombre, :password

end
