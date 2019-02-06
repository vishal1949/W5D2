class SubsController < ApplicationController
  before_action :require_login
  def new

  end 

  def create
    @sub = Sub.new(subs_params)
    @sub.user_id = current_user.id 
    if @sub.save 
      redirect_to subs_url
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new 
    end
  end 

  def index 
    @subs = Sub.all 
  end 

  def edit
    @sub = Sub.find_by(id: params[:id])
  end 

  def update
    @sub = Sub.find_by(id: params[:id])
    if @sub.user_id == current_user.id && @sub.update_attributes(subs_params)
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit 
    end
  end 

  def show
    @sub = Sub.find_by(id: params[:id])
  end 

  private

  def subs_params
    params.require(:subs).permit(:title, :description)
  end 
end
