require 'test_helper'

class ApiNotesControllerTest < ActionDispatch::IntegrationTest
  test "should get notes" do
    get '/api/v1/notes'
    assert_response :success
  end

  test "should get notes/search" do
    get '/api/v1/notes/search?term=12'
    assert_response :forbidden, "search term to short"

    get '/api/v1/notes/search?term=123'
    assert_response :success
  end
end
