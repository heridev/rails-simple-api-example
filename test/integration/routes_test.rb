require 'test_helper'

class RoutesTest < ActionDispatch::IntegrationTest
  test 'routes version' do
    assert_generates '/v1/patients', { controller: 'api/v1/patients', action: 'index'}
    assert_generates '/v2/patients', { controller: 'api/v2/patients', action: 'index'}
  end
end
