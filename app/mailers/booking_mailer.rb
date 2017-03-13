class BookingMailer < ApplicationMailer
  default from: 'bookings@psc-bookings.paulc.in',
          to: ENV["ADMIN_EMAILS"] || 'test@test.com'

  def booking_email(user:)
    @user = user
    mail(subject: 'You have a booking')
  end
end
