class Patient < ApplicationRecord
  belongs_to :user
  has_many :consultations

  validates :alergy, :observation, presence: true
end
