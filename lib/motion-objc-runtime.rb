unless defined? Motion::Project::App
  raise "This file must be required within a RubyMotion project Rakefile."
end

# TODO: Find a good home for the .bridgesupport file
BRIDGESUPPORT_FILE = './objc-runtime.bridgesupport'

SDK_DIR = "Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator%s.sdk"
OBJC_INCLUDE_DIR = 'usr/include/objc'

# TODO: Regenerate bridgesupport when relevant settings have changed
def generate_bridgesupport(config)
  return BRIDGESUPPORT_FILE if File.exist? BRIDGESUPPORT_FILE

  sdk = File.join(config['xcode_dir'], SDK_DIR % config['sdk_version'])
  objc_include_dir = File.join(sdk, OBJC_INCLUDE_DIR)
  gen_bridge_metadata = '/usr/bin/gen_bridge_metadata'
  opts = '--format complete --no-64-bit'
  cflags = "-I#{objc_include_dir}"
  cflags << " -miphoneos-version-min=#{config['deployment_target']}"
  opts << %' --cflags "#{cflags}"'
  header = "#{objc_include_dir}/runtime.h"

  # see man gen_bridge_metadata
  `#{gen_bridge_metadata} #{opts} #{header} > #{BRIDGESUPPORT_FILE}`
end

# Tap into App::setup to appropriately generate the Objective-C
# runtime bridgesupport file after completion of the project's setup
# block. Performing post-setup allows access to the project's config
# settings.
#
# This depends on the RubyMotion toolchain. If it changes structure,
# the technique used here will break.
class << Motion::Project::App
  real_setup = instance_method(:setup).bind(Motion::Project::App)

  # Define a new setup method that calls the real setup method and
  # then, if necessary, generate the bridgesupport file and add it to
  # the configuration.
  define_method :setup do |&block|
    real_setup.call(&block)
    generate_bridgesupport(config.variables)
    configs.each_value do |app|
      unless app.bridgesupport_files.include? BRIDGESUPPORT_FILES
        app.bridgesupport_files << BRIDGESUPPORT_FILE
      end
    end
  end
end
