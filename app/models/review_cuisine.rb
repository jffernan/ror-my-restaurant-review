class ReviewCuisine < ApplicationRecord
  belongs_to :review
  belongs_to :cuisine
end
