require 'yaml'
require 'openssl'

class Settings
  @settings = YAML.load_file('settings.yaml')
  @cert_store = OpenSSL::X509::Store.new
  @cert_store.add_file(@settings[:cert])

  def self.get
    @settings
  end

  def self.cert_store
    @sert_store
  end
end