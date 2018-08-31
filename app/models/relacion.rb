class Relacion < ApplicationRecord
  has_and_belongs_to_many :asignaturas
  has_many :convalidacions
  
  # validate :presence_home, :presence_a
  validates :asignatura_home_id, presence: true
  validates :asignatura_a_procedencia_id, presence: true

  # private 

  # def presence_home
  #   if self.asignatura_home_id_before_last_save == nil
  #     errors.add(:asignatura_home_id_before_last_save, "Asignatura Home no puede estar en blanco")
  #   end
  # end

  # def presence_a
  #   if self.asignatura_a_procedencia_id_before_last_save == nil
  #     errors.add(:asignatura_home_id_before_last_save, "Asignatura a no puede estar en blanco")
  #   end
  # end

end
