require 'vk-api/vkontakte_api'

class Vkontakte
  def initialize(token)
    @vk = VkontakteAPI.new(token)
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

  def delete(*ids)
    ids.each do |id|
      @vk.friends_delete(:user_id => id)
    end
  end
end
