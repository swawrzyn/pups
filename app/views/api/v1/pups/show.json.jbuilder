json.extract! @pup, :id, :name, :location, :description, :lat, :long, :images, :price, :avg_rating, :unavailable_dates

  json.user @pup.user
    json.extract! @pup.user
      json.reviews @pup.reviews do |review|
        json.extract! review, :content, :rating
        json.extract! review.user, :id, :avatarUrl, :nickName
        json.date review.created_at.strftime('%m/%d/%y')
    end



