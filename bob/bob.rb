class Bob
  RESPONSES = {
    question: 'Sure.',
    yell: 'Whoa, chill out!',
    silence: 'Fine. Be that way!'
  }.tap { |hash| hash.default = 'Whatever.' }

  def self.hey(remark)
    case remark.gsub(/\s+/, '')
    when /^$/
      RESPONSES[:silence]
    when /(^.+[A-Z]+(!*[1-9]*)*$)|[A-Z]{3,}[^A-Z]?\?/
      RESPONSES[:yell]
    when /\?$/
      RESPONSES[:question]
    else
      RESPONSES.default
    end
  end
end

module BookKeeping
  VERSION = 1
end
