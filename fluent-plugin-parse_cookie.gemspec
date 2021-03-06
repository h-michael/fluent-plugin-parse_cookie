$LOAD_PATH.push File.expand_path('lib', __dir__)
require 'fluent/plugin/parse_cookie/version'

Gem::Specification.new do |spec|
  spec.name          = 'fluent-plugin-parse_cookie'
  spec.version       = Fluent::ParseCookie::VERSION
  spec.authors       = ['Hirokazu Hata']
  spec.email         = ['h.hata.ai.t@gmail.com']
  spec.summary       = 'Fluentd plugin to parse cookie'
  spec.description   = 'Fluentd plugin to parse cookie'
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'fluentd',  ['>= 0.14.0', '< 2']
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'pry-byebug'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rr'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'test-unit'
end
