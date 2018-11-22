class AddImagesToPups < ActiveRecord::Migration[5.2]
  def change
    add_column :pups, :images, :text, array: true, default: []
  end
end
