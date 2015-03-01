require 'rspec'
require 'rack/test'
require_relative 'test_rack_app'

describe 'テストアプリケーション' do
  include Rack::Test::Methods

  def app
    TestRackApp.new
  end

  it "トップページを表示" do
    get "/"
    expect(last_response.body).to match(/<form[^>]+action="\/hello"/)
    expect(last_response.body).to match(/<input[^>]+type="submit"[^>]+id="hello_button"[^>]+value="Hello!"/)
  end

  it "Helloページを表示" do
    post "/hello"
    expect(last_response.body).to match(/<div[^>]+class="hello_msg".*?>\s*Hello, World!!\s*<\/div>/)
  end
end
