module Api
    module V1
      class CartitemsController < ApplicationController

      
        def index
            @cartitems=Cartitem.all
            render json: @cartitems , status: :ok
        end

       
        def show
            render json: @cartitem, status: :ok
        end

       
        def create
            @cartitem = Cartitem.new(cartitem_params)
            if @cartitem.save!
                render json: @cartitem, status: :created
            else 
                render json: { errors: @cartitem.errors.full_messages },
                    status: :unprocessable_entity
            end
        end

     
        def update
            unless @cartitem.update(cartitem_params)
                render json: { errors: @cartitem.errors.full_messages },
                    status: :unprocessable_entity
            end
        end

       
        def destroy
            @cartitem.destroy
        end
        private

            def cartitem_params
                params.permit(:user_id)
            end

            def set_cartitem
                @cartitem= Cartitem.find(params[:id])
            end
        
  
      end
    end
  end