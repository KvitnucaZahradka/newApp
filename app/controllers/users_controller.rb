class UsersController < ApplicationController
 before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
 before_action :correct_user, only: [:edit, :update]
 before_action :admin_user, only: :destroy

 # OLD version of index
  #def index
   # @users = User.paginate(page: params[:page])
  #end

 # OLD version of show
  #def show
   #@user = User.find(params[:id])
  #end

 def new
  @user = User.new
 end

 def create
  @user = User.new(user_params)
  if @user.save
    @user.send_activation_email
    #OLD version
    #UserMailer.account_activation(@user).deliver_now
    flash[:info] = "Please check your email to activate your account."
    redirect_to root_url

    ## Before emailing you had this:
    #log_in @user
    #flash[:success] = "Welcome to the Sample App!"
    #redirect_to @user
  else
   render 'new'
  end
 end

 # How hartl had it:
 def edit
  @user = User.find(params[:id])
 end

# beware this is stuff I have coded: from exercise nr. 11.40
 def index
   @users = User.where(activated: true).paginate(page: params[:page])
 end

 def show
   @user = User.find(params[:id])
   redirect_to root_url and return unless @user.activated?
 end


 def update
   @user = User.find(params[:id])
   if @user.update_attributes(user_params)
     flash[:success] = "Profile updated"
     redirect_to @user
   else
     render 'edit'
   end
 end

def destroy
  User.find(params[:id]).destroy
  flash[:success] = "User deleted"
  redirect_to users_url
end


 private

  def user_params
    params.fetch(:user,{}).permit(:name, :email, :password, :password_confirmation)
  #params.require(:user).permit(:name, :email, :password, :password_confirmation)
  # ,{} in fetch was.
  end

  def logged_in_user
    unless logged_in?
       store_location
       flash[:danger] = "Please log in."
       redirect_to login_url
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

 ## hartl had the previous like:
 ## def user_params
 ##  params.require(:user).permit(:name, :email, :password, :password_confirmation)
 ## end

end
