class Token
  def initialize(token)
    @token = File.open(token, 'r').read.chomp
  end

  def to_s
    @token
  end
end
