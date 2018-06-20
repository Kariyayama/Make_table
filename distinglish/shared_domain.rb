domfile    = ARGV.shift
domcomfile = ARGV.shift

phash = Hash.new
file = File.open(domfile, "r")
file.each_line do |line1|
  l1 = line1.split(',')
  pf = l1[0]
  #p l1[1..8]
  #p Array.new(8){0}
  if l1[1..8] == Array.new(8){"0"} then
    phash.store(l1[0], 0)
    #puts line1
  end
end
file.close  

file2 = File.open(domcomfile, "r")
file2.each_line do |linec|
  i = 0
  phash.each_key do |ph|
    i = 1 if linec.include?(ph) 
  end
  puts linec if i == 1
 
end
file2.close
