require_relative '../lib/less_accounting'
require 'rspec'
require 'webmock/rspec'

RSpec.configure do |config|
  config.include WebMock::API
end

def stub_get(path, key)
  stub_request(:get, domain + path + "?api_key=#{key}")
end

def stub_post(path)
  stub_request(:post, domain + path)
end

def stub_put(path)
  stub_request(:put, domain + path)
end

def stub_delete(path, key)
  stub_request(:delete, domain + path + "?api_key=#{key}")
end

def domain
  return 'https://tester:testing@testdomain.lessaccounting.com/'
end

def set_headers
  {
    'Accept'=>'*/*', 
    'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
    'User-Agent'=>'Faraday v0.9.0'
  }  
end
