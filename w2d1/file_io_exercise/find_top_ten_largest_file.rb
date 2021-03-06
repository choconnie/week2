# Find the top 10 largest files

# Using the Dir.glob and File.size methods,
# write a script that targets a directory
# – and all of its subdirectories
# – and prints out the names of the 10 files that take up the most disk space.
# Point your script to any subdirectory.
# You will obviously get different results than I do.
# Hint: This exercise does not require a call to File.open

DIRNAME = "data-hold"
Dir.glob("#{DIRNAME}/**/*.*").sort_by{|fname| File.size(fname)}.reverse[0..9].each do |fname|
   puts "#{fname}\t#{File.size(fname)}"
end

# Determine file makeup of directories, print to spreadsheet
# Read the same directory and subdirectories as in the last exercise and determine:
# A breakdown of file types (normalize the file extensions) by number of files
# A breakdown of file types by bytes of disk space used.
# Print the results of this analysis in a single text file,
# in the following spreadsheet-friendly tab-delimited format

DIRNAME = "data-hold"

hash = Dir.glob("#{DIRNAME}/**/*.*").inject({}) do |hsh, fname|
   ext = File.basename(fname).split('.')[-1].to_s.downcase
   hsh[ext] ||= [0,0]
   hsh[ext][0] += 1
   hsh[ext][1] += File.size(fname)   
   hsh
end               
File.open("file-analysis.txt", "w") do |f|
   hash.each do |arr|
     txt = arr.flatten.join("\t")
      f.puts txt
      puts txt
   end
end

