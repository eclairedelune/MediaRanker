class User < ApplicationRecord
  has_many :votes
  has_many :listed_works, through: :votes, source: :work
  validates :username, uniqueness: true, presence: true
end
