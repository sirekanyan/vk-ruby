require 'rake'

Gem::Specification.new do |s|
  s.name        = 'vk-auth'
  s.version     = '0.1'
  s.date        = '2014-03-22'
  s.summary     = 'Vkontakte Authorization'
  s.description = 'Simple browser imitation for getting token by password'
  s.authors     = ['Vadik Sirekanyan']
  s.email       = 'vadik@sirekanyan.com'
  s.files       = FileList['lib/vk-auth.rb', 'lib/vk-auth/*']
  s.homepage    = 'http://sirekanyan.com/gems/vk-auth'
  s.license     = 'MIT'
end
