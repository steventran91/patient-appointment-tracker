class CreateAppointments < ActiveRecord::Migration[8.1]
  def change
    create_table :appointments do |t|
      t.references :patient, null: false, foreign_key: true
      t.references :provider, null: false, foreign_key: true
      t.datetime :appointment_date
      t.string :status
      t.text :notes

      t.timestamps
    end
  end
end
