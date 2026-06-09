require "test_helper"

class ProviderTest < ActiveSupport::TestCase
  # first name, last name, specialty, email, token
  test "is provider valid with all requried fields" do 
    provider = Provider.new(first_name: "John", last_name: "Doe", specialty: "Cardiology", email: "johndoe@gmail.com")
    assert provider.valid?
  end

  test "is invalid with missing first name" do 
    provider = Provider.new(last_name: "Doe", specialty: "Cardiology", email: "johndoe@gmail.com")
    assert_not provider.valid?
  end

  test "is invalid with missing last name" do 
    provider = Provider.new(first_name: "John", specialty: "Cardiology", email: "johndoe@gmail.com")
    assert_not provider.valid?
  end

  test "is invalid with missing speciality" do 
    provider = Provider.new(first_name: "John", last_name: "Doe", email: "johndoe@gmail.com")
    assert_not provider.valid?
  end

  test "is invalid with missing email" do
    provider = Provider.new(first_name: "John", last_name: "Doe", specialty: "Cardiology")
    assert_not provider.valid?
  end

  test "is invalid with duplicate email" do 
    provider = Provider.new(first_name: "John", last_name: "Doe", specialty: "Cardiology", email: "johndoe@gmail.com")
    assert provider.valid?
    provider.save
    provider_dupe_email = Provider.new(first_name: "Joe", last_name: "Doe", specialty: "Medicine", email: "johndoe@gmail.com")
    assert_not provider_dupe_email.valid?
  end
end
