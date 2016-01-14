require 'colorize'
require './comment'


class Post

  attr_accessor :title, :post_user_name, :item_id, :posted_date, :num_of_comments, :url, :points, :comments, :all_comments, :all_comment_users

  def initialize(title, post_user_name, item_id, posted_date, num_of_comments, url, points, all_comments, all_comment_users)
    @title = title
    @post_user_name = post_user_name
    @item_id = item_id
    @posted_date = posted_date
    @num_of_comments = num_of_comments
    @url = url
    @points = points
    @comments = []
  end

  def show
    puts "Post title: #{@title[0]}".red
    puts "Posted by: \t#{@post_user_name[0]}".blue
    #puts @item_id.to_s.blue
    puts "Posted date: \t#{@posted_date[0]}"
    puts "Number of comments: #{@num_of_comments[0]}"
    puts "URL: \t#{@url[0]}".yellow
    puts "Points: #{@points[0]}".green
  end

  def print
    comments.each_with_index do |content, index|
      puts "User name: #{content.return_user_name}\n\n".red
      if index % 2 == 0
        puts "#{content.return_comment}".green
      else
        puts "#{content.return_comment}".blue
      end
    end
  end

end
