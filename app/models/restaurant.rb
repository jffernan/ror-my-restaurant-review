class Restaurant < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews
  has_many :cuisines, through: :reviews

  before_save { self.name = name.upcase_first }
  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }

  def restaurant_name
    self.restaurant.name if self.restaurant
  end

  def restaurant_name=(name)
     self.restaurant = Restaurant.find_or_create_by(name: name)
  end

  def self.alphabetical_order #ActiveRecord method to alphabetize list
    Restaurant.order(:name) #Alphabetize by Restaurant name
  end

end
