class UserResource < JSONAPI::Resource
  attributes :username, :email, :password, :password_confirmation

  # {
  #     "data":{
  #         "type": "users",
  #         "attributes":{
  #             "username": "teresa",
  #             "email": "teresa@teresa.com",
  #             "password": "password",
  #             "password-confirmation": "password"
  #         }
  #     }
  # }
  #
  # Password is being returned back to the user, we need to disable that.
  # What fields are visible when getting resources is done by the fetchable fields
  def fetchable_fields
    super - [:password, :password_confirmation]
  end
end
