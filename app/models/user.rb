class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :sap, presence: true, if: :is_doctor?

  validates :role, presence: true, inclusion: { in: %w(patient doctor)}

  scope :patient, -> { where("role = patient") }
  scope :doctor, -> { where("role = doctor") }

  private

  def is_doctor?
    role == 'doctor'
  end
end
