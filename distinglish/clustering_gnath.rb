domfile    = ARGV.shift
domcomfile = ARGV.shift

phash = Hash.new
file = File.open(domfile, "r")
file.each_line do |line1|
  l1 = line1.split(',')
  pf = l1[0]
  if l1[1..9] == Array.new(9){"0"} then
    phash.store(l1[0], 0)
  end
end
file.close  


file2 = File.open(domcomfile, "r")
file2.each_line do |linec|
  i = 0
  lc = linec.chomp.split(',')
  if phash.fetch(lc[-2],nil) == nil && phash.fetch(lc[-1], nil) == nil  then  puts "#{linec.chomp},class2"
  elsif phash.fetch(lc[-2],nil) == nil || phash.fetch(lc[-1], nil) == nil  then  puts "#{linec.chomp},class1"
  else puts "#{linec.chomp},uniq"
  end
end
file2.close
