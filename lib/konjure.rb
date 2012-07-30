require 'motion-objc-runtime'

unless defined? Motion::Project::App
  raise 'This file must be required within a RubyMotion project Rakefile.'
end

Motion::Project::App.setup do |app|
  dirname = File.dirname(__FILE__)
  descendant_ruby_files = Dir["#{dirname}/*/**/*.rb"]
  app.files.insert(0, *descendant_ruby_files)
end
