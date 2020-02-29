class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :comment
  belongs_to :restaurant
  belongs_to :user
end
