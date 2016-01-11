#####################
#  Creating a file and writing to it
#####################

# string that just represents the filename, not actual file itself
# fname = "sample.txt"
# invokes that File class method open
# requires 2 arguments: filename, read/write mode.
# "w" mode on an existing file will erase the contents of that file.
# use "a" to append to an existing file.
#somefile = File.open(fname, "w")
#somefile.puts "Hello file!"
#somefile.close

# Block notation
# The file handle is automatically closed at the end of the block.
# So, no need to call the close method
# File.open("sample.txt", "a") { |somefile| somefile.puts "Hello Hello!" }


# require 'open_uri_w_redirect_to_https'
# remote_base_url = "http://en.wikipedia.org/wiki"
# remote_page_name = "Chicago"
# remote_full_url = remote_base_url + "/" + remote_page_name

# # open is handled by the Kernel class.
# remote_data = open remote_full_url, redirect_to_https: true
# my_local_file = File.open("my-downloaded-page.html", "w")

# my_local_file.write(remote_data.read)
# my_local_file.close


# Copy Wikipedia's front page to a file using block notation
# require 'rubygems'
# require 'rest-client'

# wiki_url = "http://en.wikipedia.org/"
# wiki_local_filename = "wiki-page.html"

# File.open(wiki_local_filename, "w") do |file|
#   file.write(RestClient.get(wiki_url))
# end



