class PermittedParameters
  include Virtus

  attribute :parameters, String
  attribute :user, String

  def current_model(model)
    parameters.require(model).permit!
  end

  def usr
    if user.has_role? :admin
      parameters.require(:user).permit!
    else
      parameters.require(:user).permit(
        :name,
        :email,
        :password,
        :password_confirmation,
        :remember_me
      )
    end
  end
end
