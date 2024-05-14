class PagesController < ApplicationController
  def home
    @dechets = Dechet.all
  end

  def dashboard
  end
end
