# Konjure

Konjure provides improved metaprogramming facilities to
RubyMotion. Currently, Konjure provides a no-hack implementation of
`define_method` using the Objective-C runtime.

More metaprogramming to come. There will be gotchas.

## Installation

Add this line to your app's Rakefile:

    require 'konjure'

## Usage

### define_method

Use define_method only for methods that will be called from within
Ruby code, or methods called from Objective-C code that take and
return objects. For methods that have alternative signatures, use
`objc_define_method`.

Note: At this time, using define_method with a block that contains
mutltiple default values results in undefined behavior.

### objc_define_method

As the name suggests, this is an Objective-C variation on
`define_method` that allows the caller to precisely declare the method
signatures. This method can be used to generate delegate methods or
other methods called by Objective-C calling code.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
