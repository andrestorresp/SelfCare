class User < ApplicationRecord
  has_many :blogs
  has_one :doctor
  has_one :patient
  has_one_attached :photo

  validates :first_name, :last_name, :dni, :phone_number, :age, presence: true
  validates :role, inclusion: { in: [true, false], message: "%{value} Only true allowed" }
  validates :dni, :phone_number, uniqueness: true
  validates :dni, numericality: { only_integer: true }
  validates :age, numericality: { only_integer: true }
  validates :photo, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

end
