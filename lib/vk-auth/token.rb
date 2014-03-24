require 'vk-auth/authorization'

class Token
  @filename = Settings.get[:token]

  def self.empty?
    !File.exist?(@filename)
  end

  def self.create(pass)
    token = Authorization.prepare(pass)
    File.open(@filename, 'w') do |file|
      file.write(token)
    end
  end
end
