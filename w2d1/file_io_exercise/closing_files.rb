#####################
#  Closing files
#####################

datafile = File.open("sample.txt", "r")
lines = datafile.readlines
datafile.close

lines.each{ |line| puts line }

lines = File.open("sample.txt", "r") { |datafile| datafile.readlines }
lines.each { |line| puts line }