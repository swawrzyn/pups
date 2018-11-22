json.pups do
  json.array! @pups do |pup|
    json.extract! pup, :id, :name, :location, :description, :images, :price, :avg_rating
  end
end
