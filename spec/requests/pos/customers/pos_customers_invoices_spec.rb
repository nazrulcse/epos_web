require 'rails_helper'

RSpec.describe "Pos::Customers::Invoices", type: :request do
  describe "GET /pos_customers_invoices" do
    it "works! (now write some real specs)" do
      get pos_customers_invoices_path
      expect(response).to have_http_status(200)
    end
  end
end
