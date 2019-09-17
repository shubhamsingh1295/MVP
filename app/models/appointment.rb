class Appointment < ApplicationRecord
  belongs_to :doctor, :class_name => "User"
  belongs_to :patient, :class_name => "User"


  default_scope { active }

  scope :active, -> { where(is_accepted: true) }
end
