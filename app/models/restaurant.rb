class Restaurant < ApplicationRecord
  has_many :reviews
  has_many :users, through: :review
end
