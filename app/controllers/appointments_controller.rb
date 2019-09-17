class AppointmentsController < ApplicationController
	def index
		@appointments = current_user.is_doctor? ? Appointment.where(doctor_id: current_user.id) : Appointment.where(patient_id: current_user.id) 
	end

	def new
		@doctors = User.doctors
	end

	def create
		appointment_start_time = params[:appointment][:start_time].in_time_zone("UTC")
		appointment_end_time = appointment_start_time + 1.hour
		@appointment = Appointment.new(start_time: appointment_start_time, end_time: appointment_end_time, doctor_id: params[:appointment][:doctor_id], patient_id: current_user.id)
		if @appointment.save
			redirect_to appointments_path, notice: "Saved successfully."
		else
			render :new, alert: @appointment.errors.full_message
		end
	end
end