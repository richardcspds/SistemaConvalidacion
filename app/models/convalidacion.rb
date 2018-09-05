class Convalidacion < ApplicationRecord
  belongs_to :estudiante
  belongs_to :universidad
  has_many :asignaturas  
  has_many :convalidacion_items
  has_many :relacions, through :convalidacion_items

  accepts_nested_attributes_for :estudiante
end
