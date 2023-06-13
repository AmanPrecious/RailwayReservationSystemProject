require 'rails_helper'

RSpec.describe "Seats", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/seat/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/seat/show"
      expect(response).to have_http_status(:success)
    end
  end

end
