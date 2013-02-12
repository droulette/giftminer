require 'test_helper'

class RecipientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "should save recipient" do
    recipient = Recipient.new
    recipient.first_name = "Name"
    assert recipient.save, "Recipient could not be saved: #{recipient.errors.full_messages.inspect}"
  end

  test "should not save recipient" do
    recipient = Recipient.new

    assert !recipient.save
  end

end
