class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :work #what more can I add here? maybe refer to counter?
  validates :user #scope
end
