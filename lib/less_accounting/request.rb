module LessAccounting
  # Defines HTTP request methods
  module Request

    # Perform an HTTP GET request
    def get(path, params = {})
      request(:get, path, params)
    end

    # Perform an HTTP POST request
    def post(path, params = {})
      request(:post, path, params)
    end
    
    # Perfrom an HTTP PUT request
    def put(path, params = {})
      request(:put, path, params)
    end
    
    # Perform an HTTP DELETE request
    def delete(path, params = {})
      request(:delete, path, params)
    end
    
    private

    # Perform an HTTP request
    def request(method, path, params)
      response = connection.send(method) do |request|
        case method
        when :get
          request.url(path, params)
        when :put
          params.merge!({"_method" => 'put'})
          request.url(path,params)
        when :post
          request.url(path)
          request.body = params
        when :delete
          params.merge!({"_method" => 'delete'})
          request.url(path, params)
        end
      end
      
      Response.create(response.body)
    end
    
  end
end