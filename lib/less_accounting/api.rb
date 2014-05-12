require File.expand_path('../request', __FILE__)
require File.expand_path('../response', __FILE__)
require File.expand_path('../connection', __FILE__)

module LessAccounting
  class API

    attr_accessor *Configuration::VALID_OPTIONS_KEYS

    def initialize(options = {})
      options = LessAccounting.options.merge(options)
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end

    include Request
    include Response
    include Connection
  end
end
