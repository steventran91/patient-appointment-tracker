require "test_helper"

class PatientsControllerTest < ActionDispatch::IntegrationTest
  test "get all patients" do 
    get "/patients", headers: { 'Authorization' => "Bearer #{providers(:peter).token}" }
    assert_response :success
  end

  test "create patient successfully" do 
    post "/patients", headers: { 'Authorization' => "Bearer #{providers(:peter).token}"},
    params: {patient: {first_name: "Naruto", last_name: "Uzumaki", email: "7hokage@gmail.com", date_of_birth: '01/01/2000'}},
    as: :json
    assert_response :created
  end

  test "return error with invalid data" do
    post "/patients", headers: { 'Authorization' => "Bearer #{providers(:peter).token}"},
    params: {patient: {last_name: "Uzumaki", email: "7hokage@gmail.com", date_of_birth: '01/01/2000'}},
    as: :json
    assert_response :unprocessable_entity
  end

  test "get patient by id" do
    patient = patients(:john)
    get "/patients/#{patient.id}", headers: { 'Authorization' => "Bearer #{providers(:peter).token}"}
    assert_response :success
  end

  test "update patient info" do 
    patient = patients(:john)
    patch "/patients/#{patient.id}", headers: { 'Authorization' => "Bearer #{providers(:peter).token}"},
    params: {patient: {first_name: "Boruto", last_name: "Uzumaki", email: "7hokage@gmail.com", date_of_birth: '01/01/2000'}},
    as: :json
    assert_response :success
  end
end
