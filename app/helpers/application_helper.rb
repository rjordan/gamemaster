# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def render_gravatar(user)
    if (['production', 'stage'].include?(Rails.env))
      gravatar_email = Digest::MD5.hexdigest("#{user.email}")
      "<img src='http://www.gravatar.com/avatar.php?gravatar_id=#{gravatar_email}'/>".html_safe
    else
      image_tag 'ruby.png'
    end
  end

  def markdown
    @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::XHTML, :autolink => true, :space_after_headers => true)
  end

  def render_markdown(content)
    content_tag :div, class: 'markdown' do
      markdown.render(content).html_safe
    end
  end

  def title(title)
    content_for :title do
      title
    end
  end
end
