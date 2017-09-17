WORDS = ARGF.read.downcase.scan(/[a-z]+/)
DICTIONARY = WORDS.reduce(Hash.new(0)) { |dic, word| dic[word] += 1; dic }
p DICTIONARY.sort { |a, b| b[1] <=> a[1] }[0...30]