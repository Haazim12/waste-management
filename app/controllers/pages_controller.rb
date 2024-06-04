class PagesController < ApplicationController
  def home
    @wastes = Waste.all
  end

  def dashboard
  end

  def calendar
    @wastes = Waste.all
  end

  def tanks
    @tanks = Tank.all
    @chart_options = {
      scales: {
        yAxes: [{
          ticks: {
            beginAtZero: true,
          },
        }],
      },
      radius: 30,
    }

    labels = ["Capacité maximale", "Volume occupé:"],
    @tank1 = Tank.find(1)
    @tank2 = Tank.find(2)
    @tank3 = Tank.find(3)

    @data1 = {
      labels: labels,
      datasets: [{
        label: @tank1.radioelement.name.capitalize,
        backgroundColor: ["#3B82F6", "#93C5FD"],
        data: [@tank1.full_capacity, @tank1.current_capacity],
      }],
    }

    @data2 = {
      labels: labels,
      datasets: [{
        label: @tank2.radioelement.name.capitalize,
        backgroundColor: ["#3B82F6", "#93C5FD"],
        data: [@tank2.full_capacity, @tank2.current_capacity],
      }],
    }

    @data3 = {
      labels: labels,
      datasets: [{
        label: @tank3.radioelement.name.capitalize,
        backgroundColor: ["#3B82F6", "#93C5FD"],
        data: [@tank3.full_capacity, @tank3.current_capacity],
      }],
    }
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
