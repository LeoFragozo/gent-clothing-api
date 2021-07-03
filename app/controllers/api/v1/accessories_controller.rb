# frozen_string_literal: true

module Api
    module V1
      class AccessoriesController < ApplicationController
        def index
          accessories = Accessory.order('created_at ASC')
          render json: { status: 'SUCCESS', message: 'Acessórios carregados', data: accessories },
                 status: :ok
        end
  
        def show
          accessory = Accessory.find(params[:id])
          render json: { status: 'SUCCESS', message: 'Acessórios carregados', data: accessory },
                 status: :ok
        end
  
        def create
          accessory = Accessory.new(accessory_params)
                  if accessory.save
                      render json: {status: 'SUCCESS', message:'Acessórios salvos', data:accessory},status: :ok
                  else
                      render json: {status: 'ERROR', message:'Acessórios não salvos', data:accessory.erros},status: :unprocessable_entity
                  end
        end
        
        def update
          accessory = Accessory.find(params[:id])
          if accessory.update(accessory_params)
            render json: { status: 'SUCCESS', message: 'Acessórios atualizados', data: accessory }, status: :ok
          else
            render json: { status: 'ERROR', message: 'Acessórios não atualizados', data: accessory.erros },
                   status: :unprocessable_entity
          end
        end
  
        def destroy
          accessory = Accessory.find(params[:id])
          accessory.destroy
          render json: { status: 'SUCCESS', message: 'Acessórios deletados ', data: accessory }, status: :ok
        end
  
        private
  
        def accessory_params
          params.require(:accessory).permit(:id, :description, :dresscode, :color)
        end
      end
    end
  end
  