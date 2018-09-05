class Estudiante < ApplicationRecord
  belongs_to :persona
  has_many :carreras
  has_many :asignaturas, through: :carrera
  has_many :convalidacions
  
  
end
