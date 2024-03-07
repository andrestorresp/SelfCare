class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :sap, presence: true, if: :doctor?

  validates :role, presence: true, inclusion: { in: ['patient', 'doctor'] }

  scope :patient, -> { where("role = patient") }
  scope :doctor, -> { where("role = doctor") }

  private

  def doctor?
    role == 'doctor'
  end
end
