class User < ApplicationRecord
  has_many :pups, dependent: :destroy
  has_many :bookings
  has_many :reviews, through: :bookings
  validates :open_id, uniqueness: true, presence: true
end
