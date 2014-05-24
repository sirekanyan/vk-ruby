require 'vk-api/vkontakte_api'
require 'vk/token'

class Vkontakte
  def initialize
    @vk = VkontakteAPI.new
  end

  def method_missing(name, *args)
    @vk.method_missing(name, *args)
  end

  def online
    @vk.friends_getOnline()
  end

  def friends
    @vk.friends_get()
  end

  def followers
    @vk.users_getFollowers['items']
  end

  def users(*ids)
    @vk.users_get(:user_ids => ids.join(','))
  end

  def user(id)
    users(id).first
  end

  def delete(*ids)
    ids.each do |id|
      @vk.friends_delete(:user_id => id)
    end
  end
end
