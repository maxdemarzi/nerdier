require 'httpclient/include_client'

module Nerdier
  class Client
    extend HTTPClient::IncludeClient    
    include_http_client
  end
end
