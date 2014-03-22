require 'rake'

Gem::Specification.new do |s|
  s.name        = 'vk-api'
  s.version     = '0.1'
  s.date        = '2014-03-22'
  s.summary     = 'Vkontakte API'
  s.description = 'Simple wrapper for Vkontakte API'
  s.authors     = ['Vadik Sirekanyan']
  s.email       = 'vadik@sirekanyan.com'
  s.files       = FileList['lib/vk-api.rb', 'lib/vk-api/*']
  s.homepage    = 'http://sirekanyan.com/gems/vk-api'
  s.license     = 'MIT'
end
