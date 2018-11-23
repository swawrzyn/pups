class AddLatAndLongToPups < ActiveRecord::Migration[5.2]
  def change
    add_column :pups, :lat, :float, default: nil
    add_column :pups, :long, :float, default: nil
  end
end
