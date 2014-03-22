require 'openssl'

class Settings
  attr_reader :cert_store

  def initialize
    @cert_store = OpenSSL::X509::Store.new
    @cert_store.add_file('cacert.pem')
  end
end
