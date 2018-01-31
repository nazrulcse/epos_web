require 'rails_helper'

RSpec.describe "Pos::Suppliers::PurchaseItems", type: :request do
  describe "GET /pos_suppliers_purchase_items" do
    it "works! (now write some real specs)" do
      get pos_suppliers_purchase_items_path
      expect(response).to have_http_status(200)
    end
  end
end
