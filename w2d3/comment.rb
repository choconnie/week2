class Comment

  attr_accessor :user_name, :comments

  def initialize(user_name, comments)
    @user_name = user_name
    @comments = comments
  end

  # return all comments associated with a particular Post  
  def return_comment
    @comments
  end

  def return_user_name
    @user_name
  end

end
