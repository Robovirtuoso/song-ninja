class PermittedParameters < Struct.new(:params, :user)

  def current_model(model)
    params.require(model).permit!
  end

  def admin
    if user.has_role? :admin
      params.require(:user).permit!
    else
      params.require(:user).permit(
        :name,
        :email,
        :password,
        :password_confirmation,
        :remember_me
      )
    end
  end
end
