require "spec_helper"

describe ShippingAddressesController do
  describe "routing" do

    it "routes to #index" do
      get("/shipping_addresses").should route_to("shipping_addresses#index")
    end

    it "routes to #new" do
      get("/shipping_addresses/new").should route_to("shipping_addresses#new")
    end

    it "routes to #show" do
      get("/shipping_addresses/1").should route_to("shipping_addresses#show", :id => "1")
    end

    it "routes to #edit" do
      get("/shipping_addresses/1/edit").should route_to("shipping_addresses#edit", :id => "1")
    end

    it "routes to #create" do
      post("/shipping_addresses").should route_to("shipping_addresses#create")
    end

    it "routes to #update" do
      put("/shipping_addresses/1").should route_to("shipping_addresses#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/shipping_addresses/1").should route_to("shipping_addresses#destroy", :id => "1")
    end

  end
end
