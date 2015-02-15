class Users::RegistrationsController < Devise::RegistrationsController

  prepend_before_filter :require_no_authentication, :only => [ :new, :create, :cancel ]
  prepend_before_filter :authenticate_scope!, :only => [:edit, :update, :destroy]

  def create
    add_breadcrumb 'アドミン管理'
    @user = User.new(user_params)
    if @user.save
    else
      render :new
    end
    session[:sign_up_user_attributes] = nil
  end
  
  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
