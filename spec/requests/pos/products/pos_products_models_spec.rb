require 'rails_helper'

RSpec.describe "Pos::Products::Models", type: :request do
  describe "GET /pos_products_models" do
    it "works! (now write some real specs)" do
      get pos_products_models_path
      expect(response).to have_http_status(200)
    end
  end
end
