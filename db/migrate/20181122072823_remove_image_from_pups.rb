class RemoveImageFromPups < ActiveRecord::Migration[5.2]
  def change
    remove_column :pups, :image
  end
end
