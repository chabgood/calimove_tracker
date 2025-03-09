class HomeController < ApplicationController
  def index
    @schedules = Current.user.schedules
  end
end
