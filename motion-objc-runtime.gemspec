# -*- encoding: utf-8 -*-
Gem::Specification.new do |gem|
  gem.name          = 'motion-objc-runtime'
  gem.description   = 'Exposes Objective-C runtime in RubyMotion'
  gem.homepage      = "https://github.com/kastiglione/#{gem.name}"
  gem.version       = '0.0.1'

  gem.authors       = ['Dave Lee']
  gem.email         = ['dave@kastiglione.com']

  gem.files         = `git ls-files`.split($\)
  gem.require_paths = ['lib']

  gem.summary       = <<-END.gsub(/^ +/, '')
    motion-objc-runtime gives RubyMotion some of the metaprogramming
    capabilities currently lacking. By exposing the Objective-C
    runtime, #define_method and other metaprogramming staples can be
    used from within RubyMotion apps.
  END
end
