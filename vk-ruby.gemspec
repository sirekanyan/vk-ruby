require 'rake'

Gem::Specification.new do |s|
  s.name        = 'vk-ruby'
  s.version     = '0.1'
  s.date        = '2014-03-24'
  s.summary     = 'Vkontakte API'
  s.description = 'Simple wrapper for Vkontakte API'
  s.authors     = ['Vadik Sirekanyan']
  s.email       = 'vadik@sirekanyan.com'
  s.files       = FileList['lib/vk-ruby.rb', 'lib/vk/*', 'lib/vk-api/*']
  s.homepage    = 'http://sirekanyan.com/gems/vk-ruby'
  s.license     = 'MIT'
end
