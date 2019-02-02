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

end
