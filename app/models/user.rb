class User < ApplicationRecord
  has_many :blogs
  has_many :doctors
  has_many :patients
  has_one_attached :photo

  validates :role, :first_name, :last_name, :address, :dni, :phone_number, :age, presence: true
  validates :dni, :phone_number, uniqueness: true
  validates :dni, numericality: { only_integer: true }
  validates :age, numericality: { only_integer: true }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
