class Patient < ApplicationRecord
  belongs_to :user
  has_one :diagnosis
  has_many :consultations
end
