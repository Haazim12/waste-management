class DechetsController < ApplicationController
  def index
    @dechets = Dechet.all
  end

  def show
    @dechet = Dechet.find(params[:id])
  end

  def new
    @dechet = Dechet.new
  end

  def create
    @dechet = Dechet.new(dechet_params)
    if @dechet.save
      redirect_to dechets_path
    else
      render :new
    end
  end

  def edit
    @dechet = Dechet.find(params[:id])
  end

  def update
    @dechet = Dechet.find(params[:id])
    if @dechet.update(dechet_params)
      redirect_to dechets_path
    else
      render :edit
    end
  end
end
