# frozen_string_literal: true

module Api
    module V1
      class ClothingsController < ApplicationController
        def index
          clothings = Clothing.order('created_at ASC')
          render json: { status: 'SUCCESS', message: 'Roupas carregadas', data: clothings },
                 status: :ok
        end
  
        def show
          clothing = Clothing.find(params[:id])
          render json: { status: 'SUCCESS', message: 'Roupas carregadas', data: clothing },
                 status: :ok
        end
  
        def create
          clothing = Clothing.new(clothing_params)
                  if clothing.save
                      render json: {status: 'SUCCESS', message:'Roupas salvas', data:clothing},status: :ok
                  else
                      render json: {status: 'ERROR', message:'Roupas não salvas', data:clothing.erros},status: :unprocessable_entity
                  end
        end
        
        def update
          clothing = Clothing.find(params[:id])
          if clothing.update(clothing_params)
            render json: { status: 'SUCCESS', message: 'Roupas atualizadas', data: clothing }, status: :ok
          else
            render json: { status: 'ERROR', message: 'Roupas não atualizadas', data: clothing.erros },
                   status: :unprocessable_entity
          end
        end
  
        def destroy
          clothing = Clothing.find(params[:id])
          clothing.destroy
          render json: { status: 'SUCCESS', message: 'Roupas deletadas ', data: clothing }, status: :ok
        end
  
        private
  
        def clothing_params
          params.require(:clothing).permit(:id, :description, :dresscode, :color)
        end
      end
    end
  end
  