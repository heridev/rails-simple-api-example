require 'test_helper'

class DeletingPatientsTest < ActionDispatch::IntegrationTest
  setup do
    @patient = Patient.create!(first_name: 'first name', last_name: 'last name', available: true)
    host! 'api.domain.com'
  end

  test 'Deleting the patient' do
    delete "/patients/#{@patient.id}"
    assert_equal 204, response.status
  end
end

