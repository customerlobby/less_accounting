require 'faraday_middleware'
Dir[File.expand_path('../../faraday/*.rb', __FILE__)].each{|f| require f}

module LessAccounting
  module Connection
    
    def connection
      options = { :url => "https://#{domain}.lessaccounting.com/" }
      
      Faraday::Connection.new(options) do |connection|
        connection.use FaradayMiddleware::LessAccountingAuth, username, password, api_key
        connection.use FaradayMiddleware::Mashify
        connection.use Faraday::Response::ParseXml
        connection.adapter(adapter)
      end
    end

  end
end