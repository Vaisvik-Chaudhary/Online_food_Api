module Api
    module V1
      class CartsController < ApplicationController

        before_action :authenticate_user!
        
        
        def index
            @cart= if params[:user_id]
                       Cart.find_by(user_id: params[:user_id])
                   else 
                       Cart.new
                   end

            render json: @cart , status: :ok
        end

        
        def show
            render json: @cart, status: :ok
        end

        def create
        
            @cart = Cart.new(cart_params)
            if @cart.save!
                render json: @cart, status: :created
            else 
                render json: { errors: @cart.errors.full_messages },
                    status: :unprocessable_entity
            end
        end

      
        def update
            @cart = Cart.find(params[:id])

            if @cart.update(cart_obj: params[:cart_obj])
                render json: {status: 'SUCCESS', message: 'item is updated', data:@cart}, status: :ok
            else
            render json: {status: 'ERROR', message: 'item  is not updated', data:@cart.errors}, status: :unprocessable_entity
            end
            render json: @cart ,status: :ok
        end 

       
        def destroy
            @cart= Cart.find(params[:id])
            @cart.destroy
        end
        
        private

            def cart_params
            
                params.permit(cart_obj: {})
            end

      end
    end
  end