module Enumerable
  def take_by(nth)
    sort_by { |elem| yield elem }.take(nth)
  end
end

class Hash
  def top_by_value(nth, &blk)
    blk = opt unless blk
    take_by_value(nth, opt(false), &blk)
  end
  
  def bottom_by_value(nth, &blk)
    blk = opt unless blk
    take_by_value(nth, opt, &blk)
  end
  
  private
  
  def take_by_value(nth, sort_opt)
    select { |key, val| yield val }.take_by(nth) { |key, val| sort_opt[val] }
  end
  
  def opt(flag=true)
    lambda { |v| flag ? v : -v }
  end
end

WORDS = ARGF.read.downcase.scan(/[a-z]+/)
DICTIONARY = WORDS.reduce(Hash.new(0)) { |dic, word| dic[word] += 1; dic }
p DICTIONARY.top_by_value(30){ |val| val < 400}
p DICTIONARY.bottom_by_value(30) { |val| val > 400 }