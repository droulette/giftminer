require 'test_helper'

class OcatOccassionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should save Ocat Occassions" do
    ocatsoccassion = OcatsOccassion.new
    ocatsoccassion.ocat_id = 1
    ocatsoccassion.occassion_id = 3
    assert ocatsoccassion.save, "ocatsoccassion could not be saved: #{ocatsoccassion.errors.full_messages.inspect}"
  end

  test "should not save ocatsoccassion" do
    ocatsoccassion = OcatsOccassion.new
    ocatsoccassion.ocat_id = 2
    assert !ocatsoccassion.save
  end
end
