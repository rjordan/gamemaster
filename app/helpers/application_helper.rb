# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def render_gravatar(user)
    if Rails.configuration.render_gravitar
      gravatar_hash = Digest::MD5.hexdigest("#{user.email.downcase.strip}")
      "<img src='http://www.gravatar.com/avatar/#{gravatar_hash}' />".html_safe
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
