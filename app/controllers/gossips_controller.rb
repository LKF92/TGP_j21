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

    # Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
    # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le potin créé)

  end

  def edit
    # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
  end

  def update
    # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params
    # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
  end

  def destroy
    # Méthode qui récupère le potin concerné et le détruit en base
    # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
  end

end
