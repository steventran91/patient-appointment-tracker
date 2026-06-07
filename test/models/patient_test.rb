require "test_helper"

class PatientTest < ActiveSupport::TestCase
  test "is valid with all required fields" do 
    patient = Patient.new(first_name: "Mary", last_name: "Jane", email: "maryjane420@gmail.com")
    assert patient.valid?
  end

  test "is invalid with missing first_name" do
    patient = Patient.new(last_name: "Jane", email: "jane123@gmail.com")
    assert_not patient.valid?
  end

  test "is invalid with missing last_name" do
    patient = Patient.new(first_name: "Mary", email: "mary123@gmail.com")
    assert_not patient.valid?
  end

  test "is invalid with missing email" do 
    patient = Patient.new(first_name: "Mary", last_name: "Jame")
    assert_not patient.valid?
  end

  test "is invalid with duplicate email" do 
    patient = Patient.new(first_name: "Mary", last_name: "Jane", email: "maryjane@gmail.com")
    assert patient.valid?
    patient.save
    patient_dupe_email = Patient.new(first_name: "Harry", last_name: "Lane", email: "maryjane@gmail.com")
    assert_not patient_dupe_email.valid? 
  end 
end
