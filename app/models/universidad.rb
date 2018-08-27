class Universidad < ApplicationRecord
  has_many :carreras
  has_many :pensums, through: :carreras
  has_many :asignaturas, through: :pensums
  has_many :estudiantes, through: :carreras
  has_many :convalidacions

  mount_uploader :logo, LogoUploader
end
