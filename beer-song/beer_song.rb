class BeerSong
  # How ugly :(
  def verse(n)
    current_bottles = "#{n} bottle#{n > 1 ? 's' : n > 0 ? '' : 'no more'}"
    remaining = n - 1
    remaining_bottles = "#{remaining == 0 ? 'no more' : remaining} bottle#{remaining > 1 || remaining.zero? ? 's' : ''}"
    down_bottle = (n == 1 ? 'it' : 'one')

    if n > 0
      "#{current_bottles} of beer on the wall, #{current_bottles} of beer.\nTake #{down_bottle} down and pass it around, #{remaining_bottles} of beer on the wall.\n"
    else
      "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
    end

  end

  def verses(a,b)
    (b..a).map { |x| verse(x) }.reverse.join("\n")
  end
end

module BookKeeping
  VERSION = 3
end