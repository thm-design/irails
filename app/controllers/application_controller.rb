class ApplicationController < ActionController::Base
  protect_from_forgery

  def set_flash_message(flash_type, flash_message)
    flash[flash_type] = t("flash_messages.#{controller_name}.#{flash_message}")
  end

  def respond_with(response, options = {})
    default_options = {notice: response.notice, error: response.error}
    super(response, default_options.merge(options))
  end
end