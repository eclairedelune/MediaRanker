class Work < ApplicationRecord
  validates :title, presence: true
  validates :category, presence: true, inclusion: { in: %w(movie book album)}
end
