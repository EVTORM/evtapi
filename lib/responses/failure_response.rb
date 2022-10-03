class FailureResponse
  def initialize(status_code = 404, data = nil, message = nil)
    @data = data
    @status = status_code
    case @status
    when 400 then @message = message || "Bad Request"
    when 401 then @message = message || "Unauthorize"
    when 403 then @message = message || "Forbidden"
    when 404 then @message = message || "Not Found"
    when 405 then @message = message || "Method Not Allowed"
    when 429 then @message = message || "Too Many Requests"
    else @message = message || "Internal Server Error"
    end
  end

  def content
    return JSON.generate(
      {
        status: @status,
        message: @message
      }
    ) if @data.nil?
    JSON.generate(
      {
        status: @status,
        message: @message,
        data: @data
      }
    )
  end

  def status_code
    case @status
    when 400 then :bad_request
    when 401 then :unauthorized
    when 403 then :forbidden
    when 404 then :not_found
    when 405 then :method_not_allowed
    when 429 then :too_many_requests
    else :internal_server_error
    end
  end
end
