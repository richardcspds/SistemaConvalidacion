class ConvalidacionItem < ApplicationRecord
  belongs_to :convalidacion
  has_many :asignaturas
end
