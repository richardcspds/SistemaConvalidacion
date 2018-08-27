class Relacion < ApplicationRecord
  has_many :asignaturas
  has_many :convalidacions
end
