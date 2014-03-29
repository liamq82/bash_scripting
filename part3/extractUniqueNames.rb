#!/usr/bin/ruby
names = Array.new
chopNames = Array.new

names.push "logger.out.2013-05-02-16"
names.push "logger.out.2013-05-02-17"
names.push "logger.out.2013-05-03-16"
names.push "logger.out.2013-05-03-17"

names.each do |name|
	chopNames.push name.chop.chop.chop
end

chopNames = chopNames.uniq

chopNames.each do |days|
	names.each do |namesToMatch|
		puts "Day to match: #{days}"
		puts "Log file to match: #{namesToMatch}"
		if namesToMatch =~ /#{days}/
			puts "match"
		else
			puts "no match"
		end
	end
end

#names.each do |name|
#	if name =~ /logger.out.2013-05-02/
#		puts "day match"
#	end
#end

#me = "hello"
#puts me.chop


