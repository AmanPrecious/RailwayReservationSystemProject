require 'rails_helper'

RSpec.describe "Stations", type: :request do
 
  describe "GET /stations" do
    context "authenticated" do 
      before(:each) do 
        user = FactoryBot.create(:user)
        sign_in user
        station = FactoryBot.create(:station)
      end
      it "works! (now write some real specs)" do
        get  admin_stations_path
        expect(response).to have_http_status(302)
      end
    end
  end
end
