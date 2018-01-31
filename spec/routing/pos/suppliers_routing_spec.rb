require "rails_helper"

RSpec.describe Pos::SuppliersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/pos/suppliers").to route_to("pos/suppliers#index")
    end

    it "routes to #new" do
      expect(:get => "/pos/suppliers/new").to route_to("pos/suppliers#new")
    end

    it "routes to #show" do
      expect(:get => "/pos/suppliers/1").to route_to("pos/suppliers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/pos/suppliers/1/edit").to route_to("pos/suppliers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/pos/suppliers").to route_to("pos/suppliers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/pos/suppliers/1").to route_to("pos/suppliers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/pos/suppliers/1").to route_to("pos/suppliers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/pos/suppliers/1").to route_to("pos/suppliers#destroy", :id => "1")
    end

  end
end
