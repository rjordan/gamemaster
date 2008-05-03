# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def render_gravatar(user)
    gravatar_email = Digest::MD5.hexdigest("#{user.email}")
    "<img src='http://www.gravatar.com/avatar.php?gravatar_id=#{gravatar_email}'/>"
  end
end
