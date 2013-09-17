# Module formatting text
module TextFormatting
  # enum parameters for formatting text
  # @interface
  module IParamFormatting
    # get open broken
    def open_broken
      raise NotImplementedError
    end
    # get close broken
    def close_broken
      raise NotImplementedError
    end
    # get end of line char
    def eof_line_char
      raise NotImplementedError
    end
    # get tab chars
    def tabs
      raise NotImplementedError
    end
  end
end