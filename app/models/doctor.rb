class Doctor < ApplicationRecord
  belongs_to :user
  has_many :consultations

  validates :specialty, :sap, presence: true
  validates :sap, uniqueness: true
end
