require 'rails_helper'
RSpec.describe "Trains", type: :request do

  describe "GET /trains" do
    context "authenticated" do 
      before(:each) do 
        user = FactoryBot.create(:user)
        sign_in user
        train = FactoryBot.create(:train)
      end
      it "works! (now write some real specs)" do
        get trains_path
        expect(response).to  have_http_status(302)
      end
    end
  end
 
end

