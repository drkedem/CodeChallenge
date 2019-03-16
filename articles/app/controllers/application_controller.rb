class ApplicationController < ActionController::Base
  protect_from_forgery
  skip_before_action :verify_authenticity_token, if: :json_request?
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  protected
    def json_request?
      request.format.json?
    end
    
  private
    def record_not_found(error)
      render json: { error: error.message }, status: :not_found
    end
      
end
