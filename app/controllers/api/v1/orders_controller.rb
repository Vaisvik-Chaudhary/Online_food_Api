module Api
    module V1
      class OrdersController < ApplicationController

       before_action :authenticate_user!
        def index
         
                    if params[:user_id]
                        @user=User.find(params[:user_id])
                        if @user.role =="Customer"
                            @orders = Order.where(user_id: params[:user_id]) 
                        elsif @user.role =="Restaurant Owner"
                                @e = Restaurant.find_by(user_id: params[:user_id]) 
                                @orders = Order.where(restaurant_id: @e.id)
                        elsif @user.role =="Delivery Men"
                            x = Delivery.select(:id).where(user_id: params[:user_id])
                            @orders = Order.where(delivery_id: x)
                        end
                    end
                    render json: @orders , status: :ok
        end

        def show
            @order = Order.find(params[:id])
            render json: @order, status: :ok
        end

       
        def create
            @order = Order.new(order_params)
<<<<<<< HEAD

            @order.restaurant_id = Item.find(params[:order][:restaurant_id]).restaurant_id
            @restaurant = Restaurant.find(@order.restaurant_id)
            @order.restaurant_address=@restaurant.restaurant_address
            @order.restaurant_id = Item.find(params[:order][:restaurant_id]).restaurant_id
            @order.delivery_id=Delivery.where(deliveryman_city: Restaurant.find(@order.restaurant_id).restaurant_city).sample.id
=======
            @order.restaurant_id = Item.find(params[:order][:restaurant_id]).restaurant_id
            @restaurant= Restaurant.find(@order.restaurant_id)
            @order.restaurant_address=@restaurant.restaurant_address
            @order.restaurant_id = Item.find(params[:order][:restaurant_id]).restaurant.id
            @order.delivery_id=Delivery.where(deliveryman_city: Restaurant.find(@order.restaurant_id).restaurant_city).sample.id
            
>>>>>>> b1fdc9e7ffa25fd6554d58aef1f0f0ace6982574
            if @order.save!
                render json: {
                    message: 'Details successfully submitted', data:@order
                }, status: :created
            else 
                render json: { errors: @order.errors.full_messages },
                    status: :unprocessable_entity
            end
        end

        def update
            @order = Order.find(params[:id])

            if @order.update(order_params)
            render json: {status: 'SUCCESS', message: 'item is updated', data:@order}, status: :ok
            else
            render json: {status: 'Error', message: 'item  is not updated', data:@order.errors}, status: :unprocessable_entity
            end
        end

   
        def destroy
            @order = Order.find(params[:id])
            @order.destroy
        end

        private

            def order_params
                params.require(:order).permit(:address, :restaurant_id, :item_quantity, :status, :delivery_id, :user_id, :total_price, :restaurant_address, order_obj: {})
            end
<<<<<<< HEAD
  
=======
            def set_delivery_id
                params[:delivery_id]=Delivery.where(deliveryman_city: Restaurant.find(params[:restaurant_city]).restaurant_city).sample.id
            end

>>>>>>> b1fdc9e7ffa25fd6554d58aef1f0f0ace6982574
      end

    end
  end