require 'rails_helper'

RSpec.describe "Tickets", type: :request do
  
  describe "GET /tickets" do
    context "authenticated user" do 
      before(:each) do 
        @user = FactoryBot.create(:user)
        sign_in @user
      end
      it "get ticket response" do
        train = FactoryBot.create(:train)
        ticket = FactoryBot.create(:ticket,user:@user,train:train)
        ticket = FactoryBot.create(:ticket,user:@user,train:train)
        get tickets_path
        expect(response).to have_http_status(302)
      end
    end
  end

  describe "GET /tickets/new" do
    it "works! (now write some real specs)" do
      get new_ticket_path
      expect(response).to have_http_status(302)
    end
    context "authenticated" do 
      before(:each) do 
        @user = FactoryBot.create(:user)
        sign_in @user
        
      end
      it "works! (now write some real specs)" do
        train = FactoryBot.create(:train)
        station = FactoryBot.create(:station)
        get new_ticket_path
        expect(response).to have_http_status(302)
      end
    end
  end

  describe "POST /tickets/create" do
    it "works! (now write some real specs)" do
      get new_ticket_path
      expect(response).to have_http_status(302)
    end
    context "authenticated" do 
      before(:each) do 
        @user = FactoryBot.create(:user)
        sign_in @user
        
      end
      it "works! (now write some real specs)" do
        train = FactoryBot.create(:train)
        ticket = FactoryBot.create(:ticket,user:@user,train:train)
        post tickets_path
        expect(response).to have_http_status(302)
      end
    end
  end


 
  describe "GET /tickets/:id" do
    context "authenticated user" do 
      before(:each) do 
        @user = FactoryBot.create(:user)
        sign_in @user
      end
      it "get ticket response" do
        train = FactoryBot.create(:train)
        ticket = FactoryBot.create(:ticket,user:@user,train:train)
        get ticket_path(id:ticket.id)
        expect(response).to have_http_status(302)
      end
    end
  end

end


