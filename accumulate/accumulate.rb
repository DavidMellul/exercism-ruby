class Array
  def accumulate(*parameters)
    result = []

    if block_given?
      if !parameters.size.zero?
        parameters.each { |p| result.push yield p }
      else
        itself.each { |e| result.push yield e }
      end
    end

    result
  end
end

module BookKeeping
  VERSION = 1
end