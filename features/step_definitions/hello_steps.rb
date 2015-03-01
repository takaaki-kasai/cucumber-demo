# encoding: utf-8
もし(/^トップページにアクセスした$/) do
  visit "/"
end

ならば(/^フォームの送信先が "(.*?)" であること$/) do |path|
  expect(page.find('form')['action']).to eq(path)
end

ならば(/^送信ボタンに "(.*?)" と表示されていること$/) do |val|
  expect(page.find('input[type="submit"]#hello_button')['value']).to eq(val)
end

もし(/^送信ボタンをクリックした$/) do
  page.find('input[type="submit"]#hello_button').click
end

ならば(/^"(.*?)" とメッセージが表示されていること$/) do |msg|
  expect(page.find('div.hello_msg').text).to eq(msg)
end
