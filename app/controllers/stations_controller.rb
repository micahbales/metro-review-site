class StationsController < ApplicationController
  def index
    redirect_to root_path
  end

  def new
    @station = Station.new
  end

  def create

    @station = Station.new(station_params)

    if @station.save
      flash[:error] = "Your station has been successfully added!"
      redirect_to @station
    else
      flash[:error] = "Your station could not be created. Please provide all required information."
      render :new
    end
  end

  def show
    @station = Station.find(params[:id])
  end

  private

  def station_params
    params.require(:station).permit(:name, :line, :state, :description, :parking)
  end
end
