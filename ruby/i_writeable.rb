# Writable interface
# @interface
module IWriteable
  # Write object in to output stream
  # @param @param output[io stream] stream of char with function IO.write
  # raise: IOError
  def write(output)
    raise NotImplementedError
  end
end