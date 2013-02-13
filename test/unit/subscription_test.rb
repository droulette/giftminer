require 'test_helper'

class SubscriptionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

    test "should save subscription" do
      subscription = Subscription.new
      subscription.stripe_customer_token = "fdfff34ffd"
      assert subscription.save, "subscription could not be saved: #{subscription.errors.full_messages.inspect}"
    end
  
    
end
