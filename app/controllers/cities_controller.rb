class CitiesController < ApplicationController
  def index
    @city = City.all
  end

  def show


    @my_city = City.find(params[:id])

  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
