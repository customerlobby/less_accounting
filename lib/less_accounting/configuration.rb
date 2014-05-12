module LessAccounting
  module Configuration

    VALID_OPTIONS_KEYS = [
      :username,
      :password,
      :domain,
      :api_key,
      :adapter,
    ].freeze

    DEFAULT_FORMAT = :xml

    DEFAULT_ADAPTER = Faraday.default_adapter

    attr_accessor *VALID_OPTIONS_KEYS

    # Convenience method to allow configuration options to be set in a block
    def configure
      yield self
    end

    def options
      VALID_OPTIONS_KEYS.inject({}) do |option, key|
        option.merge!(key => send(key))
      end
    end

    def self.extended(base)
      base.reset
    end

    def reset
      self.username = nil
      self.password = nil
      self.domain   = nil
      self.api_key  = nil
      self.adapter  = DEFAULT_ADAPTER
    end

  end
end
