class Booking < ApplicationRecord
  belongs_to :pup
  belongs_to :user
  has_many :reviews
  validates :pup, presence: true
  validates :user, presence: true
  validates :time_start, presence: true
  validates :time_end, presence: true
end
