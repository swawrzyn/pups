json.extract! @user, :id
json.users @user.reviews do |review|
  json.extract! review, :id, :content, :rating, :booking
  json.date comment.created_at.strftime("%m/%d/%y")
end
