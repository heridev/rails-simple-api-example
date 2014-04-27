require 'test_helper'

class ChangingApiVersionsTest < ActionDispatch::IntegrationTest
  setup do
    @ip = '193.1.1.40'
    host! 'api.localhost.com'
  end

  test '/v1 returns version 1' do
    get '/v1/patients/get_version', {}, { 'REMOTE_ADDR' => @ip }
    assert_equal 200, response.status
    assert_equal "#{@ip} Version one!", response.body
  end

  test '/v2 returns version 1' do
    get '/v2/patients/get_version', {}, { 'REMOTE_ADDR' => @ip }
    assert_equal 200, response.status
    assert_equal "#{@ip} Version two!", response.body
  end

end
