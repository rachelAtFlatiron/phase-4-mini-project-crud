class SpicesController < ApplicationController
    def index 
        spices = Spice.all 
        render json: spices 
    end

    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end

    def destroy 
        spice = Spice.find_by(id: params[:id])
        spice.destroy
        head :no_content
    end 

    def update 
        spice = Spice.find_by(id: params[:id])
        spice.update(spice_params)
        render json: spice
    end

   
    private 

    def spice_params
        params.permit(:title, :image, :rating, :notes, :description) 
    end
end
