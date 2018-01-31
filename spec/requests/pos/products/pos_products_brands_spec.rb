require 'rails_helper'

RSpec.describe "Pos::Products::Brands", type: :request do
  describe "GET /pos_products_brands" do
    it "works! (now write some real specs)" do
      get pos_products_brands_path
      expect(response).to have_http_status(200)
    end
  end
end
