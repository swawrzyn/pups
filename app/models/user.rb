class User < ApplicationRecord
  has_many :pups, dependent: :destroy
  validates :open_id, uniqueness: true, presence: true
end
