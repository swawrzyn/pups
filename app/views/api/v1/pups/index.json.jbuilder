json.pups do
  json.array! @pups do |pup|
    json.extract! pup, :name, :location, :description, :image, :price, :avg_rating
  end
end
