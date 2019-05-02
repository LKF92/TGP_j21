class CommentsController < ApplicationController

def create 
  @comment = @gossip.comments.create(params[:comment].permit(:content))

end


private
def find_gossip
  @gossip =  Gossip.find(params[:id])
end
