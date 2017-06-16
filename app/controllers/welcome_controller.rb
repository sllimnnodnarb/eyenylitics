class WelcomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @reg_app = RegisteredApplication.first.name
  end

  def about
  end
end
