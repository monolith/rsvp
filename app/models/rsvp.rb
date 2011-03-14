class Rsvp < ActiveRecord::Base
  validates_presence_of  :name, :message => "is blank"
  validates_presence_of  :email, :message => "is blank"

  validates_format_of :email, :with => /^([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})$/i, :message => "doesn't look right"

  validates_uniqueness_of  :email, :message => "already used on another RSVP.  Are you trying to edit yours?"

  attr_accessible :name, :attending, :email, :mobile, :plus, :stay, :allergies, :food


  def validate
    errors.add_to_base "You didn't tell us if you're coming!" if attending.nil? or attending == ""


    if attending
      errors.add(:mobile, "is blank") if mobile.nil? or mobile == ""
      errors.add(:food, "preference not selected") if food.nil? or food == ""
    end
  end

end

