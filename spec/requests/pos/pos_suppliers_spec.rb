require 'rails_helper'

RSpec.describe "Pos::Suppliers", type: :request do
  describe "GET /pos_suppliers" do
    it "works! (now write some real specs)" do
      get pos_suppliers_path
      expect(response).to have_http_status(200)
    end
  end
end
