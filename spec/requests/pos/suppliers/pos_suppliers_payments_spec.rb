require 'rails_helper'

RSpec.describe "Pos::Suppliers::Payments", type: :request do
  describe "GET /pos_suppliers_payments" do
    it "works! (now write some real specs)" do
      get pos_suppliers_payments_path
      expect(response).to have_http_status(200)
    end
  end
end
