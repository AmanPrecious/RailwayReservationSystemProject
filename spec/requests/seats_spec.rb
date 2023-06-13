require 'rails_helper'

RSpec.describe "Seats", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/seats/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/seats/show"
      expect(response).to have_http_status(:success)
    end
  end

end
