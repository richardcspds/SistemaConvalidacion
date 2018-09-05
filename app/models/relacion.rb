class Relacion < ApplicationRecord
  has_and_belongs_to_many :asignaturas
  has_many :convalidacions
  
  # validate presence of required fields
  validates :asignatura_home_id, presence: true
  validates :asignatura_a_procedencia_id, presence: true
  # , if: :credit_values_valid
  # validates :universidad_local_id, presence: true
  # validates :carrera_local_id, presence: true
  # validates :pensum_local_id, presence: true
  # validates :universidad_procedencia_id, presence: true
  # validates :carrera_procedencia_id, presence: true
  # validates :pensum_procedencia_id, presence: true
  # validates :asignatura_a_procedencia_creditos_id, presence: true, numericality: true, length: {minimum: 1, maximum: 15}
  # validates :asignatura_b_procedencia_creditos_id, numericality: true, length: {minimum: 1, maximum: 15}
   

  # def credit_values_valid 
  #   creditos_asignatura_a = Asignatura.find(:asignatura_a_procedencia_id).creditos
  #   cretidos_asignatura_home = Asignatura.find(:asignatura_home_id).creditos
  #   if :asignatura_a_procedencia_id == nil
  #     creditos_asignatura_a >= cretidos_asignatura_home - 1
  #     return true
  #   else
  #     creditos_asignatura_b = Asignatura.find(:asignatura_b_procedencia_id).creditos
  #     creditos_asignatura_a + creditos_asignatura_b >= cretidos_asignatura_home
  #     return false
  #   end
  # end
end