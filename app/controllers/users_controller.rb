class UsersController < ApplicationController

  # respond_to :html # this I added during troubleshooting

  def show
    respond_to do |format|
      @user = User.find(params[:id])
      format.html { redirect_to new_user_path }
    end
    # debugger
  end

  def new
    @user = User.new
  end

  def create
    # @user = User.new(user_params)
    @user = User.create(user_params)
    #this was addded during troubleshooting
    respond_to do |format|
      if @user.save
        log_in @user
        # format.html do  # and this
        # format.html { redirect_to @user } # error given "too few arguments" !?
        # redirect_to @user
        flash[:success] = "Welcome and thanks for signing in!"
        redirect_to @user
        # end
      else
        render 'new'
        # format.html { render 'new' }
        # format.html { redirect_to new_user_path }
        # redirect_to new_user_path
        flash[:warning] = "This did not work, I wonder why..."
      end # ends conditional
    end #ends respond_to
  end # create

  def edit
    @user = User.find(params[:id])
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
