class Blog < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  validate :image_validation
  validates :title, length: { in: 12..40 }
  validates :comment, length: { in: 100..250 }

  def image_validation
    unless Rails.env.development?
      self.photo.attached?
    end
  end
end
