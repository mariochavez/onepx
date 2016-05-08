# frozen_string_literal: true
module ApplicationHelper
  def set_error_class(model, field)
    return "error-field" if model.errors[field].any?
    ""
  end
end
