class UsersController < ApplicationController

  # In header pass the Authorization key with token value "Bearer Token"
  # Token can be obtained by hitting session API of that user
  #
  def show_current
    authenticate_or_request_with_http_token do |token, options|
      verify_token = JWT.decode token, JWT_SECRET, true, {algorithm: "HS512"}
      user_id = verify_token[0]["sub"]
      puts user_id
      @current_user = User.find(user_id)
    end

    render json: @current_user
  end
end
