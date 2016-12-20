class UsersController < ApplicationController

  respond_to :html # this I added during troubleshooting

  def show
    @user = User.find(params[:id])
    # debugger
  end

  def new
    @user = User.new
  end

  def create
    # @user = User.new(user_params)
    @user = User.create(user_params)
    # respond_to do |format| #also this
      if @user.save
        # format.html do  # and this
        format.html { redirect_to @user }
        flash[:success] = "Welcome and thanks for signing up!"
        # redirect_to @user
        # end
      else
        # format.html { render 'new' }
        format.html { redirect_to new_user_path }
        flass[:warning] = "This did not work, I wonder why..."
      end # ends conditional
    # end #end respond_to
  end # end create

  def edit
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
