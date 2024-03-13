class Doctor < ApplicationRecord
  belongs_to :user
  has_many :consultations

  validates :specialty, :sap, presence: true
  validates :sap, uniqueness: true

  # Método para mostrar el nombre completo de los doctores
  def full_name
    "#{user.first_name} #{user.last_name}"
  end
end
