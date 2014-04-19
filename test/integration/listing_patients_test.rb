require 'test_helper'

class ListingPatientsTest < ActionDispatch::IntegrationTest
  setup { host! 'api.localhost.com' }

  test 'returns list of patients' do
    get '/patients'
    assert_equal 200, response.status
    refute_empty response.body
  end

  test 'filtering patients by name' do
    Patient.create!(first_name: 'first name', last_name: 'last name')
    Patient.create!(first_name: 'Heriberto', last_name: 'Perez')
    get '/patients?first_name=Heriberto'
    assert_equal 200, response.status
    patients = json(response.body)
    names = patients.collect { |patient| patient[:first_name] }
    assert_includes names, 'Heriberto'
    refute_includes names, 'first name'
  end

  test 'Return the patient based on his id' do
    patient = Patient.create!(first_name: 'first name', last_name: 'last name')
    get "/patients/#{patient.id}"
    assert_equal 200, response.status
    patient_response = json(response.body, true)
    assert_equal patient.first_name, patient_response[:first_name]
  end

  test 'Return the patients in format json' do
    Patient.create!(first_name: 'first name', last_name: 'last name')
    get '/patients'
    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type
  end
end
