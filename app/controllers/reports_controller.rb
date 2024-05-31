# app/controllers/reports_controller.rb
class reports_controller < ApplicationController
    def index
      @start_date = params[:start_date] || 1.month.ago
      @end_date = params[:end_date] || Date.today
      @wastes = Waste.by_date_range(@start_date, @end_date)
  
      @total_wastes = @wastes.count
      @total_radioactivity = @wastes.sum(:activity)
  
      @waste_types = @wastes.group(:waste_type).count
    end
  end
  