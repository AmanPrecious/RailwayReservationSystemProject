require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe 'GET home#index' do
   before(:example) { get root_path }  # get(:index)
    it "is a success" do
      expect(response).to have_http_status(:ok)
     end
    it "renders 'index' template" do
      get '/'
      expect(response).to render_template('index')
    end
  end

  describe 'GET home#search' do
  before(:example) { get search_path }  # get(:search)
   it "is a success" do
     expect(response).to have_http_status(:ok)
    end
   it "renders 'search' template" do
     get '/search/'
     expect(response).to render_template('search')
   end
 end


end
