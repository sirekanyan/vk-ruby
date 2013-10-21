require 'json'
require 'uri'
require_relative 'http'
require_relative 'token'

class VkontakteAPI
  def initialize
    @api_url = Settings.get[:api_url] + '/'
  end

  def method_missing(name, *args)
    prepare(name.to_s.gsub('_', '.'), *args)
  end

  def prepare(method, params = {})
    sleep 0.5
    uri = URI(@api_url + method)
    params.merge!({:access_token => Token.get})
    uri.query = URI.encode_www_form(params)
    parse_response(Http.prepare_get(uri))
  end

  def parse_response(resp)
    json = JSON::parse(resp)
    raise json['error'].to_s if json['error']
    json['response']
  end
end