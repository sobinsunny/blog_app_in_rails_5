module UsersHelper
  def error_message(form, feild)
    if form.object.errors[feild].present?
      error_messsage = feild.to_s.humanize + ' ' + form.object.errors[feild].try(:first).to_s
      content_tag(:div, error_messsage, class: 'help-inline') if form.object.errors.present?
    end
  end
end
