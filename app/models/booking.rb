class Booking < ApplicationRecord
  belongs_to :users
  belongs_to :pups
  has_many :reviews
end
