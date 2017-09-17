module Enumerable
  def take_by(nth)
    sort_by { |elem| yield elem }.take(nth)
  end
end

WORDS = ARGF.read.downcase.scan(/[a-z]+/)
DICTIONARY = WORDS.reduce(Hash.new(0)) { |dic, word| dic[word] += 1; dic }
p DICTIONARY.take_by(30) { |key, val| -val }
p WORDS.take_by(30) { |word| -word.length }