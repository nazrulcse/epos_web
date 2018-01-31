require 'rails_helper'

RSpec.describe "Pos::Suppliers::Purchases", type: :request do
  describe "GET /pos_suppliers_purchases" do
    it "works! (now write some real specs)" do
      get pos_suppliers_purchases_path
      expect(response).to have_http_status(200)
    end
  end
end
