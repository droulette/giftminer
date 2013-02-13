require 'test_helper'

class OcatOccasionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should save Ocat Occasions" do
    ocatsoccasion = OcatsOccasion.new
    ocatsoccasion.ocat_id = 1
    ocatsoccasion.occasion_id = 3
    assert ocatsoccasion.save, "ocatsoccasion could not be saved: #{ocatsoccasion.errors.full_messages.inspect}"
  end

  test "should not save ocatsoccasion" do
    ocatsoccasion = OcatsOccasion.new
    ocatsoccasion.ocat_id = 2
    assert !ocatsoccasion.save
  end
end
