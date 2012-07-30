module Module

  # Overwrite the existing useless implementation
  def define_method(name, &block)
    raise  if block.nil?

    signature = Konjure::objc_parameter_signature(block)
    objc_define_method(name, :object, signature, &block)
  end

  def objc_define_method(name, *types, &block)
    return_type, *parameter_types = Konjure::encode_objc_types(types)
    return_type ||= '@'
    parameter_types.join('')

    signature = "#{return_type}@:#{parameter_types}"
    class_replaceMethod(self, name.to_sym, block, signature.UTF8String)

    block
  end

end

module Konjure

  def self.encode_objc_types(types)
    types.flatten.map do |type|
      TYPE_SHORTCUTS[type] || type
    end
  end

  def self.objc_parameter_signature(block)
    '@' * block.arity.abs
  end

  TYPE_SHORTCUTS = {
    bool:       'B',
    boolean:    'B',
    char:       'c',
    class:      '#',
    double:     'd',
    float:      'f',
    id:         '@',
    int:        'i',
    long:       'l',
    long_long:  'q',
    object:     '@',
    pointer:    '^',
    sel:        ':',
    selector:   ':',
    short:      's',
    string:     '*',
    uchar:      'C',
    uint:       'I',
    ulong:      'L',
    ulong_long: 'Q',
    ushort:     'S',
  }

end
