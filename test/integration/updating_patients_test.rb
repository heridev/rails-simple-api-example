require 'test_helper'

class UpdatingPatientsTest < ActionDispatch::IntegrationTest
  setup do
    @patient = Patient.create!(first_name: 'first name', last_name: 'last name')
    host! 'api.domain.com'
  end

  test 'Updating the patient' do
    patch "/patients/#{@patient.id}",
      { patient: { first_name: 'heribertito'} }.to_json,
      { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }

    assert_equal 200, response.status
    assert_equal 'heribertito', @patient.reload.first_name
  end
end

