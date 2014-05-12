module FaradayMiddleware
  class LessAccountingAuth < Faraday::Middleware

    def call(env)
      # Add the basic authentication header.
      env[:request_headers] = env[:request_headers].merge('Authorization' => "Basic #{@access_token}")

      # Ensure the api_key parameter is sent with every request.
      if env[:method] == :get or env[:method] == :delete
        if env[:url].query.blank?
          env[:url].query = Faraday::Utils.build_query({api_key: @api_key})
        else
          query = Faraday::Utils.parse_query(env[:url].query)
          env[:url].query = Faraday::Utils.build_query(query.merge!({api_key: @api_key}))
        end
      else
        if env[:body].blank?
          env[:body] = {api_key: @api_key}
        else
          env[:body] = env[:body].merge!({api_key: @api_key})
        end
      end

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
