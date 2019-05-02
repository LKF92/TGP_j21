class AuthorsController < ApplicationController


  def index
  end

  def show
    @my_author = User.find(params[:id])
    @my_city = City.find(@my_author.city_id)
  end

  def new
  end

  def create
    @new_user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], city_id: 1, password: params[:password], password_confirmation: params[:password_confirmation])
    if @new_user.save
      log_in(@new_user)

    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
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
