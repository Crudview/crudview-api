class RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :name, :image_url, :rating, :price, :address, :phone
end
