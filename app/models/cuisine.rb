class Cuisine < ApplicationRecord
  has_many :review_cuisines
  has_many :reviews, through: :review_cuisines
  has_many :restaurants, through: :reviews

  before_save { self.name = name.upcase_first }
  validates :name, uniqueness: { case_sensitive: false }

end
