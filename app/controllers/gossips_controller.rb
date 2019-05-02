class GossipsController < ApplicationController

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
    @new_gossip = Gossip.new(title: params[:title], content: params[:content], user_id: 2)
    if @new_gossip.save
      redirect_to root_path
    else
      puts "$$$$$$$$$$$$$$$$$$\n FAILED TO SAVE \n $$$$$$$$$$$$$$$$"
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

end
