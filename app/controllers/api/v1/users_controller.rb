module Api
    module V1
      class UsersController < ApplicationController
        
        def index
          users = User.order('created_at ASC')
          render json: { status: 'SUCCESS', message: 'Usuários carregados', data: users },
                 status: :ok
        end
  
        def show
          user = User.find(params[:id])
          render json: { status: 'SUCCESS', message: 'Usuários carregados', data: user },
                 status: :ok
        end
  
        def update
  
          user = User.find(params[:id])
          if user.update(user_params)
            render json: { status: 'SUCCESS', message: 'Updated user', data: user }, status: :ok
          else
            render json: { status: 'ERROR', message: 'User not updated', data: user.erros },
                   status: :unprocessable_entity
          end
        end
  
      def  destroy
        user = User.find(params[:id])
        user.destroy
        render json: {status: 'SUCCESS', message:'User deleted ', data:user},status: :ok
      end
        
        private
  
        def user_params
          params.require(:user).permit(:id, :name, :email, :password)
        end
      end
    end
  end