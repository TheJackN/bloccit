module UsersHelper
  def any_posts?(user)
    no_posts = "<h3>#{user.name} has not submitted any posts yet</h3>"
    if Post.where(user_id: user.id) == []
      no_posts.html_safe
    else
      render user.posts
    end
  end
end
