class BookingMailer < ApplicationMailer
  default from: 'anyone@psc-bookings.paulc.in'

  def bookings_email(user)
    @user = user
    mail(to: 'paulcarnibella@gmail.com', subject: 'You have a booking')
  end
end
