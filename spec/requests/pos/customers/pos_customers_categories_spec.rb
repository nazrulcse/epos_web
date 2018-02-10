require 'rails_helper'

RSpec.describe "Pos::Customers::Categories", type: :request do
  describe "GET /pos_customers_categories" do
    it "works! (now write some real specs)" do
      get pos_customers_categories_path
      expect(response).to have_http_status(200)
    end
  end
end
