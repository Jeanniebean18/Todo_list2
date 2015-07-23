class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end
  
  def login
    @user = User.new
  end
  
  def logout
    session[:user_id] = nil
    redirect_to login_path
  end
  # GET /users/1
  # GET /users/1.json
  def show
    if session[:user_id] # && session[:user_id] == params[:id].to_i
      @user = User.find(session[:user_id])
      render :show
    else
      redirect_to login_path
    end
  end
  
  def valid
    @user = User.where(email:params[:user][:email]).first
    if @user.nil?
      @error = true
      redirect_to login_path
    else
      user_password = BCrypt::Password.new(@user.password)
  
      if user_password == params[:user][:password]
        session[:user_id] = @user.id
        redirect_to user_path(@user.id)
      else
        @error = true
        redirect_to login_path
      end
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    if session[:user_id] && session[:user_id] == params[:id].to_i
      @user = User.find(params[:id])
      render :edit
    else
      redirect_to user_path("#{session[:user_id]}")
    end
  end

  # POST /users
  # POST /users.json
  def create
    the_password = BCrypt::Password.create(params[:user][:password])
    @user = User.new(user_params)
    @user.password = the_password
    if @user.save
      redirect_to login_path #should redirect to login after creating profile.
    else
      @error = true
      redirect_to new_user_path
    end
    @user = User.new(user_params)
    
    
  end
  
  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    the_password = BCrypt::Password.create(params[:user][:password])
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    @user.password = the_password
    # if @user.save
    #      redirect_to user_path(@user.id)
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
