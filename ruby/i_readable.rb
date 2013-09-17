# Readable interface
# @interface
module IReadable
  # Create new object with input stream
  # @param input[io stream] stream of char with function IO.each_char
  # @return new object or nil
  # raise: IOError, EOFError
  def self.read(input)
    raise NotImplementedError
  end
end