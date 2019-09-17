class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.boolean :is_accepted, default: false
      t.integer :doctor_id
      t.integer :patient_id

      t.timestamps
    end
  end
end
