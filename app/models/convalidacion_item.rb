class ConvalidacionItem < ApplicationRecord
  belongs_to :convalidacion, optional: true
  has_many :relacions
  has_many :asignaturas

  validates :asignatura_local_nombre, :asignatura_local_clave, :asignatura_local_creditos, presence: true
end
