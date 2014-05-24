require 'vk-ruby'

vk = Vkontakte.new

print 'Specific users: ';  p vk.users(1, 2)
print 'Online friends: ';  p vk.online
print 'All friends:    ';  p vk.friends.count
print 'My followers:   ';  p vk.followers

