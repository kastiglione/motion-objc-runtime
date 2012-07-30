# -*- encoding: utf-8 -*-
require File.expand_path('../lib/konjure/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = 'konjure'
  gem.description   = 'Konjure endows RubyMotion with greater metaprogramming capabilites'
  gem.homepage      = "https://github.com/kastiglione/#{gem.name}"
  gem.version       = Konjure::VERSION

  gem.authors       = ['Dave Lee']
  gem.email         = ['dave@kastiglione.com']

  gem.files         = `git ls-files`.split($\)
  gem.require_paths = ['lib']

  gem.add_dependency 'motion-objc-runtime'

  gem.summary       = <<-END.gsub(/^ +/, '')
    Konjure provides improved metaprogramming facilities to
    RubyMotion. Currently, Konjure provides a no-hack implementation
    of #define_method using the Objective-C runtime.
  END
end
