module Enumerable
  def take_by(nth)
    sort_by { |elem| yield elem }.take(nth)
  end
end

class Hash
  def top_by_value(nth)
    take_by(nth) { |key, val| -val }
  end
  
  def bottom_by_value(nth)
    take_by(nth) { |key, val| val }
  end
end

WORDS = ARGF.read.downcase.scan(/[a-z]+/)
DICTIONARY = WORDS.reduce(Hash.new(0)) { |dic, word| dic[word] += 1; dic }
p DICTIONARY.top_by_value(30)
p DICTIONARY.bottom_by_value(30)