module LessAccounting
  class Client

    def create_prefixed_params(prefix, params)
      prefixed = Hash.new
      params.each do |key, value|
        prefixed["#{prefix}[#{key}]"] = value
      end
      return prefixed
    end

  end
end