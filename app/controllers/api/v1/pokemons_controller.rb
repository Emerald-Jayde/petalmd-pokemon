module Api
  module V1
    class PokemonsController < ApplicationController

      rescue_from ActiveRecord::RecordNotFound do |e|
        render_not_found
      end

      rescue_from ActiveRecord::RecordNotUnique do |e|
        render_record_not_unique
      end

      # GET /pokemons
      def index
        @pokemons = Pokemon.all
        unless @pokemons.any?
          render status: :ok,
                 json: {
                   status: 'Database empty',
                   message: 'There are no Pokemon to show!'
                 }
        end

        if params[:page].present?
          pagination = (params[:limit] || 100)
          @pokemons = @pokemons.page(params[:page]).per(pagination)
        end

        render status: :ok, # 200
               json: @pokemons
      end

      # GET /pokemons/:id
      def show
        @pokemon = Pokemon.find(params[:id])
        render status: :ok,
               json: @pokemon
      end

      # POST /pokemons
      def create
        @pokemon = Pokemon.new(pokemon_params)
        if @pokemon.save
          render status: :created,
                 json: @pokemon
        else
          render status: :unprocessable_entity,
                 json: {
                   errors: [
                     {
                       status: 'Create failed',
                       message: 'An error occurred while creating a new Pokemon.',
                       data: pokemon_params,
                     }
                   ]
                 }
        end
      end

      # PATCH/PUT /pokemons/:id
      def update
        @pokemon = Pokemon.find(params[:id])
        if @pokemon.update(pokemon_params)
          render status: :ok,
                 json: @pokemon
        else
          render status: :unprocessable_entity,
                 json: {
                   errors: [
                     {
                       status: 'Update failed',
                       message: "An error occurred while updating Pokemon with id: #{params[:id]}.",
                       data: pokemon_params,
                     }
                   ]
                 }
        end
      end

      # DELETE /pokemons/:id
      def destroy
        @pokemon = Pokemon.find(params[:id])
        name = @pokemon.name
        @pokemon.destroy

        render status: :ok,
               json: {
                 message: "#{name} (id: #{params[:id]}) has been deleted!"
               }
      end

      private

      def render_not_found
        render status: :not_found,
               json: {
                 errors: [
                   {
                     status: 'Not Found',
                     message: "No Pokemon found with id #{params[:id]}."
                   }
                 ]
               }
      end

      def render_record_not_unique
        render status: :unprocessable_entity,
               json: {
                 errors: [
                   {
                     status: 'Record not unique',
                     message: "Pokemon must have unique names. Pokemon with name '#{params[:name]}' already exists.",
                     data: pokemon_params,
                   }
                 ]
               }
      end
      def pokemon_params
        params.require(:pokemon).permit(:name, :type_1, :type_2, :total, :hp,
          :attack, :defense, :sp_atk, :sp_def, :speed, :generation, :legendary)
      end
    end
  end
end
