require_relative 'vkontakte'

vk = Vkontakte.new

if Token.empty?
  Token.create('password')
end

vk.users(1,2,3,4).each do |user|
  puts user
end
