require 'test_helper'

class RsvpTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Rsvp.new.valid?
  end
end
