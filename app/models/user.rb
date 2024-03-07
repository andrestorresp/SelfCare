class User < ApplicationRecord
  has_many :blogs
  has_many :doctors
  has_many :patients
  has_one_attached :photo

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
