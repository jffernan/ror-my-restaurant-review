class Review < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  has_many :review_cuisines, dependent: :delete_all
  has_many :cuisines, through: :review_cuisines
  #accepts_nested_attributes_for :cuisines, reject_if: :all_blank #reject_if: proc { |cuisines| cuisines['name'].blank? }

  before_save { self.restaurant_name = restaurant_name.upcase_first }

  validates_presence_of :restaurant_name, :date_visited, :rating

  validates :content, presence: true, length: { minimum: 10 }

  def restaurant_name #No db column for restaurant_name in Reviews table
    self.restaurant.name if self.restaurant
  end

  def restaurant_name=(name) #custom attribute writer to nested form for new Review (child)
     self.restaurant = Restaurant.find_or_create_by(name: name) #Restaurant (parent)
  end

  def cuisines_attributes=(cuisine_attributes) #custom attribute writer to save attr through Cuisine (parent); colc not needed for CAW.
    cuisine_attributes.values.each do |cuisine_attribute| #shadowing attr cuisine-name to check Cuisine exists & in-memory for Review model.
      cuisine = Cuisine.find_or_create_by(cuisine_attribute) #avoid duplicate cuisines
      self.cuisines << cuisine
    end
  end

  def self.by_user(user_id) #For filter search by User
    where(user: user_id)
  end

  def self.top_reviews(rating) #Top reviews where Excellent rating
    where(rating: "Excellent")
  end

  def self.order_by_date_visited
    Review.order(date_visited: :desc) #ActiveRecord method to order by most recent visit date
  end

end
