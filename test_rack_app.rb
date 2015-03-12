class TestRackApp
  def call(env)
    @body = body(env)
    return 200, headers(env), @body
  end

  def headers(env)
    {'Content-Type' => 'text/html'}
    {'Content-Length' => @body[0].bytesize.to_s}
  end

  def body(env)
    case env['PATH_INFO']
    when '/'
      html = index_page(env)
    when '/hello'
      html = hello_page(env)
    when '/hello-api'
      html = hello_api(env)
    else
      html = ''
    end
    [html]
  end

  def index_page(env)
    html = <<-EOS
    <html>
      <head>
        <meta charset="UTF-8" />
        <script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
        <script>
          $(document).ready(function() {
            $('#greetings_button').click(function(){
              $.ajax({
                type: "GET",
                url: "/hello-api",
                dataType: "text",
                success: function(txt) {
                  $('#hello_response').text(txt);
                }
              });
            });
          });
        </script>
      </head>
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
        <div id="hello_response">ボタンを押して</div>
        <button type="button" id="greetings_button">AJAX</button>
      </body>
    </html>
    EOS
    html
  end

  def hello_page(env)
    params = Rack::Utils.parse_query(env['rack.input'].gets)
    hello_comment = params['hello_comment']
    hello_comment.force_encoding('UTF-8')
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
      <head>
        <meta charset="UTF-8" />
      </head>
      <body>
        <div class="hello_msg">
          Hello, World!!
        </div>
        <div class="hello_comment">
          #{hello_comment}
        </div>
        <div class="hello_cond">
          #{'<span class="hello_cond_star">★</span>' * hello_cond_star_count}
        </div>
      </body>
    </html>
    EOS
    html
  end

  def hello_api(env)
    'どうも'
  end
end
