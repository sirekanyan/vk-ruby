require_relative 'authorization'
require_relative 'settings'

class Token
  @filename = Settings.get[:token]

  def self.get
    File.open(@filename, 'r').read.chomp
  end

  def self.empty?
    !File.exist?(@filename)
  end

  def self.create(pass)
    save(Authorization.prepare(pass))
  end

  private

  def self.save(token)
    File.open(@filename, 'w') do |file|
      file.write(token)
    end
    token
  end
end
