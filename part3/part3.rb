#!/usr/bin/ruby
require 'fileutils'

#path = "/home/ubuntu/Documents/Assignments/Linux/Assignment1/part2/daemonLog/logs"
path = "/home/ubuntu/Documents/Assignments/Linux/Assignment1/part3/logs"


#array to hold the names of the log files
fileNames = Array.new
dateArray = Array.new
logFilesGroupedByDate = Array.new

puts "Starting script....."

#check if directory exists
if File.exists?("#{path}")
	#read in file names
	fileNames = Dir.entries(path)
	
	#remove logger.err, logger.out, . and .. from file names array
	fileNames.delete_if {|i| i == "." || i == ".." || i == "logger.err" || i == "logger.out" || i == "logger.pid"}


	#populate date array
	fileNames.each do |name|
		#remove the hour from the log file name to group log files by day
		dateArray.push name.chop.chop.chop
	end
	#remove duplicate days from date array
	dateArray = dateArray.uniq

	#create directory to hold sorted log files
	sortedLogs = "logsSorted"
	Dir.mkdir(sortedLogs)

	#seperate log file names by date into seperate arrays.
	dateArray.each do |day|
		#create a new directory and name it based on a unique day from the log directory.
		Dir.mkdir("#{sortedLogs}/#{day}")
		#for each log file, move the log file that matches the day of the newly created directory into the directory to group log files together by day.
		fileNames.each do |namesToMatch|
			if namesToMatch =~ /#{day}/
				FileUtils.mv("#{path}/#{namesToMatch}", "#{sortedLogs}/#{day}/")
			end
			#create a tar gzipped file for each logger date
			`tar cvzf #{sortedLogs}.tar.gz #{sortedLogs}`
		end
	end

#	fileNames.each do |fileName|
#		if fileName =~ /[0-9]/
#			puts fileName
#		end
#	end

else
	puts "Exiting script as Directory #{path} does not exist "
end

