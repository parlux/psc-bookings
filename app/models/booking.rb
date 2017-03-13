class Booking < ApplicationRecord
  enum session_time: [ :morning, :afternoon, :all_day ]
  enum room: [ :room_1, :room_2, :room_3, :room_4 ]

  belongs_to :user

  alias_attribute :start_time, :session_date
end
