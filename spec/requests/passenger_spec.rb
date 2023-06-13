require 'rails_helper'

RSpec.describe "Passengers", type: :request do
 
  describe "GET /passenger" do
    context "authenticated" do 
      before(:each) do
        @user = FactoryBot.create(:user)
        sign_in @user
      end
      it "works! (now write some real specs)" do
        train = FactoryBot.create(:train)
        ticket= FactoryBot.create(:ticket,train:train,user:@user)
        passenger = FactoryBot.create(:passenger,ticket:ticket)
        get ticket_passengers_path(ticket_id:ticket.id)
        expect(response).to have_http_status(302)
      end
    end
  end
end


