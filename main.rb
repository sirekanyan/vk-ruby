require 'io/console'
require_relative 'settings'
require_relative 'vkontakte'

vk = Vkontakte.new

puts 'Login: ' + Settings.get[:email]

if Token.empty?
  print 'Password: '
  Token.create(STDIN.noecho(&:gets))
end

vk.users(1, 2, 3, 4).each do |user|
  puts user
end
