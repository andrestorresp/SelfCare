class User < ApplicationRecord
  has_many :blogs
  has_many :doctors
  has_many :patients
  has_one_attached :photo

  validates :first_name, :last_name, :address, :dni, :phone_number, :age, presence: true
  validates :role, inclusion: { in: [true, false], message: "%{value} Only true allowed" }
  validates :dni, :phone_number, uniqueness: true
  validates :dni, numericality: { only_integer: true }
  validates :age, numericality: { only_integer: true }
  validates :photo, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
