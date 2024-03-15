class Blog < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  validates :title, length: { in: 12..40 }
  validates :comment, length: { in: 100..250 }

  include PgSearch::Model
  pg_search_scope :search_blog,
    against: [ :title, :comment ],
    using: {
      tsearch: { prefix: true }
    }

end
