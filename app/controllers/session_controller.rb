class SessionController < ApplicationController
  def create
    # {
    #     "email": "teresa2@teresa.com",
    #     "password": "password"
    # }
    email = params["email"]
    password = params["password"]

    user = User.find_by!(email: email)

    render json: {id: user.id, username: user.username, email: user.email}
  end
end
