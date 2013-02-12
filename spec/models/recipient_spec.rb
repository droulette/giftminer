require 'spec_helper'

describe Recipient do
  it 'shoul not create a blank recipient' do
    recipient = Recipient.new
    assert !recipient.save
  end
end
