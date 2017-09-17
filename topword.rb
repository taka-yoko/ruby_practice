dic = Hash.new(0)

while line = ARGF.gets
  line.downcase!
  while line.sub!(/[a-z]+/, "")
    word = $&
    dic[word] += 1
  end
end

p dic.sort { |a, b| b[1] <=> a[1] }[0...30]