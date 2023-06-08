require 'rails_helper'

RSpec.describe "Passengers", type: :request do
 
  describe "GET /passenger" do
    context "authenticated" do 
      before(:each) do 
        user = FactoryBot.create(:user)
        sign_in user
        train = FactoryBot.create(:train)
        ticket= FactoryBot.create(:ticket,train:train,user:user)
        passenger = FactoryBot.create(:passenger,ticket:ticket)
      end
      it "works! (now write some real specs)" do
        get passenger_path
        expect(response).to  have_http_status(302)
      end
    end
  end


  
end


