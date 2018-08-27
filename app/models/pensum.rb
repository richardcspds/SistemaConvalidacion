class Pensum < ApplicationRecord
  belongs_to :universidad
  belongs_to :carrera
  has_many :asignaturas
end
