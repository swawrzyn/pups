class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.boolean :accepted
      t.timestamp :time_start
      t.timestamp :time_end
      t.references :pup, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
