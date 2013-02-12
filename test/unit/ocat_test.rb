require 'test_helper'

class OcatTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should save ocat" do
    ocat = Ocat.new
    ocat.category = "Hello"
    ocat.description = "hi"
    assert ocat.save, "ocat could not be saved: #{ocat.errors.full_messages.inspect}"
  end

  test "should not save ocat" do
    ocat = Ocat.new
    ocat.category = "Hello"
    assert !ocat.save
  end

end
