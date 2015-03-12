class TestRackApp
  def call(env)
    @body = body(env)
    return 200, headers(env), @body
  end

  def headers(env)
    {'Content-Type' => 'text/html'}
    {'Content-Length' => @body[0].length.to_s}
  end

  def body(env)
    html = env['PATH_INFO'] == '/hello' ? hello_page(env) : index_page(env)
    [html]
  end

  def index_page(env)
    html = <<-EOS
    <html>
      <head></head>
      <body>
        <form method="post" action="/hello">
          <input type="input" id="hello_comment" name="hello_comment" value="" />
          <select id="hello_cond" name="hello_cond">
            <option value="good">いいね</option>
            <option value="soso">まあまあ</option>
            <option value="bad">いまいち</option>
          </select>
          <input type="submit" id="hello_button" value="Hello!" />
        </form>
      </body>
    </html
    EOS
    html
  end

  def hello_page(env)
    params = Rack::Utils.parse_query(env['rack.input'].gets)
    case params['hello_cond']
    when 'good'
      hello_cond_star_count = 3
    when 'soso'
      hello_cond_star_count = 2
    when 'bad'
      hello_cond_star_count = 1
    end
    html = <<-EOS
    <html>
      <head></head>
      <body>
        <div class="hello_msg">
          Hello, World!!
        </div>
        <div class="hello_comment">
          #{params['hello_comment']}
        </div>
        <div class="hello_cond">
          #{'<span class="hello_cond_star">★</span>' * hello_cond_star_count}
        </div>
      </body>
    </html
    EOS
    html
  end
end
