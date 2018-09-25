class Recipe < ApplicationRecord
  paginates_per 20

  scope :search, -> (keyword) { where('title ILIKE ?', "%#{keyword}%") if keyword.present? }

  validates :title, :href, presence: true
  validates :href, uniqueness: true
end
