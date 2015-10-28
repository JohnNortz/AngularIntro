module API
  class GemstonesController < ApplicationController

    def index
      @gemstones = Gemstone.all
      render json: @gemstones, status: 200
    end

    def show
      gemstone = Gemstone.find(params[:id])
      render json: gemstone, status: 200
    end

    def create
      gemstone = Gemstone.new(params[:id])

      if gemstone.save
        render json: gemstone.update(gemstone_params), status: :created
      else
        render json: gemstone.errors, status: :unprocessable_entities
      end
    end

    def update
      gemstone = Gemstone.find(params[:id])
      if gemstone.update(gemstone_params).save
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
end
