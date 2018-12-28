class ApiController < ActionController::API
  # helper
  private def json_response(object, status = :ok, message = nil)
    render json: {
            status: status == :ok ? "success" : "failed",
            message: message,
            payload: object},
          status: status
  end
end
