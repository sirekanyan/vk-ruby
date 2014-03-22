require 'net/http'
require 'vk-api/settings'

class Http
  def initialize
    @settings = Settings.new
  end

  def get(uri)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = uri.scheme == 'https'
    http.cert_store = @settings.cert_store
    http.get(uri).body
  end
end
