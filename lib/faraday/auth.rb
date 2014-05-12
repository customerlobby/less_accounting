module FaradayMiddleware
  class LessAccountingAuth < Faraday::Middleware

    def call(env)
      # Add the basic authentication header.
      env[:request_headers] = env[:request_headers].merge('Authorization' => "Basic #{@access_token}")
      
      query = Faraday::Utils.parse_query(env[:url].query) || {}
      query = query.merge({api_key: @api_key})
      env[:url].query = Faraday::Utils.build_query(query)
    
      @app.call env
    end

    def initialize(app, username, password, api_key)
      @app       = app
      @username  = username
      @password  = password
      @api_key   = api_key
      @access_token = generate_access_token
    end

    # Generate the access_token
    # The access_token is always the Base64 encoded version of "username:password".
    def generate_access_token
      token_string = "#{@username}:#{@password}"
      return Base64.strict_encode64(token_string)
    end

  end
end
