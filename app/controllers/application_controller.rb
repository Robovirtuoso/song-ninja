class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  private

  def permitted_params
    @permitted_paramaters ||= PermittedParameters.new(parameters: params, user: current_user)
  end
end
