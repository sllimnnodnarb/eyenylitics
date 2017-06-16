class RegisteredApplicationsController < ApplicationController

  def index
    @reg_apps = RegisteredApplication.all
  end

  def show
    @reg_app = RegisteredApplication.find(params[:id])
    @reg_apps = RegisteredApplication.all
    @events = @reg_app.events.group(:name)
  end

  def new
    @reg_app = RegisteredApplication.new
  end

  def create
    @reg_app = RegisteredApplication.new(reg_app_params)

    if @reg_app.save
      redirect_to registered_applications_path, notice: "Your Registered Aplication has been saved successfully."
    else
      flash.now[:alert] = "Error saving your Registered Application. Please try again."
      render :new
    end
  end

  def edit
    @reg_app = RegisteredApplication.find(params[:id])
  end

  def update
    @reg_app = RegisteredApplication.find(params[:id])
    @reg_app.assign_attributes(reg_app_params)

    if @reg_app.save
      flash[:notice] = "Your Registered Application was successfully updated."
      redirect_to @reg_app
    else
      flash.now[:alert] = "Error saving changes to your Registered Application. Please try again."
      render :edit
    end
  end

  def destroy
    @reg_app = RegisteredApplication.find(params[:id])

    if @reg_app.destroy
      flash[:notice] = "\"#{@reg_app.name}\" was deleted successfully."
      redirect_to registered_applications_path
    else
      flash.now[:alert] = "There was an error deleting your Registered Application. Please try again"
      render :show
    end
  end

  private

  def reg_app_params
    params.require(:registered_application).permit(:name, :url)
  end

end
