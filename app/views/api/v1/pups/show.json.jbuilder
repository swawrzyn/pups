json.extract! @pup, :id, :name, :location, :description, :image, :price, :avg_rating, :unavailable_dates
  json.reviews @pup.reviews do |review| #is pup.bookings.reviews or pup.reviews?
    json.extract! review, :content, :rating
    json.date review.created_at.strftime('%m/%d/%y')
  end


