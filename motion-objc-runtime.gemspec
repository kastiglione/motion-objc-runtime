# -*- encoding: utf-8 -*-
Gem::Specification.new do |gem|
  gem.name          = 'motion-objc-runtime'
  gem.description   = 'Exposes Objective-C runtime in RubyMotion'
  gem.homepage      = "https://github.com/kastiglione/#{gem.name}"
  gem.version       = '0.0.5'

  gem.authors       = ['Dave Lee']
  gem.email         = ['dave@kastiglione.com']

  gem.files         = `git ls-files`.split($\)
  gem.require_paths = ['lib']

  gem.summary       = <<-END.gsub(/^ +/, '')
    motion-objc-runtime exposes the Objective-C runtime API. This
    allows RubyMotion access building blocks necessary to provide
    advanced metaprogramming capabilities in RubyMotion.
  END
end
