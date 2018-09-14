class Estudiante < ApplicationRecord
  belongs_to :persona, optional: true
  has_many :carreras
  has_many :asignaturas, through: :carrera
  has_many :convalidacions

  validates :nombres, presence: true
  validates :apellidos, presence: true
  validates :matricula, presence: true
  
end
