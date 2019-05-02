class CommentsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  def create
    @comment = @gossip.comments.create(params[:comment].permit(:content))
  end

  private
  def find_gossip
    @gossip =  Gossip.find(params[:id])
  end

  def authenticate_user
    unless current_user
      flash[:danger] = "You are not logged in ! "
      redirect_to new_session_path
    end
  end
end
