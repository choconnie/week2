#####################
#  Reading from a file
#####################

# file = File.open("sample.txt", "r")
# # Every read operation begins where the last read operation ended.
# contents = file.read
# puts contents #=> Lorem ipsum etc.
# contents = file.read
# puts contents #=> ""

# # Block format
# contents = File.open("sample.txt", "r") { |file| file.read }
# puts contents

# # The method readline reads a singular line.
# # You'll get an "end of file" error when you hit the end of file and then call it again.
# File.open("sample.txt").readlines.each do |line|
#   puts line
# end

# file = File.open("sample.txt", 'r')
# while !file.eof?
#   line = file.readline
#   puts line
# end

require 'open-uri'
url = "http://ruby.bastardsbook.com/files/fundamentals/hamlet.txt"
puts open(url).readline # THE TRAGEDY OF HAMLET, PRINCE OF DENMARK

local_fname = "hamlet.txt"
File.open(local_fname, "w") { |file| file.write(open(url).read)}

File.open(local_fname, "r") do |file|
  file.readlines.each_with_index do |line, index|
    puts line if index % 42 == 41
  end
end


lines = ["Hello world", "  How are you?", "*Fine*, thank you!.", "  OK then."]   
lines.each do |line|
   puts line if line.match(/^  [A-Z]/)
end


is_hamlet_speaking = false
File.open("hamlet.txt", "r") do |file|
   file.readlines.each do |line|

      if is_hamlet_speaking == true && ( line.match(/^  [A-Z]/) || line.strip.empty? )
        is_hamlet_speaking = false
      end

      is_hamlet_speaking = true if line.match("Ham\.")

      puts line if is_hamlet_speaking == true
   end   
end