require 'vk-api'

vk = Vkontakte.new('token.txt')

print 'Specific users: ';  p vk.users(1, 2)
print 'Online friends: ';  p vk.online
print 'All friends:    ';  p vk.friends
print 'My followers:   ';  p vk.followers

