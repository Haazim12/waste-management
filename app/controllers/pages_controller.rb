class PagesController < ApplicationController
  def home
    @dechets = Dechet.all
  end

  def dashboard
  end

  def calendar
    @wastes = Dechet.all
  end
end
