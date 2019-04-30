class HomeController < ApplicationController
  def index
    @my_gossips = Gossip.all
    @id_page = params[:id].to_i
  end

end
