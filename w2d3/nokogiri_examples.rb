require 'nokogiri'

doc = Nokogiri::HTML(File.open('post.html'))

def extract_usernames(doc)
  doc.search('.comhead > a:first-child').map do |element|
    element.inner_text
  end
end

p extract_usernames(doc)
puts doc.search('.subtext > span:first-child').map { |span| span.inner_text }
p doc.search('.subtext > a:first-child').map { |link| link['href'] } 
p doc.search('.title > a:first-child').map { |link| link.inner_text }
p doc.search('.title > a:first-child').map { |link| link['href'] }
p doc.search('.comment > font:first-child').map { |font| font.inner_text }
