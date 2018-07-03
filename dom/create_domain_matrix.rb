require_relative "domain"

listname = ARGV.shift.chomp
listpath = './domtblout'
threshold = 10 ** -3
listhash = Hash.new
domain = Hash.new

File.open(listname, "r").each_line do |list|
  if list.include?('#') then
  else
    organism = list.split('.')[0]
    listhash.store( organism, Domain.new("#{listpath}/#{list.chomp}", threshold))
    #listhash[organism].make_domain_combi
    domain.merge!(listhash[list.split('.')[0]].domain_hash)
  end
end

outfile = File.open('out.csv', "w")
outfile.print "domain,"
listhash.each_key do |key|
  outfile.print "#{key},"
end
outfile.puts ""

domain.each_key do |key_dom|
  outfile.print "#{key_dom},"
  listhash.each_key do |animal|
    if listhash[animal].domain_hash.fetch(key_dom, nil) != nil then
      outfile.print "1,"
    else
      outfile.print "0,"
    end
  end
  outfile.puts ""
end

outfile.close

