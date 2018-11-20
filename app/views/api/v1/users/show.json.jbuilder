json.user do
  json.extract! @user
  json.bookings @user.bookings do |booking|
    json.extract! booking, :time_start, :time_end, :accepted
    json.pup do
      json.extract! booking.pup, :id, :name, :location, :description, :image, :price, :avg_rating
    end
  end
  json.pups @user.pups do |pup|
      json.extract! pup, :name, :location, :description, :image, :price, :avg_rating
  end
end

