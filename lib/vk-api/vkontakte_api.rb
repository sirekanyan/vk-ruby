require 'json'
require 'uri'
require 'vk-api/http'
require 'vk/token'

class VkontakteAPI
  @@api_url = 'https://api.vk.com/method/'

  def initialize
    @token = Token.new
  end

  def method_missing(name, *args)
    prepare(name.to_s.gsub('_', '.'), *args)
  end

  def prepare(method, params = {})
    uri = URI(@@api_url + method)
    params.merge!({:access_token => @token})
    uri.query = URI.encode_www_form(params)
    parse_response(Http.get(uri))
  end

  def parse_response(resp)
    json = JSON::parse(resp)
    puts json['error']['error_msg'].to_s if json['error']
    return -1 if json['error']
    json['response']
  end
end
