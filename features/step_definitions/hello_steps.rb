# encoding: utf-8
もし(/^トップページにアクセスした$/) do
  get "/"
end

ならば(/^フォームの送信先が "(.*?)" であること$/) do |path|
  expect(last_response.body).to match(/<form[^>]+action="#{path}"/)
end

ならば(/^送信ボタンに "(.*?)" と表示されていること$/) do |val|
  expect(last_response.body).to match(/<input[^>]+type="submit"[^>]+id="hello_button"[^>]+value="#{val}"/)
end

もし(/^Helloページにフォームから飛ばされた$/) do
  post "/hello"
end

ならば(/^"(.*?)" とメッセージが表示されていること$/) do |msg|
  expect(last_response.body).to match(/<div[^>]+class="hello_msg".*?>\s*#{msg}\s*<\/div>/)
end
