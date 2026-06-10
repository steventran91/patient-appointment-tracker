require "test_helper"

class AppointmentsControllerTest < ActionDispatch::IntegrationTest
    test "get all appointments" do 
      get "/appointments", headers: {'Authorization' => "Bearer #{providers(:bruce).token}"}
      assert_response :success
    end 

    test "get patient appointments" do 
      patient = patients(:john)
      get "/patients/#{patient.id}/appointments", headers: {'Authorization' => "Bearer #{providers(:bruce).token}"}
      assert_response :success
    end

    test "get patient appointments not found" do 
      get "/patients/99/appointments", headers: {'Authorization' => "Bearer #{providers(:bruce).token}"}
      assert_response :not_found
    end

    test "get provider appointments" do 
      provider = providers(:bruce)
      get "/providers/#{provider.id}/appointments", headers: {'Authorization' => "Bearer #{providers(:bruce).token}"}
      assert_response :success
    end

    test "get provider appointments not found" do 
      get "/providers/99/appointments", headers: {'Authorization' => "Bearer #{providers(:bruce).token}"}
      assert_response :not_found
    end

    test "create appointment successfully" do 
      patient = patients(:mary)
      provider = providers(:bruce)
      post "/appointments", headers: {'Authorization' => "Bearer #{providers(:bruce).token}"},
      params: {appointment: {patient_id: patient.id, provider_id: provider.id, appointment_date: '2026-06-23 10:00:00', status: 'scheduled'}},
      as: :json
      assert_response :created
    end

    test "get appointment by id" do 
      appointment = appointments(:first_appointment)
      get "/appointments/#{appointment.id}", headers: {'Authorization' => "Bearer #{providers(:bruce).token}"}
      assert_response :success
    end

    test "get appointment by id not found" do 
      get "/appointments/99", headers: {'Authorization' => "Bearer #{providers(:bruce).token}"}
      assert_response :not_found
    end

    test "update appointment" do 
      patient = patients(:mary)
      provider = providers(:bruce)
      appointment = appointments(:second_appointment)
      patch "/appointments/#{appointment.id}", headers: {'Authorization' => "Bearer #{providers(:bruce).token}"},
      params: {appointment: {patient_id: patient.id, provider_id: provider.id, appointment_date: '2026-07-01 10:00:00', status: 'scheduled'}},
      as: :json
      assert_response :success 
    end

    test "update appointment not found" do 
      patient = patients(:mary)
      provider = providers(:bruce)
      patch "/appointments/99", headers: {'Authorization' => "Bearer #{providers(:bruce).token}"},
      params: {appointment: {patient_id: patient.id, provider_id: provider.id, appointment_date: '2026-07-01 10:00:00', status: 'scheduled'}},
      as: :json 
      assert_response :not_found
    end
end
