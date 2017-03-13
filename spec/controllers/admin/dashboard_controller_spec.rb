require "rails_helper"

RSpec.describe Admin::DashboardController, :type => :controller do
  context 'When logged in as admin' do
    login_admin
    let(:unordered_bookings) { double('Bookings', order: bookings) }
    let(:bookings) { [ instance_double(Booking), instance_double(Booking)] }

    before do
      allow(Booking).to receive(:all).and_return(unordered_bookings)
    end

    describe 'GET index' do
      before do
        get :index
      end

      it 'renders the index template' do
        expect(response).to render_template("index")
      end

      it 'assigns bookings' do
        expect(assigns(:bookings)).to eq(bookings)
      end
    end
  end

  context 'When not logged in' do
    describe 'GET index' do
      subject { get :index }

      it 'redirects back to the home page' do
        expect(subject).to redirect_to(new_user_session_url)
      end
    end
  end

  context 'When insufficient priviledges' do
    login_user

    describe 'GET index' do
      subject { get :index }

      it 'redirects back to the home page' do
        expect(subject).to redirect_to(root_url)
      end
    end
  end
end
