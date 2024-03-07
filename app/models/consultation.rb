class Consultation < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor
  has_one_attached :photo
end
