require "rails_helper"

RSpec.describe Pos::Customers::InvoiceItemsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/pos/customers").to route_to("pos/customers#index")
    end

    it "routes to #new" do
      expect(:get => "/pos/customers/new").to route_to("pos/customers#new")
    end

    it "routes to #show" do
      expect(:get => "/pos/customers/1").to route_to("pos/customers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/pos/customers/1/edit").to route_to("pos/customers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/pos/customers").to route_to("pos/customers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/pos/customers/1").to route_to("pos/customers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/pos/customers/1").to route_to("pos/customers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/pos/customers/1").to route_to("pos/customers#destroy", :id => "1")
    end

  end
end
