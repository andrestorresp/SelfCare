class Doctor < ApplicationRecord
  belongs_to :user
  has_many :consultations

  validates :specialty, :sap, presence: true
  validates :sap, uniqueness: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
