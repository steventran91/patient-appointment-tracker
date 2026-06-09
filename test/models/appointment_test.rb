require "test_helper"

class AppointmentTest < ActiveSupport::TestCase
  ## patient_id, provider_id, appointment_date, status
  ## status: scheduled, cancelled, completed

  test "is appointment valid with all required fields" do 
    appointment = appointments(:first_appointment)
    assert appointment.valid?
  end

  test "is invalid with missing patient_id" do
    provider = providers(:peter)
    appointment = Appointment.new(provider_id: provider.id, appointment_date: '06/01/2026', status: "scheduled")
    assert_not appointment.valid?
  end

  test "is invalid with missing provider_id" do
    patient = patients(:mary)
    appointment = Appointment.new(patient_id: patient.id, appointment_date: '06/01/2026', status: "scheduled")
    assert_not appointment.valid?
  end

  test "is invalid with missing appointment_date" do
    patient = patients(:john)
    provider = providers(:bruce)
    appointment = Appointment.new(patient_id: patient.id, provider_id: provider.id, status: "scheduled")
    assert_not appointment.valid?
  end

  test "is invalid with missing status" do 
    patient = patients(:mary)
    provider = providers(:bruce)
    appointment = Appointment.new(patient_id: patient.id, provider_id: provider.id,appointment_date: '06/01/2026')
    assert_not appointment.valid?
  end

  test "is invalid with invalid status value" do 
    patient = patients(:john)
    provider = providers(:peter)
    appointment = Appointment.new(patient_id: patient.id, provider_id: provider.id, appointment_date: '06/01/2026', status: "pending")
    assert_not appointment.valid?
  end
end
