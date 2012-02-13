class DashboardController < ApplicationController
  before_filter :authenticate_user!
  protect_from_forgery

  def show
  end
end
