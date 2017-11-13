class Entrenador < ApplicationRecord

#declare a model association adding this in the top of the model.rb
has_many :usuarios, dependent: :destroy

#validate rows params adding this at the end of the model.rb
validates_presence_of :nombre, :password

end
