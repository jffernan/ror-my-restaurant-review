class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :restaurant_name, :content, :cuisines, :rating, :date_visited, :updated_at
  belongs_to :user
  belongs_to :restaurant
end
