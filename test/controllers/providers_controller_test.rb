require "test_helper"

class ProvidersControllerTest < ActionDispatch::IntegrationTest
    test "get all providers" do 
      get "/providers", headers: {'Authorization' => "Bearer #{providers(:peter).token}"}
      assert_response :success
    end

    test "create a provider successfully" do 
      post "/providers", headers: {'Authorization' => "Bearer #{providers(:peter).token}"},
      params: {provider: {first_name: "Tony Tony", last_name: "Chopper", specialty: "Medicine", email: "tonytonychopper@gmail.com"}},
      as: :json
      assert_response :created
    end

    test "return error with invalid data" do
      post "/providers", headers: {'Authorization' => "Bearer #{providers(:peter).token}"},
      params: {provider: {first_name: "Tony Tony", last_name: "Chopper", email: "tonytonychopper@gmail.com"}},
      as: :json
      assert_response :unprocessable_entity
    end

    test "get provider by id" do 
      provider = providers(:peter)
      get "/providers/#{provider.id}", headers: {'Authorization' => "Bearer #{providers(:peter).token}"}
      assert_response :success
    end

    test "get provider by id provider not found" do 
      get "/providers/99", headers: {'Authorization' => "Bearer #{providers(:peter).token}"}
      assert_response :not_found
    end

    test "update a provider" do 
      provider = providers(:peter)
      patch "/providers/#{provider.id}", headers: {'Authorization' => "Bearer #{providers(:peter).token}"},
      params: {provider: {first_name: "Peter", last_name: "Porker", specialty: "Spider-Man", email: "peterparker@gmail.com"}},
      as: :json
      assert_response :success
    end

    test "update a provider provider not found" do 
      patch "/providers/99", headers: {'Authorization' => "Bearer #{providers(:peter).token}"},
      params: {provider: {first_name: "Peter", last_name: "Porker", specialty: "Spider-Man", email: "peterparker@gmail.com"}},
      as: :json
      assert_response :not_found
    end

  test "delete a provider" do
    provider = Provider.create(first_name: "Tony Tony", last_name: "Chopper", specialty: "Medicine", email: "chopper@gmail.com")
    delete "/providers/#{provider.id}", headers: { 'Authorization' => "Bearer #{providers(:peter).token}" }
    assert_response :no_content
  end

  test "delete a provider provider not found" do 
    delete "/providers/99", headers: { 'Authorization' => "Bearer #{providers(:peter).token}" }
    assert_response :not_found
  end
end
