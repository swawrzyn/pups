json.user do
  json.extract! @user
  json.bookings @user.bookings do |booking|
    json.extract! booking, :pup_id, :time_start, :time_end, :accepted
  end
  json.pups @user.pups do |pup|
      json.extract! pup, :name, :location, :description, :image, :price, :avg_rating
  end
end

