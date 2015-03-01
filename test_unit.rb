require 'test/unit'
require 'rack/test'
require_relative 'test_rack_app'

class TestLogin < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    TestRackApp.new
  end

  def test_top_page
    get "/"
    assert_match(/<form[^>]+action="\/hello"/ ,last_response.body)
    assert_match(/<input[^>]+type="submit"[^>]+id="hello_button"[^>]+value="Hello!"/ ,last_response.body)
  end

  def test_hello_page
    post "/hello"
    assert_match(/<div[^>]+class="hello_msg".*?>\s*Hello, World!!\s*<\/div>/ ,last_response.body)
  end
end
