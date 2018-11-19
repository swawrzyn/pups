class Pup < ApplicationRecord
  belongs_to :user
  validates :name, uniqueness: true, presence: true
  validates :location, presence: true
  validates :description, presence: true
  validates :price, presence: true
  has_many :bookings
  has_many :reviews, ->(object) { where "bookings.user_id != #{object.user_id}" }, through: :bookings
end
