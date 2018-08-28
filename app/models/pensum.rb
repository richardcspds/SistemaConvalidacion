class Pensum < ApplicationRecord
  belongs_to :carrera
  has_many :asignaturas
end
