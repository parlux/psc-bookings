require "rails_helper"

RSpec.describe BookingsController, :type => :controller do
  let(:booking) { instance_double(Booking, id: 3) }
  let(:user) { instance_double(User) }
  let(:booking_params) do
    {
      booking: {
        room: room,
        session_time: session_time,
        'session_date(1i)': year,
        'session_date(2i)': month,
        'session_date(3i)': date,
      }
    }
  end
  let(:room) { '0' }
  let(:session_time) { 'afternoon' }
  let(:year) { '2022' }
  let(:month) { '2' }
  let(:date) { '1' }
  let(:session_date) { 'session_date' }

  before do
    allow(Booking).to receive(:new).and_return(booking)
    allow(Booking).to receive(:find).with(booking.id.to_s).and_return(booking)
    allow(booking).to receive(:user).and_return(user)
  end

  describe 'GET new' do
    context 'When logged in' do
      login_random

      before do
        get :new
      end

      it 'renders the new template' do
        expect(response).to render_template("new")
      end

      it 'assigns booking' do
        expect(assigns(:booking)).to eq(Booking.new)
      end
    end

    context 'When not logged in' do
      before do
        get :new
      end

      it 'redirects to the login page' do
        expect(response).to redirect_to(new_user_session_url)
      end
    end
  end

  describe 'GET show' do
    login_user

    context "when user has sufficient priviledges" do
      before do
        allow(booking).to receive(:user).and_return(subject.current_user)
        get :show, params: { id: booking.id }
      end

      it 'renders the new template' do
        expect(response).to render_template("show")
      end

      it 'assigns booking' do
        expect(assigns(:booking)).to eq(booking)
      end
    end

    context "when user doesn't have priviledges" do
      before do
        get :show, params: { id: booking.id }
      end

      it 'redirects to the new bookings page' do
        expect(response).to redirect_to(root_url)
      end
    end
  end

  describe 'POST create' do
    login_user

    before do
      allow(booking).to receive(:room=)
      allow(booking).to receive(:session_time=)
      allow(booking).to receive(:session_date=)
      allow(booking).to receive(:user=)
      allow(booking).to receive(:save)
      allow(Date).to receive(:new).with(year.to_i, month.to_i, date.to_i).and_return(session_date)

      post :create, params: booking_params
    end

    it 'sets the booking room' do
      expect(booking).to have_received(:room=).with(room.to_i)
    end

    it 'sets the booking session time' do
      expect(booking).to have_received(:session_time=).with(session_time.to_i)
    end

    it 'sets the booking session date' do
      expect(booking).to have_received(:session_date=).with(session_date)
    end

    it 'sets the booking user' do
      expect(booking).to have_received(:user=).with(subject.current_user)
    end

    it 'saves the booking' do
      expect(booking).to have_received(:save)
    end

    it 'redirects to the show booking page' do
      expect(response).to redirect_to :action => :show, :id => booking.id
    end
  end
end
