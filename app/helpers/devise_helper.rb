module DeviseHelper
  def devise_error_messages!
    return '' if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    html = <<-HTML
    <div class="ui inverted tertiary red segment">
      <div class="ui bulleted list">
      #{messages}
      </div>
    </div>
    HTML

    html.html_safe
  end
end
