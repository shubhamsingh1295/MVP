class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
	
	has_many :doctor_appointments, :class_name => "Appointment", :foreign_key => "doctor_id"
  has_many :patient_appointments, :class_name => "Appointment", :foreign_key => "patient_id"

  scope :doctors, -> { where("users.user_type IS ?", "doctor")}
  
  def is_doctor?
    self.user_type.to_s.downcase == "doctor"
  end

  def is_patient?
    self.user_type.to_s.downcase == "patient"
  end         
end
