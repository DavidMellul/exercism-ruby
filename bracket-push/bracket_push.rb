class Brackets
  PAIRS = {
      '{' => '}',
      '[' => ']',
      '(' => ')'
  }.freeze

  # I believe there might be a magical regex (which I was able to find for simple cases only, not evil nested ones)
  def self.paired?(text)
    stack = []

    text
        .each_char do |char|
      case char
        when /[{(\[]/
          stack << char
        when /[})\]]/
          if char == PAIRS[stack[-1]]
            stack.pop
          else
            return false # God forgive it
          end
      end
    end

    stack.empty?
  end
end

module BookKeeping
  VERSION = 4
end
