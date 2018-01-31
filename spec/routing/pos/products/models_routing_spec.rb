require "rails_helper"

RSpec.describe Pos::Products::ModelsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/pos/products").to route_to("pos/products#index")
    end

    it "routes to #new" do
      expect(:get => "/pos/products/new").to route_to("pos/products#new")
    end

    it "routes to #show" do
      expect(:get => "/pos/products/1").to route_to("pos/products#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/pos/products/1/edit").to route_to("pos/products#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/pos/products").to route_to("pos/products#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/pos/products/1").to route_to("pos/products#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/pos/products/1").to route_to("pos/products#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/pos/products/1").to route_to("pos/products#destroy", :id => "1")
    end

  end
end
