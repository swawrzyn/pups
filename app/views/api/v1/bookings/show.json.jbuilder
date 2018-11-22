json.booking do
  json.extract! @booking, :user_id, :time_start, :time_end, :accepted
  json.pup do
    json.extract! @booking.pup, :name, :location, :description, :images, :price, :avg_rating
  end
end
