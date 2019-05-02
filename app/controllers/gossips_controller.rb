class GossipsController < ApplicationController
  before_action :authenticate_user, except: [:index]
  before_action :author_access, only: [:edit, :update, :destroy]


  def index
    @gossip = Gossip.all
  end

  def show
    @my_gossip = Gossip.find(params[:id].to_i)
    @my_author = User.find(@my_gossip.user_id)
    @my_city = City.find(@my_author.city_id)
    puts params

  end

  def new
    @gossip = Gossip.new
  end

  def create
    puts params
    @new_gossip = Gossip.new(title: params[:title], content: params[:content], user_id: current_user.id)
    if @new_gossip.save
      redirect_to root_path
    else
      flash[:danger] = "Error ! You must have a title (between 3 to 12 caracters) and a content"
      render new
    end
  end

  def edit
    @my_gossip = Gossip.find(params[:id])
  end

  def update
    @my_gossip = Gossip.find(params[:id])
    gossips_params = params.require(:gossip).permit(:title, :content)
    if @my_gossip.update(gossips_params)
      redirect_to gossip_path(@my_gossip)
    else
      render :edit
    end
  end

  def destroy
    @my_gossip = Gossip.find(params[:id]).destroy
    redirect_to root_path
    # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
  end

  private

  def authenticate_user
    unless current_user
      flash[:danger] = "You are not logged in ! "
      redirect_to new_session_path
    end
  end

  def author_access
    @author = Gossip.find(params[:id]).user
    unless current_user == @author
      flash[:danger] = "You are not the owner of the gossip ! "
      redirect_to gossip_path(params[:id])
    end
  end
end
