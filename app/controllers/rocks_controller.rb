class RocksController < ApplicationController
    def index
        rocks = Rock.all
        render json: rocks
    end

    def create
        rock = Rock.create(rock_params)
        render json: rock
    end

    private
    def rock_params
        params.require(:rock).permit(:name, :age, :enjoys, :image)
    end

    def update
    end

    def destroy
    end
end
