# encoding: utf-8
もし(/^".*?\((.*?)\)" にアクセスし(?:、|た)$/) do |t_path|
  visit t_path
end

もし(/^".*?\((.*?)\)" をクリックし(?:、|た)$/) do |t_css|
  page.find(t_css).click
end

ならば(/^".*?\((.*?)\)" に "(.*?)" と表示され(?:、|ていること)$/) do |t_css, t_str|
  target_elem = page.find(t_css)
  case target_elem.tag_name
  when 'input', 'option'
    expect(target_elem.value).to eq(t_str)
  else
    expect(target_elem.text).to eq(t_str)
  end
end

ならば(/^フォームの送信先が "(.*?)" であ(?:り、|ること)$/) do |path|
  expect(page.find('form')['action']).to eq(path)
end
