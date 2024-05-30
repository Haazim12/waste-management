class PagesController < ApplicationController
  def home
    @wastes = Waste.all
  end

  def dashboard
  end

  def calendar
    @wastes = Waste.all
  end

  def archive
    if params[:search].present?
      @wastes = Waste.where(eliminated: true).search_by_reg_number(params[:search][:query])
    else
      @wastes = Waste.where(eliminated: true)
    end
    @waste = Waste.new
  end
end
