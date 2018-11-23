class Pup < ApplicationRecord
  include PgSearch
  pg_search_scope :search_by_name_and_location_and_description,
    against: [ :name, :location, :description ],
  using: {
    tsearch: { prefix: true }
  }

  belongs_to :user
  validates :name, uniqueness: true, presence: true
  validates :location, presence: true
  validates :description, presence: true
  validates :price, presence: true
  has_many :bookings
  has_many :reviews, ->(object) { where "bookings.user_id != #{object.user_id}" }, through: :bookings

  def avg_rating
    average = 0
    return average if reviews.count.zero?

    average.to_f
    reviews.each { |review| average += review.rating }
    (average / reviews.count).floor
  end

  def unavailable_dates
    unavailable_dates = []
    bookings.each do |booking|
      finished = false
      end_time = booking.time_end.to_date
      start_time = booking.time_start.to_date

      until finished
        unavailable_dates << end_time
        if end_time == start_time
          finished = true
        else
          end_time = end_time.prev_day
        end
      end
    end
    unavailable_dates.reverse
  end
end
