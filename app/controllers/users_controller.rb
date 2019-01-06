class UsersController < ApplicationController
  before_action :authenticate, only: [:show_current]
  
  # In header pass the Authorization key with token value "Bearer Token"
  # Token can be obtained by hitting session API of that user
  #
  def show_current
    resource_serializer = JSONAPI::ResourceSerializer.new(UserResource)
    json = resource_serializer.serialize_to_hash(UserResource.new(@current_user, nil))

    render json: json
  end
end
