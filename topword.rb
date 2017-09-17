WORDS = ARGF.read.downcase.scan(/[a-z]+/)
p WORDS
dic = Hash.new(0)
for word in WORDS
  dic[word] += 1
end

p dic.sort { |a, b| b[1] <=> a[1] }[0...30]