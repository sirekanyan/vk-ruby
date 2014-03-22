require 'json'
require 'uri'
require 'vk-api/http'
require 'vk-api/token'

class VkontakteAPI
  @@api_url = 'https://api.vk.com/method/'

  def initialize(token)
    @http = Http.new
    @token = Token.new(token)
  end

  def method_missing(name, *args)
    prepare(name.to_s.gsub('_', '.'), *args)
  end

  def prepare(method, params = {})
    uri = URI(@@api_url + method)
    params.merge!({:access_token => @token})
    uri.query = URI.encode_www_form(params)
    parse_response(@http.get(uri))
  end

  def parse_response(resp)
    json = JSON::parse(resp)
    raise json['error']['error_msg'].to_s if json['error']
    json['response']
  end
end
