# http://gihyo.jp/dev/serial/01/ruby/0023
# rbenv local 2.4.1
# bundle init
# vi Gemfile 
#  gem 'rack'
# rbenv exec bundle install --path vendor/bundle
# rbenv exec bundle exec rackup
# http://localhost:9292/
class SimpleApp
  def call(env)
    p env
    case env['REQUEST_METHOD']
    when 'GET'
      get_response
    when 'POST'
      post_response
    else
      raise NotImplementedError
    end
  end

  private

  def get_response
    body = <<-'BODY'
      <html>
        <body>
          <form method='POST'>
            <input type='submit' value='submit'>
          </form>
        </body>
      </html>
    BODY
    [200, {'Content-Type'=>'text/html'}, [body]]
  end

  def post_response
    body = <<-'BODY'
      <html>
        <body>
          submited
        </body>
      </html>
    BODY
    [200, {'Content-Type'=>'text/html'}, [body]]
  end
end
