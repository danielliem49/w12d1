class Api::PokemonController < ApplicationController

    def types
        render json: Pokemon::TYPES
    end

    def index
        @pokemons = Pokemon.all
        render :index
    end

    def show
        @pokemon = Pokemon.find_by(id: params[:id])
        render json: @pokemon
    end


end
