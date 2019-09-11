class Article < ApplicationRecord
  belongs_to :author, class_name: 'User'

  validates :title,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { within: 2..100 }
  validates :body, presence: true, length: { minimum: 100 }
  validates :image_url, presence: true, length: { minimum: 10 }
end
