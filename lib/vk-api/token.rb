class Token
  def initialize(token)
    if File.exist?(token) then
      @token = File.open(token, 'r').read.chomp
    else
      puts 'Please, specify token first, use init.rb script'; exit
    end
  end

  def to_s
    @token
  end
end
