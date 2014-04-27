require 'test_helper'

class PatientsAuthenticationTest < ActionDispatch::IntegrationTest
  setup do
    host! 'api.localhost.com'
    @user = User.create!
  end

  test 'valid authentication using the api version 3' do
    get '/v3/patients', {}, { 'Authorization' => token_header(@user.auth_token)}
    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type
  end
end
