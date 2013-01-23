# motion-objc-runtime

motion-objc-runtime exposes the Objective-C runtime API. This allows
RubyMotion to access building blocks necessary to perform advanced
metaprogramming capabilities in RubyMotion.

The Objective-C runtime is exposed the same way RubyMotion exposes C
functions from UIKit and other iOS frameworks, via BrideSupport files
created by the `gen_bridge_metadata` command.

## Installation

Add this line to your RubyMotion app's Rakefile:

    require 'motion-objc-runtime'

## Usage

See Apple's [Objective-C Runtime Reference](https://developer.apple.com/library/ios/documentation/Cocoa/Reference/ObjCRuntimeRef/Reference/reference.html)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
