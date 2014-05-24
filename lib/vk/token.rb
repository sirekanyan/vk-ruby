require 'vk/authorization'

class Token
  @@filename = Settings.get[:token]

  def self.empty?
    !File.exist?(@@filename)
  end

  def self.create(pass)
    File.open(@@filename, 'w') do |file|
      file.write(Authorization.prepare(pass))
    end
  end

  def initialize
    if Token.empty? then
      raise 'Please, specify token first, use init.rb script' 
    end
    @token = File.open(@@filename, 'r').read.chomp
  end

  def to_s
    @token
  end
end
