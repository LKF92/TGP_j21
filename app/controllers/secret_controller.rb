class SecretController < ApplicationController
  def index
    @secret = params[:secret]
  end

end
