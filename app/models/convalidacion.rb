class Convalidacion < ApplicationRecord
  belongs_to :estudiante
  belongs_to :universidad
  has_many :asignaturas
  has_many :relacions
end
