#####################
#  File existence and properties
#####################

filename = "sample.txt"

if File.exists?(filename)
  puts "#{filename} exists"
end

dirname = "data-files"
Dir.mkdir(dirname) unless File.exists?dirname
File.open("#{dirname}/new-file.txt", 'w'){|f| f.write('Hello world!')}


# count the files in my Downloads directory:
puts Dir.glob('Downloads/*').length   #=> 382

# count all files in my Downloads directory and in sub-directories
puts Dir.glob('Downloads/**/*').length   #=> 308858

# list just PDF files, either with .pdf or .PDF extensions:
puts Dir.glob('Downloads/*.{pdf,PDF}').join(",\n")


