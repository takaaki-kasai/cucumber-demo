class TestRackApp
  def call(env)
    return 200, headers(env), body(env)
  end

  def headers(env)
    {'Content-Type' => 'text/html'}
    {'Content-Length' => body(env)[0].length.to_s}
  end

  def body(env)
    html = env['PATH_INFO'] == '/hello' ? hello_page : index_page
    [html]
  end

  def index_page
    html = <<-EOS
    <html>
      <head></head>
      <body>
        <form method="post" action="/hello">
          <input type="submit" id="hello_button" value="Hello!" />
        </form>
      </body>
    </html
    EOS
    html
  end

  def hello_page
    html = <<-EOS
    <html>
      <head></head>
      <body>
        <div class="hello_msg">
          Hello, World!!
        </div>
      </body>
    </html
    EOS
    html
  end
end
