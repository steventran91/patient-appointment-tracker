require "test_helper"

class AppointmentTest < ActiveSupport::TestCase
  ## patient_id, provider_id, appointment_date, status
  ## status: scheduled, cancelled, completed

  test "is appointment valid with all required fields" do 
    patient = Patient.new(first_name: "Mary", last_name: "Jane", email: "maryjane420@gmail.com")
    patient.save
    provider = Provider.new(first_name: "John", last_name: "Doe", specialty: "Cardiology", email: "johndoe@gmail.com")
    provider.save
    appointment = Appointment.new(patient_id: patient.id, provider_id: provider.id, appointment_date: '06/01/2026', status: "scheduled")
    assert appointment.valid?
  end

  test "is invalid with missing patient_id" do
    provider = Provider.new(first_name: "John", last_name: "Doe", specialty: "Cardiology", email: "johndoe@gmail.com")
    provider.save
    appointment = Appointment.new(provider_id: provider.id, appointment_date: '06/01/2026', status: "scheduled")
    assert_not appointment.valid?
  end

  test "is invalid with missing provider_id" do
    patient = Patient.new(first_name: "Mary", last_name: "Jane", email: "maryjane420@gmail.com")
    patient.save
    appointment = Appointment.new(patient_id: patient.id, appointment_date: '06/01/2026', status: "scheduled")
    assert_not appointment.valid?
  end

  test "is invalid with missing appointment_date" do
    patient = Patient.new(first_name: "Mary", last_name: "Jane", email: "maryjane420@gmail.com")
    patient.save
    provider = Provider.new(first_name: "John", last_name: "Doe", specialty: "Cardiology", email: "johndoe@gmail.com")
    provider.save
    appointment = Appointment.new(patient_id: patient.id, provider_id: provider.id, status: "scheduled")
    assert_not appointment.valid?
  end

  test "is invalid with missing status" do 
    patient = Patient.new(first_name: "Mary", last_name: "Jane", email: "maryjane420@gmail.com")
    patient.save
    provider = Provider.new(first_name: "John", last_name: "Doe", specialty: "Cardiology", email: "johndoe@gmail.com")
    provider.save
    appointment = Appointment.new(patient_id: patient.id, provider_id: provider.id,appointment_date: '06/01/2026')
    assert_not appointment.valid?
  end

  test "is invalid with invalid status value" do 
    patient = Patient.new(first_name: "Mary", last_name: "Jane", email: "maryjane420@gmail.com")
    patient.save
    provider = Provider.new(first_name: "John", last_name: "Doe", specialty: "Cardiology", email: "johndoe@gmail.com")
    provider.save
    appointment = Appointment.new(patient_id: patient.id, provider_id: provider.id, appointment_date: '06/01/2026', status: "pending")
    assert_not appointment.valid?
  end
end
