class Bst
  include Enumerable

  attr_reader :data, :left, :right

  def initialize(data = nil)
    unless data.nil?
      @data = data
      @left = Bst.new
      @right =  Bst.new
    end
  end

  def insert(node)
    if !empty?
      if node > @data
        @right.insert node
      else
        @left.insert node
      end
    else
      @data = node
      @left = Bst.new
      @right = Bst.new
    end
  end
  

  def empty?
    @data.nil?
  end

  def each(&block)
    return self.to_enum unless block_given?

    unless empty?
      @left.each(&block) unless @left.empty?
      block.call(@data)
      right.each(&block) unless @right.empty?
    end
  end
end

module BookKeeping
  VERSION = 1
end