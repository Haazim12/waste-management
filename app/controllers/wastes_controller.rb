class WastesController < ApplicationController
  def index
    @exams = Examination.all.map { |exam| [exam.exam_type, exam.id] }
    @radioelements = Radioelement.all.map { |radioelement| [radioelement.name, radioelement.id] }
    if params[:search].present?
      @wastes = Waste.where(eliminated: false).search_by_reg_number(params[:search][:query])
    else
      @wastes = Waste.where(eliminated: false)
    end
    @waste = Waste.new
  end

  def show
    @waste = Waste.find(params[:id])
  end

  def new
    @waste = Waste.new
  end

  def create
    @waste = Waste.new(waste_params)
    radioelement = Radioelement.find(params[:waste][:radioelement_id])
    if params[:waste][:waste_type] == "Liquide"
      exam = Examination.find(params[:waste][:examination_id])
      tank = Tank.where(radioelement_id: radioelement.id).first
      @waste.total_volume = exam.volume * params[:waste][:patients_count].to_i
      @waste.tank_id = tank.id
      @waste.examination_id = exam.id
      tank.current_capacity -= @waste.total_volume
    end
    if @waste.save
      if @waste.waste_type == "Liquide"
        tank.save
      end 
      redirect_to waste_path(@waste)
      flash[:notice] = "waste was successfully created."
    else
      flash[:alert] = "waste was not successfully created.#{@waste.errors.full_message.first}"
      redirect_to dechets_path
    end
  end

  def step2
    @waste = current_waste
  end

  def update_step2
    @waste = current_waste
    if @waste.waste_type == "Solide"
      if @waste.update(solid_params2)
        redirect_to waste_path(@waste)
        flash[:notice] = "waste was successfully created."
        session[:waste_id] = nil
      else
        @waste.destroy
        render :step2
      end
    elsif @waste.waste_type == "Liquide"
      if @waste.update(liquid_params)
        redirect_to waste_path(@waste)
        flash[:notice] = "waste was successfully created."
        session[:waste_id] = nil
      else
        render :step2
      end
    end
  end

  def edit
    @waste = Waste.find(params[:id])
  end

  def update
    @waste = Waste.find(params[:id])
    if @waste.update!(waste_params)
      redirect_to waste_path(@waste)
      flash[:notice] = "waste was successfully updated."
    else
      redirect_to waste_path(@waste)
      flash[:error] = "Error: waste was not updated."
    end
  end

  def control
    @waste = Waste.find(params[:id])
    if @waste.waste_type == "Solide"
      if @waste.update(solid_control_params)
        redirect_to waste_path(@waste)
        flash[:notice] = "Sauvegarde effectuée avec succès."
      else
        redirect_to waste_path(@waste)
        flash[:alert] = @waste.errors.full_messages.first
      end
    elsif @waste.waste_type == "Liquide"
      if @waste.update(liquid_control_params)
        redirect_to waste_path(@waste)
        flash[:notice] = "Sauvegarde effectuée avec succès."
      else
        redirect_to waste_path(@waste)
        flash[:alert] = @waste.errors.full_messages.first
      end
    end
  end

  def destroy
    @waste = Waste.find(params[:id])
    @waste.destroy
    redirect_to wastes_path
  end

  def eliminate
    @waste = Waste.find(params[:id])
    @waste.eliminated = true
    @waste.elimination_date = Time.now
    if @waste.save
      redirect_to wastes_path
      flash[:notice] = "waste was successfully eliminated."
    else
      redirect_to wastes_path
      flash[:alert] = "Error: waste was not eliminated."
    end
  end

  private

  def waste_params
    params.require(:waste).permit(:reg_number, :waste_type, :activity, :patients_count, :radioelement_id, :tank_id, :volumic_activity, :risidual_activity, :solid_type, :weight, :infectious, :volume, :bdf, :description)
  end

  def liquid_control_params
    params.require(:waste).permit(:volumic_activity)
  end

  def solid_control_params
    params.require(:waste).permit(:risidual_activity, :bdf)
  end

  def current_waste
    Waste.find(session[:waste_id])
  end
end
