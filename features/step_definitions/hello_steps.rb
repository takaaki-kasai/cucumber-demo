# encoding: utf-8
もし(/^".*?\((.*?)\)" にアクセスし(?:、|た)$/) do |t_path|
  visit t_path
end

もし(/^".*?\((.*?)\)" をクリックし(?:、|た)(\(非同期\))?$/) do |t_css, t_async|
  wait_for_ajax if t_async
  page.find(t_css).click
end

もし(/^".*?\((.*?)\)" に "(.*?)" と入力し(?:、|た)$/) do |t_css, t_with|
  page.find(t_css).set(t_with)
end

もし(/^".*?\((.*?)\)" リストで ".*?\((.*?)\)" を選択し(?:、|た)$/) do |t_css, t_with|
  target_node = page.find(t_css)
  target_node_option = target_node.find(%'option[value="#{t_with}"]')
  target_node_option.select_option
end

ならば(/^".*?\((.*?)\)" が表示され(?:、|ていること)$/) do |t_css|
  expect(page).to have_css(t_css)
end

ならば(/^".*?\((.*?)\)" が (\d+) 個であ(?:り、|ること)$/) do |t_css, t_count|
  expect(page).to have_css(t_css, :count => t_count)
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
