module Overrides
  class SessionsController < DeviseTokenAuth::SessionsController

    # def render_create_success
    #   render json: resource.data(resource_json: @resource.token_validation_response)
    # end


  end
end
