json.user do
  json.extract! @user, :open_id, :avatarUrl, :nickName
  json.bookings @user.bookings do |booking|
    json.extract! booking, :id, :time_start, :time_end, :accepted
    json.pup do
      json.extract! booking.pup, :id, :name, :location, :description, :images, :price, :avg_rating
        json.reviews booking.pup.reviews do |review|
            json.extract! review, :content, :rating
        end
    end
  end
  json.pups @user.pups do |pup|
    json.extract! pup, :name, :location, :description, :images, :price, :avg_rating
      json.bookings pup.bookings do |booking|
        json.extract! booking, :user_id, :time_start, :time_end, :accepted
      end
  end
  json.reviews @user.reviews do |review|
    json.extract! review, :user, :content, :rating
    json.date review.created_at.strftime('%m/%d/%y')
  end
end


