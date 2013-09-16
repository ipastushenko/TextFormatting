module TextFormatting
  # The writer
  # @abstract
  class Writer
    # Writes the given string to ios.
    # The stream must be opened for writing.
    # If the argument is not a string, it will be converted to a string using to_s.
    # Returns the number of bytes written.
    def write(string)
    end
  end
end