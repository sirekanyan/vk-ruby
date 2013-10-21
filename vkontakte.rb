require_relative 'vkontakte_api'

class ::Hash
  def to_obj
    self.each do |k, v|
      if v.kind_of? Hash
        v.to_obj
      end
      self.instance_variable_set("@#{k}", v)
      self.class.send(:define_method, k, proc { self.instance_variable_get("@#{k}") })
      self.class.send(:define_method, "#{k}=", proc { |vv| self.instance_variable_set("@#{k}", vv) })
    end
  end
end

class ::Array
  def to_obj
    self.each do |i|
      if i.kind_of? Hash
        i.to_obj
      end
    end
  end
end

class Vkontakte
  def initialize
    @vk = VkontakteAPI.new
  end

  def online_ids
    @vk.friends_getOnline()
  end

  def friends_ids
    @vk.friends_get()
  end

  def followers_ids
    @vk.users_getFollowers['items']
  end

  def users(*ids)
    @vk.users_get(:user_ids => ids.join(',')).to_obj
  end

  def delete(*ids)
    ids.each do |id|
      @vk.friends_delete(:user_id => id)
    end
  end
end