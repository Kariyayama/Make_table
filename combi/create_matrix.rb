require_relative "domain"

listname = ARGV.shift.chomp
listpath = './domtblout/'
threshold = 10 ** -3
listhash = Hash.new
domcom = Hash.new

File.open(listname, "r").each_line do |list|
  if list.include?('#') then
  else
    organism = list.split('.')[0]
    listhash.store( organism, Domain.new("#{listpath}/#{list.chomp}", threshold))
    listhash[organism].create_domain_combi
    domcom.merge!(listhash[list.split('.')[0]].domcom)
  end
end

outfile = File.open('out.csv', "w")
listhash.each_key do |key|
  outfile.print "#{key},"
end
outfile.puts "domain1,domain2"

domcom.each_key do |key_combi|
  listhash.each_key do |animal|
    if listhash[animal].domcom.fetch(key_combi, nil) != nil then
      outfile.print "1,"
    else
      outfile.print "0,"
    end
  end
  outfile.puts "#{key_combi.join(',')}"
end

outfile.close

