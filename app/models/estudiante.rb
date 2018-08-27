class Estudiante < ApplicationRecord
  belongs_to :persona
  belongs_to :carrera
  has_many :asignaturas, through: :carrera
end
