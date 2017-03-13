class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.integer :room
      t.date :session_date
      t.integer :session_time
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
