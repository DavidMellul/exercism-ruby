class Array
  def keep
    select { |e|  yield e } if block_given?
  end

  def discard
    reject { |e|  yield e } if block_given?
  end
end