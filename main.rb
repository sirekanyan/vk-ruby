require_relative 'vkontakte'

vk = Vkontakte.new

if Token.empty?
  Token.create('password')
end

online_ids = vk.friends_getOnline().join(',')
vk.users_get(:user_ids => online_ids).each do |user|
  puts user.values.join(" ")
end
