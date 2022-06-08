class SpicesController < ApplicationController
    def index 
        puts "spice#index"
        render json: Spice.all, status: 200
    end 

    def create 
        s = Spice.create!(spice_params)
        render json: s, status: 300
    end 

    def update 
        s = Spice.find(params[:id])
        s.update(spice_params)
        render json: s, status: :ok
    end 

    def destroy 
        s = Spice.find(params[:id])
        s.destroy 
        head :no_content
    end 

    private 

    def spice_params 
        params.permit(:title, :image, :description, :notes, :rating)
    end 
end
