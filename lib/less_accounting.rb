require 'active_support/all'
require 'faraday'
require 'base64'
require 'less_accounting/version'
require File.expand_path('../less_accounting/configuration', __FILE__)
require File.expand_path('../less_accounting/api', __FILE__)
require File.expand_path('../less_accounting/client', __FILE__)


module LessAccounting

  extend Configuration

  # Alias for LessAccounting::Client.new
  #
  # @return [LessAccounting::Client]
  def self.client(options = {})
    LessAccounting::Client.new(options)
  end

  # Delegate to LessAccounting::Client
  def self.method_missing(method, *args, &block)
    return super unless client.respond_to?(method)
    client.send(method, *args, &block)
  end
end
