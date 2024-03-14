class Consultation < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor

  validates :diagnostic, presence: true
end
