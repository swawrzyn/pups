json.booking do
  json.extract! @booking, :user_id, :time_start, :time_end, :accepted
  json.pup do
    json.extract! @booking.pup, :name, :location, :description, :image, :price, :avg_rating
  end
end
