# Module formatting text
module TextFormatting
  # Error: no open broken
  NoOpenBrokenError = Class.new(StandardError)
  # Error: no close broken
  NoCloseBrokenError = Class.new(StandardError)
  # Error: incorrect param type
  ParamTypeError = Class.new(StandardError)
  # Error: incorrect param
  ParamError = Class.new(StandardError)
end