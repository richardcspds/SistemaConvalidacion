class Relacion < ApplicationRecord
  has_and_belongs_to_many :asignaturas
  has_many :convalidacions
  
  # validate presence of required fields
  validates :asignatura_home_id, presence: true
  validates :asignatura_a_procedencia_id, presence: true
  # validates :universidad_local_id, presence: true
  # validates :carrera_local_id, presence: true
  # validates :pensum_local_id, presence: true
  # validates :universidad_procedencia_id, presence: true
  # validates :carrera_procedencia_id, presence: true
  # validates :pensum_procedencia_id, presence: true
  # validates :asignatura_a_procedencia_creditos_id, presence: true, numericality: true, length: {minimum: 1, maximum: 15}
  # validates :asignatura_b_procedencia_creditos_id, numericality: true, length: {minimum: 1, maximum: 15}
  

  # private 

    # def has_credits?
        
    # end

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
