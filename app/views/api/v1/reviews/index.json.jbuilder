json.reviews do
  json.array! @reviews do |review|
    json.extract! review, :id, :content, :rating
  end
end
