class Carrera < ApplicationRecord
  belongs_to :universidad
  has_many :pensums
  has_many :asignaturas, through: :pensums
  has_many :estudiantes
end
