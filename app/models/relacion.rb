class Relacion < ApplicationRecord
  has_and_belongs_to_many :asignaturas
  has_many :convalidacions
end
