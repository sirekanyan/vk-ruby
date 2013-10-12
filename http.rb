require 'net/http'

class Http
  def self.prepare_get(uri)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = uri.scheme == 'https'
    http.cert_store = Settings.cert_store
    http.get(uri).body
  end
end