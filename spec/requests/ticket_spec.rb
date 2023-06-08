require 'rails_helper'

RSpec.describe "Tickets", type: :request do
  
  describe "GET /tickets" do
    context "authenticated" do 
      before(:each) do 
        user = FactoryBot.create(:user)
        sign_in user
      end
      it "works! (now write some real specs)" do
        get tickets_path
        expect(response).to  have_http_status(302)
      end
    end
  end


  describe "POST /tickets/new" do
    it "works! (now write some real specs)" do
      get new_ticket_path
      expect(response).to  have_http_status(302)
    end
    context "authenticated" do 
      before(:each) do 
        user = FactoryBot.create(:user)
        sign_in user
        train = FactoryBot.create(:train)
        ticket = FactoryBot.create(:ticket,user:user,train:train)
      end
      it "works! (now write some real specs)" do
        get tickets_path
        expect(response).to  have_http_status(302)
      end
    end
  end

  






end


