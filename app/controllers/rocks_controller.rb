class RocksController < ApplicationController
    def index
        rocks = Rock.all
        render json: rocks
    end

    def create
        rock = Rock.create(rock_params)
        if rock.valid?
            render json: rock
         else
            render json: rock.errors, status: 422
        end
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
