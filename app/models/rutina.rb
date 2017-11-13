class Rutina < ApplicationRecord
  belongs_to :usuario

  #declare a model association adding this in the top of the model.rb
has_many :ejercicios, dependent: :destroy

#validate rows params adding this at the end of the model.rb
validates_presence_of :tipo




end
