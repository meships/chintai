class PropertiesController < ApplicationController
  def index
    @properties = Property.all
  end

  def new
    @Property = Property.new
  end

  def show
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

    def set_property
      @property = Property.find(params[:id])
    end

    def property_params
      params.require(:property).permmit(:property_name, :price, :address, :age, :comment, nearest_stations_attributes:[:id, :line, :station_name, :walk_by])
    end
end
