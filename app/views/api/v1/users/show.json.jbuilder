json.user do
  json.extract! @user
  json.bookings @user.bookings do |booking|
    json.extract! booking, :time_start, :time_end, :accepted
    json.pup do
      json.extract! booking.pup, :id, :name, :location, :description, :image, :price, :avg_rating
        json.reviews booking.pup.reviews do |review|
            json.extract! review, :content, :rating
        end
    end
  end
  json.pups @user.pups do |pup|
    json.extract! pup, :name, :location, :description, :image, :price, :avg_rating
  end
  json.reviews @user.reviews do |review|
    json.extract! review, :user, :content, :rating
    json.date review.created_at.strftime('%m/%d/%y')
  end
end


