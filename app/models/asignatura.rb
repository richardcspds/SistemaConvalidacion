class Asignatura < ApplicationRecord
  belongs_to :pensum
  has_many :relacion
end
