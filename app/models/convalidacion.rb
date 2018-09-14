class Convalidacion < ApplicationRecord
  belongs_to :estudiante, optional: true
  belongs_to :universidad, optional: true
  has_many :convalidacion_items
  has_many :asignaturas, through: :convalidacion_items
  has_many :relacions, through: :convalidacion_items

  accepts_nested_attributes_for :estudiante                                
  accepts_nested_attributes_for :convalidacion_items
                                

  validates :universidad_home_id, presence: true
  validates :universidad_procedencia_id, presence:true
  validate :total_credit_values_valid?
  
  validates_associated :convalidacion_items

  def total_credit_values_valid?
    
    if total_creditos_home <= total_creditos_procedencia
      return true
    else 
      errors.add(:total_creditos_home, "- El total de creditos convalidables debe ser mayor al total de creditos convalidados")
      return false
    end
  end
end
