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

    decay_time = @dechet.half_life * 10
    @dechet.elimination_date = Time.now + decay_time.days
    respond_to do |format|
      if @dechet.save
        format.html { redirect_to dechet_path(@dechet), notice: "Dechet was successfully created." }
        format.json { render :show, status: :created, location: @dechet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dechet.errors, status: :unprocessable_entity }
      end
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

  def destroy
    @dechet = Dechet.find(params[:id])
    @dechet.destroy
    redirect_to home_path
  end

  private

  def dechet_params
    params.require(:dechet).permit(:reg_number, :radioelement, :waste_type, :activity, :eleminated, :half_life, :elimination_date)
  end
end
