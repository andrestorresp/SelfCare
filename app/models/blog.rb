class Blog < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  validates :title, length: { in: 12..40 }
  validates :comment, length: { maximum: 500 }
end
