#!/usr/bin/env ruby

require 'fileutils'

fileArray = ['file1.txt', 'file2.txt', 'file3.txt']

directory = "newFolder"
Dir.mkdir(directory)
fileArray.each do |fileName|
	FileUtils.mv(fileName, "#{directory}")
end


#file = "file1.txt"
#directory = "newFiles2"
#Dir.mkdir(directory)

#FileUtils.mv(file, "#{directory}")