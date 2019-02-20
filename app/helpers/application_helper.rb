module ApplicationHelper

  def semantic_ui_class_for(flash_type)
    {
        success: "positive",
        error: "error",
        alert: "error",
        warning: "warning",
        info: "info",
        notice: "info"
    }[flash_type.to_sym] || flash_type.to_s
  end

  def render_form_error_messages object
    return '' if object.errors.empty?

    messages = object.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
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
