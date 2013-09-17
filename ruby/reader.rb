# Module formatting text
module TextFormatting
  # The reader
  # @abstract
  class Reader
    # Calls the given block once for each character,
    # passing the character as an argument.
    # The stream must be opened for reading or an IOError will be raised.
    # If no block is given, an enumerator is returned instead.
    def each_char
    end
  end
end