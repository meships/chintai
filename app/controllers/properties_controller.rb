class PropertiesController < ApplicationController
  before_action :set_property, only: %i[ show edit update destroy] 
  #before_action :nearest_stations, only: %i[ show edit update]
  def index
    @properties = Property.all
  end

  def new
    @property = Property.new
    2.times { @property.nearest_stations.build }
  end

  def show
  end

  def edit
    @property.nearest_stations.build
  end

  def create
    @property = Property.new(property_params)
      if @property.save
        redirect_to @property, notice: "物件を登録しました" 
      else
        render :new
      end
  end

  def update
  end

  def destroy
  end

  private

    def set_property
      @property = Property.find(params[:id])
    end

    def set_nearest_stations
      @nearest_stations = @property.nearest_stations
    end

    def property_params
      params.require(:property).permit(:name, :price, :address, :age, :comment, nearest_stations_attributes:[:id, :line, :station_name, :walk_by])
    end
end
