class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :provider
  validates :patient_id, :provider_id, :appointment_date, :status, presence: true
  validates :status, inclusion: {in: ["scheduled", "cancelled", "completed"]}
end
