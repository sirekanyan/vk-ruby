require 'mechanize'
require_relative 'settings'

class Authorization
  @settings = Settings.get

  @agent = Mechanize.new do |a|
    a.cert_store = Settings.cert_store
  end

  def self.prepare(pass)
    uri = prepare_post(pass)
    unless successful_redirect(uri)
      raise @settings[:login_error]
    end
    parse_token(uri)
  end

  private

  def self.prepare_post(pass)
    page = @agent.get(oauth_uri)
    form = page.forms.first
    form['email'] = @settings[:email]
    form['pass'] = pass
    @agent.submit(form).uri
  end

  def self.parse_token(uri)
    params = CGI.parse(uri.fragment)
    params['access_token'][0]
  end

  def self.oauth_uri
    uri = URI(@settings[:oauth_url])
    uri.query = URI.encode_www_form(
        @settings[:oauth_params])
    return uri
  end

  def self.successful_redirect(uri)
    redirect = @settings[:oauth_params][:redirect_uri]
    uri.to_s.start_with?(redirect)
  end
end