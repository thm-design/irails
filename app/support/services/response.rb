class Services::Response
  attr_accessor :message, :errors, :result

  def initialize(result)
    @result = result
    @message = nil
    @errors = []
  end

  def with_message(message)
    @message = message
    self
  end
  alias_method :and_message, :with_message

  def with_errors(errors)
    @errors = errors
    self
  end
  alias_method :and_errors, :with_errors

  def success?
    @errors.blank?
  end

  def failure?
    !success?
  end

  def notice
    message if success?
  end

  def error
    message || errors.first if failure?
  end
end