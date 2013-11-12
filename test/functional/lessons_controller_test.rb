require 'test_helper'

class LessonsControllerTest < ActionController::TestCase


  def json
    ActiveSupport::JSON.decode @response.body
  end

  test 'style filter' do
    get :index, {:style_id => 2, format: :json}
    assert_equal json.count, 2
  end

  test 'day filter' do
    get :index, {:day => 'tuesday', format: :json}
    assert_equal json.count, 5, 'as string'

    get :index, {:day => 6, format: :json}
    assert_equal json.count, 3, 'as number'

    get :index, {:day => '6', format: :json}
    assert_equal json.count, 3, 'as number'
  end

  test 'time filter' do
    get :index, {time: 1}
  end

end

