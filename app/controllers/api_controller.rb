class ApiController < ActionController::API
  # helper
  private def json_response(object, status = :ok, message = nil)
    # convert model to hash and lower case keys
    data = Hash[object.attributes.map { |k, v| [k.to_s.underscore.to_sym, convert_hash_keys(v)] }]

    render json: {
            status: status == :ok ? "success" : "failed",
            message: message,
            payload: data},
          status: status
  end
end
