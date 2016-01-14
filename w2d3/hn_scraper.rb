require 'nokogiri'
require './post'
require './comment'
require 'open-uri'
require 'pry'

def hn_scraper(argv)
  #doc = Nokogiri::HTML(File.open('post.html'))
  doc = Nokogiri::HTML(open(argv))
  
  title = doc.search('.title > a').map { |link| link.inner_text }
  post_user_name = doc.search('.subtext > a:first').map { |a| a.inner_text }
  item_id = doc.search('.subtext > span').map { |span| span['id'] }
  item_id = item_id[0].match(/\d{7}/)
  posted_date = doc.search('.subtext > span:nth(2)').map { |a| a.inner_text }
  num_of_comments = doc.search('.subtext > a:nth(4)').map { |a| a.inner_text }
  url = doc.search('.title > a').map { |link| link['href'] }
  points = doc.search('.subtext > span:first-child').map { |span| span.inner_text }
  all_comments = doc.search('.comment > span').map { |span| span.inner_text }
  all_comment_users = doc.search('.comhead > a').map { |a| a.inner_text }

  post = Post.new(title, post_user_name, item_id, posted_date, num_of_comments, url, points, all_comments, all_comment_users)

  all_comments.each_with_index do |comment, index|
    post.comments << Comment.new(all_comment_users[index], comment)
  end

  post.show
  post.print

end

argv = ARGV[0]  # ex) https://news.ycombinator.com/item?id=7663775
hn_scraper(argv)

######  $ ruby hn_scraper.rb https://news.ycombinator.com/item?id=7663775