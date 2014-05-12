module LessAccounting
  class Client < API
    Dir[File.expand_path('../client/*.rb', __FILE__)].each{|f| require f}
    
    include LessAccounting::Client::Contacts
    include LessAccounting::Client::Invoices
  end
end