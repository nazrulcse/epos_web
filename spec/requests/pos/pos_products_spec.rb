require 'rails_helper'

RSpec.describe "Pos::Products", type: :request do
  describe "GET /pos_products" do
    it "works! (now write some real specs)" do
      get pos_products_path
      expect(response).to have_http_status(200)
    end
  end
end
