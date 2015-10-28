class GemstonesController < ApplicationController
  def index
    gemstones = Gemstone.all
    render json: gemstones
  end

  def show
    gemstone = Gemstone.find(params[:id])
    render json: gemstone, status: 200
  end

  def create
    gemstone = Gemstone.new(gemstone_params)

    if gemstone.save
      render json: {url: gemstone_path(gemstone), gemstone: gemstone }, status: :created
    else
      render json: gemstone.errors, status: :unprocessable_entities
    end
  end

  def update
    gemstone = Gemstone.find(params[:id])
    if gemstone.update(gemstone_params)
      render json: gemstone, status: 200
    else
      render json: gemstone.errors, status: :unprocessable_entities
    end
  end

  def destroy
    gemstone = Gemstone.find(params[:id])
    gemstone.destroy
    head 204
  end

private
  def gemstone_params
    params.require(:gemstone).permit(:name, :price, :description)
  end
end
