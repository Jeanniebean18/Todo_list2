class ChoresController < ApplicationController
  before_action :set_chore, only: [:show, :edit, :update, :destroy]

  # GET /chores
  # GET /chores.json
  def index
    @chores = Chore.all
  end

  # GET /chores/1
  # GET /chores/1.json
  def show
  end

  # GET /chores/new
  def new
    @chore = Chore.new
  end

  # GET /chores/1/edit
  def edit
  end

  # POST /chores
  # POST /chores.json
  def create
    
    @user = User.find(params[:chore][:user_id])
    @chore = @user.chores.create(chore_params)
    @chore.save
    redirect_to user_path(@user.id)
  end

  # PATCH/PUT /chores/1
  # PATCH/PUT /chores/1.json
  def update
    @chore = Chore.find(params[:id])
    if @chore.done == "false"
      @chore.done ="true"
      @chore.save
      redirect_to user_path(session[:user_id])
    else
      @chore.done ="false"
      @chore.save
      redirect_to user_path(session[:user_id])
    end
  end

  # DELETE /chores/1
  # DELETE /chores/1.json
  def destroy
    @chore = Chore.find(params[:id])
    @chore.destroy
    redirect_to user_path(session[:user_id])
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_chore
    @chore = Chore.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def chore_params
    params.require(:chore).permit(:name, :done, :user_id, :client_id)
  end
end
