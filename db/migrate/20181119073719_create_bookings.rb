class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.pup :references
      t.user :references
      t.timestamp :time_start
      t.timestamp :time_end

      t.timestamps
    end
  end
end
