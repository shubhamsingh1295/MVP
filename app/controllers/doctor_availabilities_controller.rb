class DoctorAvailabilitiesController < ApplicationController
	def index
	end

	def create
		if params["availability"].present?
			availability = current_user.doctor_availabilities.new(availability: params["availability"])
			availability.save
		end
		flash.now[:notice] = "Availability settings saved successfully."
		redirect_to doctor_availabilities_path
	end
end