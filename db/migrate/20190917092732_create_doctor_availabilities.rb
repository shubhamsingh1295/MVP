class CreateDoctorAvailabilities < ActiveRecord::Migration[6.0]
  def change
    create_table :doctor_availabilities do |t|
      t.integer :min_days_before, default: 2
      t.integer :max_days_after, default: 20
      t.text :availability
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
