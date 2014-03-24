require 'vk-auth'
require 'io/console'

print 'Login: '
puts Settings.get[:email]

print 'Password: '
Token.create(STDIN.noecho(&:gets).chomp)
puts

