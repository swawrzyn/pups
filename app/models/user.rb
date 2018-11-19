class User < ApplicationRecord
  has_many :pups, dependent: :destroy
end
