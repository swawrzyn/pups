json.extract! @pup, :name, :location, :description, :image, :price, :avg_rating
  json.reviews @pup.bookings do |booking| #is pup.bookings.reviews or pup.reviews?
    json.extract! booking, :pup_id, :user_id, :time_start, :time_end, :accepted
    json.date review.created_at.strftime('%m/%d/%y')
  end

json.extract! @pup, :name, :location, :description, :image, :price, :avg_rating



# show the pups information
# post the
# new page
