# frozen_string_literal: true

module Api
  module V1
    class CitiesController < ApplicationController
      def index
        cities = City.order('created_at ASC')
        render json: { status: 'SUCCESS', message: 'Cidades carregadas', data: cities },
               status: :ok
      end

      def show
        city = City.find(params[:id])
        render json: { status: 'SUCCESS', message: 'Cidades carregadas', data: city },
               status: :ok
      end

      def create
        city = City.new(city_params)
				if city.save
					render json: {status: 'SUCCESS', message:'Cidade salvas', data:city},status: :ok
				else
					render json: {status: 'ERROR', message:'Cidade não salvas', data:city.erros},status: :unprocessable_entity
				end
      end
      
      def update
        city = City.find(params[:id])
        if city.update(city_params)
          render json: { status: 'SUCCESS', message: 'Cidades atualizadas', data: city }, status: :ok
        else
          render json: { status: 'ERROR', message: 'Cidades não atualizadas', data: city.erros },
                 status: :unprocessable_entity
        end
      end

      def destroy
        city = City.find(params[:id])
        city.destroy
        render json: { status: 'SUCCESS', message: 'Cidades deletadas ', data: city }, status: :ok
      end

      private

      def city_params
        params.require(:city).permit(:id, :name, :state, :country)
      end
    end
  end
end
