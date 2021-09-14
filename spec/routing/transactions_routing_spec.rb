require "rails_helper"

RSpec.describe TransactionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/payer_balances").to route_to("transactions#index")
    end

    it "routes to #create_t" do
      expect(post: "/add_transaction").to route_to("transactions#create_t")
    end

    it "routes to #spend_points" do
      expect(post: "/spend_points").to route_to("transactions#spend_pts")
    end

  end
end
