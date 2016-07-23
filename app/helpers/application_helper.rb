module ApplicationHelper
  def flash_class(level)
    case level.to_sym
    when :success then 'alert-success'
    when :error then 'alert-danger'
    when :notice then 'alert-info'
    else 'alert-danger'
    end
  end
end
