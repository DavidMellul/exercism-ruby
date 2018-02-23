class Proverb
  def initialize(*args, qualifier: "")
    @words = args
    @qualifier = qualifier.empty? ? qualifier : qualifier + ' '
  end

  def to_s
    @words[0...@words.size - 1].each_with_index.map do |w, i|
      "For want of a #{w} the #{@words[i + 1]} was lost.\n"
    end.join + "And all for the want of a #{@qualifier}#{@words.first}."
  end
end